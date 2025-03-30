using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1_StrongFit.recetas
{
    public partial class recetas : System.Web.UI.Page
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
                    String sql = "SELECT id, nombre, calorias, proteinas, carbohidratos, grasas FROM dieta";

                    conexion.Open();
                    MySqlCommand comando = new MySqlCommand(sql, conexion);
                    MySqlDataAdapter da = new MySqlDataAdapter(comando);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    gvDatosDietas.DataSource = dt;
                    gvDatosDietas.DataBind();
                }
                catch (Exception ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert",
                        "alert('Error al cargar datos: " + HttpUtility.JavaScriptStringEncode(ex.Message) + "');", true);
                }
            }
        }
    



protected void gvDatosDietas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            String dietaId = e.CommandArgument.ToString();
            if (e.CommandName == "Actualizar")
            {
                String targetUrl = "RegistroRecetas.aspx";
                String formHtml = $"<form action='{targetUrl}' method='post' style='display:none'>" +
                                  $"<input type='hidden' name='dieta_id' value='{dietaId}' />" +
                                  "</form><script>document.forms[0].submit();</script>";
                Response.Clear();
                Response.Write(formHtml);
                Response.End();
            }
            else if (e.CommandName == "Eliminar")
            {
                eliminarDieta(dietaId);
            }
        }

        private void eliminarDieta(string dietaId)
        {
            using (MySqlConnection conexion = new MySqlConnection(cadenaConexion))
            {
                try
                {
                    MySqlCommand comando = new MySqlCommand("DELETE FROM dieta WHERE id = @dieta_id", conexion);
                    comando.Parameters.AddWithValue("@dieta_id", dietaId);
                    conexion.Open();
                    int filasBorradas = comando.ExecuteNonQuery();

                    string script = filasBorradas > 0
                        ? "alert('Dieta eliminada exitosamente.');window.location.href='recetas.aspx';"
                        : "alert('Dieta no encontrada.');window.location.href='recetas.aspx';";

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