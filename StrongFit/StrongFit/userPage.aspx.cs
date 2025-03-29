using System;
using System.Collections.Generic;
using System.Web.UI;
using MySql.Data.MySqlClient;

namespace StrongFit
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        // A method to retrieve exercises from the database
        protected List<Exercise> GetUserExercises(int userId)
        {
            List<Exercise> exercises = new List<Exercise>();

            // Replace this with your connection string
            string connectionString = "Server=localhost;Database=strongfit;Uid=root;Pwd=password;";
            using (MySqlConnection conn = new MySqlConnection(connectionString))
            {
                try
                {
                    conn.Open();

                    string query = @"SELECT e.nombre, e.series, e.repeticiones, e.descripcion, e.guia
                                     FROM entrenamientos e
                                     JOIN ent_personalizados ep ON e.id = ep.entrenamieto_id
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
                    // Log the error or handle it accordingly
                    Console.WriteLine("Error: " + ex.Message);
                }
            }

            return exercises;
        }

        // Save exercise to ent_personalizados table
        protected void SaveExerciseToPersonalized(int userId, Exercise exercise)
        {
            string connectionString = "Server=localhost;Database=strongfit;Uid=root;Pwd=password;";
            using (MySqlConnection conn = new MySqlConnection(connectionString))
            {
                try
                {
                    conn.Open();

                    string query = @"INSERT INTO ent_personalizados (usuario_id, entrenamieto_id, fecha_entrenamiento)
                                     VALUES (@userId, (SELECT id FROM entrenamientos WHERE nombre = @nombre), @fecha_entrenamiento)";

                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@userId", userId);
                        cmd.Parameters.AddWithValue("@nombre", exercise.Nombre);
                        cmd.Parameters.AddWithValue("@fecha_entrenamiento", DateTime.Now); // Save the current date

                        cmd.ExecuteNonQuery();
                    }
                }
                catch (Exception ex)
                {
                    // Log the error or handle it accordingly
                    Console.WriteLine("Error saving to database: " + ex.Message);
                }
            }
        }

        // Page load event handler
        protected void Page_Load(object sender, EventArgs e)
        {
            // Only load data if it's the first request (not a postback)
            if (!IsPostBack)
            {
                int userId = 6; // Use the actual user ID of the logged-in user
                List<Exercise> exercises = GetUserExercises(userId);

                // Dynamically add the exercises to the page
                if (exercises != null && exercises.Count > 0)
                {
                    foreach (var exercise in exercises)
                    {
                        // Create a new HTML list item for each exercise and add it to the page
                        var exerciseHtml = $"<li class='exercise-item'>" +
                                           $"<h4>{exercise.Nombre}</h4>" +
                                           $"<p><strong>Series:</strong> {exercise.Series}</p>" +
                                           $"<p><strong>Repeticiones:</strong> {exercise.Repeticiones}</p>" +
                                           $"<p><strong>Descripción:</strong> {exercise.Descripcion}</p>" +
                                           $"<p><strong>Guía:</strong> {exercise.Guía}</p>" +
                                           $"</li>";

                        // Add the generated HTML to the Literal control
                        exerciseListLiteral.Text += exerciseHtml;

                        // Save the exercise data in the ent_personalizados table with the current date
                        SaveExerciseToPersonalized(userId, exercise);
                    }
                }
                else
                {
                    exerciseListLiteral.Text = "<li>No exercises found for this user.</li>";
                }
            }
        }
    }

    // Define a simple class to hold exercise data
    public class Exercise
    {
        public string Nombre { get; set; }
        public int Series { get; set; }
        public int Repeticiones { get; set; }
        public string Descripcion { get; set; }
        public string Guía { get; set; }
    }
}
