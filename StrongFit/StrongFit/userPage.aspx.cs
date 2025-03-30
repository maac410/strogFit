using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Web.UI;

namespace StrongFit
{
    public partial class WebForm5 : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userId"] == null)
            {
                Response.Write("<script>alert('Error: You must be logged in to view this page.');</script>");
                exerciseListLiteral.Text = "<li>Error: Please log in.</li>";
                dietaListLiteral.Text = "<li>Error: Please log in.</li>";
                return;
            }

            int userId = Convert.ToInt32(Session["userId"]);
            Response.Write($"<script>console.log('User ID from session: {userId}');</script>");

            if (Request.HttpMethod == "POST")
            {
                string exerciseId = Request.Form["exerciseId"];
                string selectedDate = Request.Form["selectedDate"];

                if (!string.IsNullOrEmpty(exerciseId))
                {
                    InsertExerciseToCalendar(exerciseId, userId.ToString(), selectedDate);
                }
            }

            if (!IsPostBack)
            {
                // Clear existing content first
                exerciseListLiteral.Text = "";
                dietaListLiteral.Text = "";

                // Load exercises - DISTINCT to prevent duplicates
                List<Exercise> exercises = GetUserExercises(userId);
                if (exercises.Count > 0)
                {
                    foreach (var exercise in exercises)
                    {
                        string imagePath = $"/Resources/images/Ejercicios/ejercicio{exercise.Id}.png";
                        exerciseListLiteral.Text += $@"
                            <div class='exercise-item' id='exercise-{exercise.Id}'>
                                <h4>{exercise.Nombre}</h4>
                                <img src='{imagePath}' alt='Exercise Image' onerror=""this.onerror=null; this.src='/Resources/images/Ejercicios/default.png';"" />
                                <p><strong>Series:</strong> {exercise.Series}</p>
                                <p><strong>Repeticiones:</strong> {exercise.Repeticiones}</p>
                                <p><strong>Descripción:</strong> {exercise.Descripcion}</p>
                                <p><strong>Guía:</strong> {exercise.Guía}</p>
                                <label for='date-{exercise.Id}'>Añadir al calendario</label>
                                <input type='date' id='date-{exercise.Id}' name='selectedDate' required onchange='submitForm({exercise.Id}, this.value)' />
                            </div>";
                    }
                }
                else
                {
                    exerciseListLiteral.Text = "<li>No exercises found for this user.</li>";
                }

                // Load diet - fixed query
                List<Diet> diets = GetUserDiet(userId);
                if (diets.Count > 0)
                {
                    foreach (var diet in diets)
                    {
                        string imagePath = $"/Resources/images/Dietas/dieta{diet.Id}.png";
                        dietaListLiteral.Text += $@"
                            <div class='diet-item' id='diet-{diet.Id}'>
                                <h4>{diet.Nombre}</h4>
                                <img src='{imagePath}' alt='Diet Image' onerror=""this.onerror=null; this.src='/Resources/images/Dietas/default.png';"" />
                                <p><strong>Calorías:</strong> {diet.Calorias}</p>
                                <p><strong>Proteínas:</strong> {diet.Proteinas}</p>
                                <p><strong>Carbohidratos:</strong> {diet.Carbohidratos}</p>
                                <p><strong>Grasas:</strong> {diet.Grasas}</p>
                                <p><strong>Ingredientes:</strong> {diet.Ingredientes}</p>
                                <p><strong>Preparación:</strong> {diet.Descripcion}</p>
                                <p><strong>Guía:</strong> {diet.Guia}</p>
                            </div>";
                    }
                }
                else
                {
                    dietaListLiteral.Text = "<li>No diet plans found for this user.</li>";
                }
            }
        }

        protected void InsertExerciseToCalendar(string ejercicioId, string userId, string selectedDate)
        {
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
                using (MySqlConnection conn = new MySqlConnection(connectionString))
                {
                    conn.Open();
                    string query = @"INSERT INTO ent_personalizados (ejercicio_id, usuario_id, fecha_entrenamiento) 
                                   VALUES (@ejercicioId, @usuarioId, @fechaEntrenamiento)";

                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@ejercicioId", ejercicioId);
                        cmd.Parameters.AddWithValue("@usuarioId", userId);
                        cmd.Parameters.AddWithValue("@fechaEntrenamiento", selectedDate);
                        cmd.ExecuteNonQuery();
                    }
                }
                Response.Write("<script>alert('Exercise added to calendar successfully.');</script>");
            }
            catch (Exception ex)
            {
                Response.Write($"<script>console.error('Insert Error: {ex.Message}');</script>");
            }
        }

        protected List<Exercise> GetUserExercises(int userId)
        {
            List<Exercise> exercises = new List<Exercise>();
            string connectionString = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;

            using (MySqlConnection conn = new MySqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    // Modified query to get DISTINCT exercises
                    string query = @"
                        SELECT DISTINCT e.id, e.nombre, e.series, e.repeticiones, e.descripcion, e.guia
                        FROM entrenamientos e
                        JOIN ent_personalizados ep ON e.id = ep.ejercicio_id
                        WHERE ep.usuario_id = @userId";

                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@userId", userId);

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                exercises.Add(new Exercise
                                {
                                    Id = reader.GetInt32("id"),
                                    Nombre = reader.GetString("nombre"),
                                    Series = reader.GetInt32("series"),
                                    Repeticiones = reader.GetInt32("repeticiones"),
                                    Descripcion = reader.GetString("descripcion"),
                                    Guía = reader.GetString("guia")
                                });
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    Response.Write($"<script>console.error('Exercise SQL Error: {ex.Message}');</script>");
                }
            }
            return exercises;
        }
        protected List<Diet> GetUserDiet(int userId)
        {
            List<Diet> diets = new List<Diet>();
            string connectionString = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;

            // First get user's preference from objetivos
            string userPreference = GetUserPreference(userId);
            if (string.IsNullOrEmpty(userPreference))
            {
                Response.Write("<script>console.log('No diet preference found for user');</script>");
                return diets;
            }

            // Map objetivo values to match dieta table
            string dietPreference = MapPreferenceToDiet(userPreference);

            using (MySqlConnection conn = new MySqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    // Query to get both personalized diets AND general diets matching preference
                    string query = @"
                SELECT DISTINCT d.id, d.nombre, d.calorias, d.proteinas, d.carbohidratos, 
                       d.grasas, d.ingredientes, d.descripcion, d.guia
                FROM dieta d
                LEFT JOIN dieta_personalizados dp ON d.id = dp.dieta_id AND dp.usuario_id = @userId
                WHERE dp.usuario_id = @userId OR d.objetivo = @dietPreference
                ORDER BY CASE WHEN dp.usuario_id IS NOT NULL THEN 0 ELSE 1 END"; // Personalized diets first

                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@userId", userId);
                        cmd.Parameters.AddWithValue("@dietPreference", dietPreference);

                        Response.Write($"<script>console.log('Executing diet query with preference: {dietPreference}');</script>");

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                diets.Add(new Diet
                                {
                                    Id = reader.GetInt32("id"),
                                    Nombre = reader.GetString("nombre"),
                                    Calorias = reader.GetInt32("calorias"),
                                    Proteinas = reader.GetString("proteinas"),
                                    Carbohidratos = reader.GetString("carbohidratos"),
                                    Grasas = reader.GetString("grasas"),
                                    Ingredientes = reader.GetString("ingredientes"),
                                    Descripcion = reader.GetString("descripcion"),
                                    Guia = reader.GetString("guia")
                                });
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    Response.Write($"<script>console.error('Diet SQL Error: {ex.Message}');</script>");
                }
            }
            return diets;
        }

        private string GetUserPreference(int userId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            string preference = "";

            using (MySqlConnection conn = new MySqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    string query = "SELECT preferencia FROM objetivos WHERE usuario_id = @userId";

                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@userId", userId);
                        object result = cmd.ExecuteScalar();
                        if (result != null)
                        {
                            preference = result.ToString();
                            Response.Write($"<script>console.log('User preference from DB: {preference}');</script>");
                        }
                    }
                }
                catch (Exception ex)
                {
                    Response.Write($"<script>console.error('Preference SQL Error: {ex.Message}');</script>");
                }
            }
            return preference;
        }

        private string MapPreferenceToDiet(string userPreference)
        {
            // Convert objetivos.preferencia to dieta.objetivo format
            switch (userPreference.ToLower())
            {
                case "subir de peso":
                    return "subir de peso";
                case "bajar de peso":
                    return "bajar de peso";
                case "mantener peso":
                    return "mantener peso";
                default:
                    return userPreference.ToLower(); // fallback
            }
        }
        public class Exercise
        {
            public int Id { get; set; }
            public string Nombre { get; set; }
            public int Series { get; set; }
            public int Repeticiones { get; set; }
            public string Descripcion { get; set; }
            public string Guía { get; set; }
        }

        public class Diet
        {
            public int Id { get; set; }
            public string Nombre { get; set; }
            public int Calorias { get; set; }
            public string Proteinas { get; set; }
            public string Carbohidratos { get; set; }
            public string Grasas { get; set; }
            public string Ingredientes { get; set; }
            public string Descripcion { get; set; }
            public string Guia { get; set; }
        }
    }
}