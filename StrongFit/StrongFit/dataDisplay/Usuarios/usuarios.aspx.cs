using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1_StrongFit.Usuarios
{
    public partial class Usuarios : System.Web.UI.Page
    {
        String cadenaConexion = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarGridView();
            }
        }

        private void CargarGridView()
        {
            using (MySqlConnection conexion = new MySqlConnection(cadenaConexion))
            {
                try
                {
                    // Query to fetch the users' data
                    String sql = "SELECT usuario_id, rol, nombre, correo FROM usuarios";

                    conexion.Open();
                    MySqlCommand comando = new MySqlCommand(sql, conexion);
                    MySqlDataAdapter da = new MySqlDataAdapter(comando);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    gvDatosUsuarios.DataSource = dt;
                    gvDatosUsuarios.DataBind(); // Important to reflect data on the UI
                }
                catch (Exception ex)
                {
                    // Register error for debugging
                    ClientScript.RegisterStartupScript(this.GetType(), "alert",
                        "alert('Error al cargar datos: " + HttpUtility.JavaScriptStringEncode(ex.Message) + "');", true);
                }
            }
        }

        protected void gvDatosUsuarios_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            String usuarioId = e.CommandArgument.ToString();
            if (e.CommandName == "Actualizar")
            {
                String targetUrl = "RegistroUsuario.aspx";
                String formHtml = $"<form action='{targetUrl}' method='post' style='display:none'>" +
                                  $"<input type='hidden' name='usuario_id' value='{usuarioId}' />" +
                                  "</form><script>document.forms[0].submit();</script>";
                Response.Clear();
                Response.Write(formHtml);
                Response.End();
            }
            else if (e.CommandName == "Eliminar")
            {
                eliminarUsuario(usuarioId);
            }
        }

        private void eliminarUsuario(string usuarioId)
        {
            using (MySqlConnection conexion = new MySqlConnection(cadenaConexion))
            {
                try
                {
                    MySqlCommand comando = new MySqlCommand("DELETE FROM usuarios WHERE usuario_id = @usuario_id", conexion);
                    comando.Parameters.AddWithValue("@usuario_id", usuarioId);
                    conexion.Open();
                    int filasBorradas = comando.ExecuteNonQuery();

                    string script = filasBorradas > 0
                        ? "alert('Usuario eliminado exitosamente.');window.location.href='Usuarios.aspx';"
                        : "alert('Usuario no encontrado.');window.location.href='Usuarios.aspx';";

                    ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script, true);
                }
                catch (Exception ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert",
                        "alert('Error general: " + HttpUtility.JavaScriptStringEncode(ex.Message) + "');", true);
                }
            }
        }
    }
}
