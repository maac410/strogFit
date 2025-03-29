using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1_StrongFit.Entrenamientos
{
    public partial class Entrenamientos : System.Web.UI.Page
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
                    String sql = "SELECT id, tipo_objetivo, nombre, series, repeticiones, descripcion, guia FROM entrenamientos";

                    conexion.Open();
                    MySqlCommand comando = new MySqlCommand(sql, conexion);
                    MySqlDataAdapter da = new MySqlDataAdapter(comando);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    gvDatosEntrenamientos.DataSource = dt;
                    gvDatosEntrenamientos.DataBind(); // Importante para reflejar los datos en la UI
                }
                catch (Exception ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert",
                        "alert('Error al cargar datos: " + HttpUtility.JavaScriptStringEncode(ex.Message) + "');", true);
                }
            }
        }

        protected void gvDatosEntrenamientos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            String idEntrenamiento = e.CommandArgument.ToString();
            if (e.CommandName == "Actualizar")
            {
                String targetUrl = "registroEjercicios.aspx";
                String formHtml = $"<form action='{targetUrl}' method='post' style='display:none'>" +
                                  $"<input type='hidden' name='id' value='{idEntrenamiento}' />" +
                                  "</form><script>document.forms[0].submit();</script>";
                Response.Clear();
                Response.Write(formHtml);
                Response.End();
            }
            else if (e.CommandName == "Eliminar")
            {
                eliminarEntrenamiento(idEntrenamiento);
            }
        }

        private void eliminarEntrenamiento(string idEntrenamiento)
        {
            using (MySqlConnection conexion = new MySqlConnection(cadenaConexion))
            {
                try
                {
                    MySqlCommand comando = new MySqlCommand("DELETE FROM entrenamientos WHERE id = @id", conexion);
                    comando.Parameters.AddWithValue("@id", idEntrenamiento);
                    conexion.Open();
                    int filasBorradas = comando.ExecuteNonQuery();

                    string script = filasBorradas > 0
                        ? "alert('Entrenamiento eliminado exitosamente.');window.location.href='ejercicios.aspx';"
                        : "alert('Entrenamiento no encontrado.');window.location.href='ejercicios.aspx';";

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
