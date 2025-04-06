using System;
using System.Configuration;
using System.Data;
using System.Web;
using MySql.Data.MySqlClient;

namespace WebApplication1_StrongFit
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // ⚠️ Desactiva el almacenamiento en caché del navegador
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
            Response.Cache.SetNoStore();



            if (!IsPostBack)
            {
                // Verifica si hay sesión activa
                if (Session["userId"] != null)
                {
                    int userId = Convert.ToInt32(Session["userId"]);
                    ObtenerRolUsuario(userId);
                }
                else
                {
                    // Redirige a la página de inicio si no hay sesión
                    Response.Redirect("~/homePage.aspx", true);
                }
            }
        }

        private void ObtenerRolUsuario(int userId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
            using (MySqlConnection conn = new MySqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    string query = "SELECT nombre, rol FROM usuarios WHERE usuario_id = @userId";

                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@userId", userId);
                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                lblUsuario.Text = reader["nombre"].ToString();
                                lblRol.Text = reader["rol"].ToString();
                                OcultarBotonesPorRol(lblRol.Text);
                            }
                            else
                            {
                                lblUsuario.Text = "Invitado";
                                lblRol.Text = "Sin rol";
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    lblUsuario.Text = "Error";
                    lblRol.Text = "No disponible";
                    Console.WriteLine("Error en la base de datos: " + ex.Message);
                }
            }
        }

        private void OcultarBotonesPorRol(string rol)
        {
            if (rol == "Entrenador")
            {
                hlRegistroUsuarios.Visible = false;
                hlRegistroDietas.Visible = false;
                hlPerfil.Visible = false;
            }
            else if (rol == "Nutricionista")
            {
                hlRegistroUsuarios.Visible = false;
                hlRegistroEntrenamientos.Visible = false;
                hlPerfil.Visible = false;
            }
            else if (rol == "Administrador")
            {
                hlPerfil.Visible = false;
            }
            else if (rol == "Usuario")
            {
                hlRegistroUsuarios.Visible = false;
                hlRegistroDietas.Visible = false;
                hlRegistroEntrenamientos.Visible = false;
                hlPerfil.Visible = true;
            }
        }

        // ✅ Este método se ejecuta cuando el usuario hace clic en "Salir"
        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            // Elimina todas las cookies (opcional pero recomendado)
            if (Request.Cookies["ASP.NET_SessionId"] != null)
            {
                Response.Cookies["ASP.NET_SessionId"].Expires = DateTime.Now.AddDays(-1);
            }

            Response.Redirect("~/homePage.aspx", true);
            Context.ApplicationInstance.CompleteRequest();
        }
    }
}
