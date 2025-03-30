using System;
using System.Configuration;
using System.Data;
using MySql.Data.MySqlClient;

namespace WebApplication1_StrongFit
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if the user is logged in (by checking the userId session)
                if (Session["userId"] != null)
                {
                    int userId = Convert.ToInt32(Session["userId"]);
                    ObtenerRolUsuario(userId);
                }
                else
                {
                    lblUsuario.Text = "Invitado";
                    lblRol.Text = "Sin rol";
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
            }
            else if (rol == "Nutricionista")
            {
                hlRegistroUsuarios.Visible = false;
                hlRegistroEntrenamientos.Visible = false;
            }
        }
    }
}
