using System;
using System.Collections.Generic;
using System.Configuration;
using System.Web.UI;
using MySql.Data.MySqlClient;

namespace StrongFit
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        // A method to retrieve the user's 'tipo_objetivo' (goal type)
        protected string GetUserGoalType(int userId)
        {
            string goalType = string.Empty;
            // Connection string from web.config
            string connectionString = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;

            using (MySqlConnection conn = new MySqlConnection(connectionString))
            {
                try
                {
                    conn.Open();

                    string query = @"SELECT tipo_objetivo FROM objetivos WHERE usuario_id = @userId";

                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@userId", userId);

                        object result = cmd.ExecuteScalar();
                        if (result != null)
                        {
                            goalType = result.ToString();
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Log the error (e.g., to a file or external logging service)
                    Console.WriteLine("Error: " + ex.Message);
                }
            }

            return goalType;
        }

        // A method to retrieve exercises based on the user's goal type
        protected List<Exercise> GetExercisesByGoal(string goalType)
        {
            List<Exercise> exercises = new List<Exercise>();
            // Connection string from web.config
            string connectionString = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;

            using (MySqlConnection conn = new MySqlConnection(connectionString))
            {
                try
                {
                    conn.Open();

                    string query = @"SELECT e.nombre, e.series, e.repeticiones, e.descripcion, e.guia
                                     FROM entrenamientos e
                                     WHERE e.tipo_objetivo = @goalType";

                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@goalType", goalType);

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
                    // Log the error (e.g., to a file or external logging service)
                    Console.WriteLine("Error: " + ex.Message);
                }
            }

            return exercises;
        }

        // Page load event handler
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Retrieve the user ID from the session
                int userId = Convert.ToInt32(Session["UserId"]); // Use the user ID from the session

                // Fetch the user's goal type
                string goalType = GetUserGoalType(userId);

                // Retrieve exercises that match the user's goal type
                List<Exercise> exercises = GetExercisesByGoal(goalType);

                // Dynamically display exercises on the page
                if (exercises != null && exercises.Count > 0)
                {
                    foreach (var exercise in exercises)
                    {
                        string exerciseHtml = $"<li class='exercise-item'>" +
                                              $"<h4>{exercise.Nombre}</h4>" +
                                              $"<p><strong>Series:</strong> {exercise.Series}</p>" +
                                              $"<p><strong>Repeticiones:</strong> {exercise.Repeticiones}</p>" +
                                              $"<p><strong>Descripción:</strong> {exercise.Descripcion}</p>" +
                                              $"<p><strong>Guía:</strong> {exercise.Guía}</p>" +
                                              $"</li>";

                        // Add the generated HTML to the Literal control
                        exerciseListLiteral.Text += exerciseHtml;
                    }
                }
                else
                {
                    exerciseListLiteral.Text = "<li>No exercises found for this user.</li>";
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
}}
