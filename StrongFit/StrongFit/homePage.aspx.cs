using MySql.Data.MySqlClient;
using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace StrongFit
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        // Retrieve the connection string from the web.config file
        string cadenaConexion = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;

        // This is the Page_Load event
        protected void Page_Load(object sender, EventArgs e)
        {
            // Any Page Load logic goes here
        }

        // This is the event handler for the login button click
        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            string Usuario = txtUsuario.Text;
            string Contra = txtContrasena.Text;

            // Create a connection to the database
            using (MySqlConnection conexion = new MySqlConnection(cadenaConexion))
            {
                try
                {
                    // Modify the SQL query to also get the role
                    string sql = "SELECT contrasena, rol FROM usuarios WHERE nombre = @Usuario AND contrasena = @Contra";

                    // Open the connection
                    conexion.Open();

                    // Create a command object to execute the query
                    MySqlCommand comando = new MySqlCommand(sql, conexion);

                    // Add parameters to the command to prevent SQL injection
                    comando.Parameters.AddWithValue("@Usuario", Usuario);
                    comando.Parameters.AddWithValue("@Contra", Contra);

                    // Execute the query and get the result
                    MySqlDataReader lector = comando.ExecuteReader();

                    // Check if any rows are returned (user exists and password matches)
                    if (lector.HasRows)
                    {
                        // Read the data (password and role)
                        lector.Read();
                        string rol = lector["rol"].ToString(); // Get the role

                        // Set session variable for the logged-in user
                        Session["usuario"] = Usuario;

                        // Redirect based on the user's role
                        if (rol == "Usuario")
                        {
                            // Redirect to userPage.aspx for other roles
                            Response.Redirect("userPage.aspx", false);
                        }
                        else
                        {
                            // Redirect to Index.aspx if the user is an administrator, nutricionista, or entrenador
                            Response.Redirect("Index.aspx", false);
                        }
                    }
                    else
                    {
                        // Display error message if the user is not found
                        lblEstado.Text = "¡El usuario no está registrado en la BD!";
                    }
                }
                catch (Exception ex)
                {
                    // Display any errors that occur during the connection or query execution
                    lblEstado.Text = "Error en la conexión: " + ex.Message;
                }
            }
        }
    }
}
