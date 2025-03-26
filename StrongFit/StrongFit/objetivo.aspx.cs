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

        protected void Page_Load(object sender, EventArgs e)
        {
            // Logic to handle page load if needed
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            // Validate the page to ensure all fields are correct before inserting into DB
            if (Page.IsValid)
            {
                // Get the values from the form
                int edad = Convert.ToInt32(txtEdad.Text);
                string genero = ddlGenero.SelectedValue;
                int altura = Convert.ToInt32(txtAltura.Text);
                int peso = Convert.ToInt32(txtPeso.Text);

                // Insert the data into the database
                InsertarDatos(edad, genero, altura, peso);

                // Redirect the user to another page after saving the data
                Response.Redirect("userPage.aspx");
            }
        }

        // Method to insert data into the database
        private void InsertarDatos(int edad, string genero, int altura, int peso)
        {
            // Using MySQL connection
            using (MySqlConnection con = new MySqlConnection(cadenaConexion))
            {
                try
                {
                    con.Open();
                    string query = "INSERT INTO Objetivos (Edad, Genero, Altura, Peso) VALUES (@Edad, @Genero, @Altura, @Peso)";

                    using (MySqlCommand cmd = new MySqlCommand(query, con))
                    {
                        // Defining parameters to prevent SQL injection
                        cmd.Parameters.AddWithValue("@Edad", edad);
                        cmd.Parameters.AddWithValue("@Genero", genero);
                        cmd.Parameters.AddWithValue("@Altura", altura);
                        cmd.Parameters.AddWithValue("@Peso", peso);

                        // Execute the query
                        cmd.ExecuteNonQuery();
                    }
                }
                catch (Exception ex)
                {
                    // Handle errors (display an error message for example)
                    Response.Write($"Error: {ex.Message}");
                }
            }
        }
    }
}
