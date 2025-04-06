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
            if (!IsPostBack)
            {
                // Restart the session only if the user is NOT already logged in
                if (Session["userId"] == null)
                {
                    Session.Abandon();
                    Session.Clear();
                }
            }
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            string Usuario = txtUsuario.Text;
            string Contra = txtContrasena.Text;

            using (MySqlConnection conexion = new MySqlConnection(cadenaConexion))
            {
                try
                {
                    string sql = "SELECT usuario_id, contrasena, rol FROM usuarios WHERE nombre = @Usuario AND contrasena = MD5( @Contra)"; 

                    conexion.Open();
                    MySqlCommand comando = new MySqlCommand(sql, conexion);
                    comando.Parameters.AddWithValue("@Usuario", Usuario);
                    comando.Parameters.AddWithValue("@Contra", Contra);

                    MySqlDataReader lector = comando.ExecuteReader();

                    if (lector.HasRows)
                    {
                        lector.Read();
                        int userId = Convert.ToInt32(lector["usuario_id"]);
                        string rol = lector["rol"].ToString();

                        // Store user data in session
                        Session["usuario"] = Usuario;
                        Session["userId"] = userId;
                        Session["sessionId"] = Session.SessionID;

                        // Redirect user based on role
                        if (rol == "Usuario")
                        {
                            Response.Redirect("Index.aspx", false);
                        }
                        else
                        {
                            // Puedes cambiar esto según el rol
                            Response.Redirect("Index.aspx", false); // ejemplo
                        }
                    }
                    else
                    {
                        lblEstado.Text = "¡El usuario no está registrado!";
                    }
                }
                catch (Exception ex)
                {
                    lblEstado.Text = "Error en la conexión: " + ex.Message;
                }
            }
        }
    }
}
