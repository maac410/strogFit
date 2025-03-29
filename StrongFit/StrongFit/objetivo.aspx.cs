using System;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.Web.UI;

namespace StrongFit
{
    public partial class WebForm3 : Page
    {
        // Connection string from web.config
        string cadenaConexion = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;

        // Define Enum for Preferencia and TipoObjetivo
        public enum Preferencia
        {
            AumentarFuerza = 1,
            AumentarResistencia = 2,
            Equilibrado = 3
        }

        public enum TipoObjetivo
        {
            SubirDePeso = 1,
            BajarDePeso = 2,
            MantenerPeso = 3
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            // Logic to handle page load if needed
            if (Session["user_id"] == null)
            {
                Response.Write("Session expired or user not logged in. Please log in again.");
                Response.Redirect("login.aspx");
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            // Validate the page to ensure all fields are correct before inserting into DB
            if (Page.IsValid)
            {
                // Get the values from the form
                string genero = ddlGenero.SelectedValue;
                int altura = Convert.ToInt32(txtAltura.Text);
                int peso = Convert.ToInt32(txtPeso.Text);

                // Get enum values for Preferencia and TipoObjetivo
                Preferencia preferencia = (Preferencia)Enum.Parse(typeof(Preferencia), ddlPreferencia.SelectedValue);
                TipoObjetivo tipoObjetivo = (TipoObjetivo)Enum.Parse(typeof(TipoObjetivo), ddlObjetivo.SelectedValue);

                DateTime fechaNacimiento = Convert.ToDateTime(txtFechaNacimiento.Text);

                // Get user ID from session (assuming user is logged in and user_id is stored in session)
                int userId = Convert.ToInt32(Session["user_id"] ?? 0);

                // Debugging check for user ID in session
                if (userId == 0)
                {
                    Response.Write("Error: User ID is not set in session. Please log in.");
                    Response.Redirect("login.aspx");
                    return;
                }

                // Debugging: Log form values
                System.Diagnostics.Debug.WriteLine($"Saving data for user {userId} - Gender: {genero}, Height: {altura}, Weight: {peso}, Goal Type: {tipoObjetivo}, Preference: {preferencia}, Birthdate: {fechaNacimiento.ToShortDateString()}");

                // Insert the data into the database
                bool success = InsertarDatos(genero, altura, peso, preferencia, tipoObjetivo, fechaNacimiento, userId);

                // Check if insertion was successful and show alert
                if (success)
                {
                    string script = "alert('Data inserted successfully!');";
                    ClientScript.RegisterStartupScript(this.GetType(), "SuccessAlert", script, true);
                    Response.Redirect("userPage.aspx");
                }
                else
                {
                    string script = "alert('Data insertion failed. Please try again.');";
                    ClientScript.RegisterStartupScript(this.GetType(), "ErrorAlert", script, true);
                }
            }
            else
            {
                string script = "alert('Form validation failed. Please check all fields.');";
                ClientScript.RegisterStartupScript(this.GetType(), "ValidationError", script, true);
            }
        }

        // Method to insert data into the database
        private bool InsertarDatos(string genero, int altura, int peso, Preferencia preferencia, TipoObjetivo tipoObjetivo, DateTime fechaNacimiento, int userId)
        {
            using (MySqlConnection con = new MySqlConnection(cadenaConexion))
            {
                try
                {
                    con.Open();
                    string query = "INSERT INTO objetivos (genero, altura, peso, tipo_objetivo, preferencia, fecha_nacimiento, usuario_id) " +
                                   "VALUES (@Genero, @Altura, @Peso, @TipoObjetivo, @Preferencia, @FechaNacimiento, @UserId)";

                    using (MySqlCommand cmd = new MySqlCommand(query, con))
                    {
                        // Convert enums to integers
                        cmd.Parameters.AddWithValue("@Genero", genero);
                        cmd.Parameters.AddWithValue("@Altura", altura);
                        cmd.Parameters.AddWithValue("@Peso", peso);
                        cmd.Parameters.AddWithValue("@TipoObjetivo", (int)tipoObjetivo);  // Cast enum to integer
                        cmd.Parameters.AddWithValue("@Preferencia", (int)preferencia);    // Cast enum to integer
                        cmd.Parameters.AddWithValue("@FechaNacimiento", fechaNacimiento);
                        cmd.Parameters.AddWithValue("@UserId", userId);

                        // Execute the query
                        int rowsAffected = cmd.ExecuteNonQuery();

                        // Debugging check: Output how many rows were affected by the query
                        System.Diagnostics.Debug.WriteLine($"Rows affected: {rowsAffected}");

                        if (rowsAffected > 0)
                        {
                            return true; // Return true if data was inserted
                        }
                        else
                        {
                            return false; // Return false if no data was inserted
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Handle errors
                    System.Diagnostics.Debug.WriteLine($"Error: {ex.Message} - StackTrace: {ex.StackTrace}");
                    return false; // Return false if an error occurred
                }
            }
        }
    }
}
