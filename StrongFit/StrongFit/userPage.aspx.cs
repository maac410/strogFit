using System;
using System.Collections.Generic;
using System.Configuration;
using System.Web.UI;
using MySql.Data.MySqlClient;

namespace StrongFit
{
    public partial class WebForm5 : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userId"] == null)
            {
                // Redirect to login page or display a message
                Response.Write("<script>alert('Error: You must be logged in to view exercises.');</script>");
                exerciseListLiteral.Text = "<li>Error: Please log in to see exercises.</li>";
                return;
            }

            int userId = Convert.ToInt32(Session["userId"]);
            Response.Write($"<script>console.log('User ID from session: {userId}');</script>");

            if (Request.HttpMethod == "POST")
            {
                string exerciseId = Request.Form["exerciseId"];
                string selectedDate = Request.Form["selectedDate"];

                InsertExerciseToCalendar(exerciseId, userId.ToString(), selectedDate);
            }

            if (!IsPostBack)
            {
                List<Exercise> exercises = GetUserExercises(userId);

                if (exercises.Count > 0)
                {
                    foreach (var exercise in exercises)
                    {
                        string imagePath = $"/Resources/images/Ejercicios/ejercicio{exercise.Id}.png";

                        string exerciseHtml = $@"
<div class='exercise-item' id='exercise-{exercise.Id}'>
    <h4>{exercise.Nombre}</h4>
    <img src='{imagePath}' alt='Exercise Image' 
        onerror=""this.onerror=null; this.src='/Resources/images/Ejercicios/default.png';"" />
    <p><strong>Series:</strong> {exercise.Series}</p>
    <p><strong>Repeticiones:</strong> {exercise.Repeticiones}</p>
    <p><strong>Descripción:</strong> {exercise.Descripcion}</p>
    <p><strong>Guía:</strong> {exercise.Guía}</p>
    <label for='date-{exercise.Id}'>Añadir al calendario</label>
    <input type='date' id='date-{exercise.Id}' name='selectedDate' required 
        onchange='submitForm({exercise.Id}, this.value)' />
</div>";


                        exerciseListLiteral.Text += exerciseHtml;
                    }
                }
                else
                {
                    exerciseListLiteral.Text = "<li>No exercises found for this user.</li>";
                }
            }
        }

        protected void InsertExerciseToCalendar(string ejercicioId, string userId, string selectedDate)
        {
            try
            {
                int ejercicioIdInt = Convert.ToInt32(ejercicioId);
                int userIdInt = Convert.ToInt32(userId);
                string connectionString = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;

                using (MySqlConnection conn = new MySqlConnection(connectionString))
                {
                    conn.Open();
                    string query = @"INSERT INTO ent_personalizados (ejercicio_id, usuario_id, fecha_entrenamiento) 
                                     VALUES (@ejercicioId, @usuarioId, @fechaEntrenamiento)";

                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@ejercicioId", ejercicioIdInt);
                        cmd.Parameters.AddWithValue("@usuarioId", userIdInt);
                        cmd.Parameters.AddWithValue("@fechaEntrenamiento", selectedDate);
                        cmd.ExecuteNonQuery();
                    }
                }
                Response.Write("Exercise added to calendar successfully.");
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

                    // Fix collation issues by casting the `tipo_objetivo` field
                    string query = @"
                        SELECT e.id, e.nombre, e.series, e.repeticiones, e.descripcion, e.guia, o.tipo_objetivo
                        FROM entrenamientos e
                        JOIN objetivos o ON BINARY e.tipo_objetivo = BINARY o.tipo_objetivo
                        WHERE o.usuario_id = @userId";

                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@userId", userId);

                        // DEBUG: Log SQL Query before execution
                        string debugQuery = query.Replace("@userId", userId.ToString());
                        Response.Write($"<script>console.log('Executing SQL: {debugQuery}');</script>");

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.HasRows)
                            {
                                reader.Read();
                                string tipoObjetivo = reader["tipo_objetivo"].ToString();

                                // Log retrieved objective type
                                Response.Write($"<script>console.log('Tipo Objetivo: {tipoObjetivo}');</script>");

                                do
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
                                } while (reader.Read());
                            }
                            else
                            {
                                Response.Write("<script>console.warn('No exercises found for this user');</script>");
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    Response.Write($"<script>console.error('SQL Error: {ex.Message}');</script>");
                }
            }
            return exercises;
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
    }
}
