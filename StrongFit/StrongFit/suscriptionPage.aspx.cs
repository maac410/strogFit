using System;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace StrongFit
{
    public partial class suscriptionPage : System.Web.UI.Page
    {
        // Connection string from web.config
        string cadenaConexion = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Any necessary page load code goes here
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            // Validate if the page is valid
            if (Page.IsValid)
            {
                // Get values from form fields
                string usuario = txtUsuario.Text.Trim();
                string correo = txtCorreo.Text.Trim();
                string contraseña = txtContrasena.Text.Trim();

                // Call the method to insert data into the database
                RegisterUser(usuario, correo, contraseña);
            }
        }

        private void RegisterUser(string usuario, string correo, string contrasena)
        {
            try
            {
                // Open connection to MySQL database
                using (MySqlConnection conexion = new MySqlConnection(cadenaConexion))
                {
                    // SQL command to insert the user with the plain password
                    MySqlCommand comando = new MySqlCommand("INSERT INTO usuarios (nombre, rol, correo, contrasena) VALUES (@usuario, 'Usuario', @correo, MD5 (@contrasena)); SELECT LAST_INSERT_ID();", conexion);

                    // Add parameters to prevent SQL injection
                    comando.Parameters.AddWithValue("@usuario", usuario);
                    comando.Parameters.AddWithValue("@correo", correo);
                    comando.Parameters.AddWithValue("@contrasena", contrasena);

                    conexion.Open();

                    // Retrieve the user ID (last inserted ID)
                    object result = comando.ExecuteScalar();

                    if (result != null)
                    {
                        int userId = Convert.ToInt32(result);

                        // Pop-up alert for success and redirect to objetivo.aspx
                        string script = "alert('Usuario registrado exitosamente.');window.location.href='objetivo.aspx';";
                        ClientScript.RegisterStartupScript(this.GetType(), "SuccessAlertAndRedirect", script, true);

                        // Store user_id in session
                        Session["user_id"] = userId;
                    }
                    else
                    {
                        // If no rows were affected, something went wrong
                        lblEstado.Text = "Error al registrar el usuario. Intenta nuevamente.";
                        lblEstado.ForeColor = System.Drawing.Color.Red;

                        // Pop-up alert for error
                        string script = "alert('Error al registrar el usuario. Intenta nuevamente.');";
                        ClientScript.RegisterStartupScript(this.GetType(), "ErrorAlert", script, true);
                    }
                }
            }
            catch (MySqlException mysqlEx)
            {
                // Handle MySQL exceptions specifically
                lblEstado.Text = "Error de base de datos: " + mysqlEx.Message;
                lblEstado.ForeColor = System.Drawing.Color.Red;

                // Pop-up alert for MySQL error
                string script = "alert('Error de base de datos: " + mysqlEx.Message + "');";
                ClientScript.RegisterStartupScript(this.GetType(), "MySQLAlert", script, true);
            }
            catch (Exception ex)
            {
                // General exception handling
                lblEstado.Text = "Error: " + ex.Message;
                lblEstado.ForeColor = System.Drawing.Color.Red;

                // Pop-up alert for general error
                string script = "alert('Error: " + ex.Message + "');";
                ClientScript.RegisterStartupScript(this.GetType(), "GeneralErrorAlert", script, true);
            }
        }
    }
}
