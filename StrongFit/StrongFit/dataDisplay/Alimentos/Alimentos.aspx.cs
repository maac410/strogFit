using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Diagnostics.Contracts;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1_StrongFit.Alimentos
{
    public partial class Alimentos : System.Web.UI.Page
    {
        String cadenaConexion = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            CargarGridView();
        }

        private void CargarGridView()
        {
            using (MySqlConnection conexion = new MySqlConnection(cadenaConexion))
            {
                try
                {
                    String sql = "SELECT a.IdAlimentos,a.Alimento,a.Calorias,r.Cantidad" +
                        "  FROM Alimentos a JOIN registro_de_comidas r ON a.IdAlimentos=r.idRegistro_de_comidas";
                    conexion.Open();
                    MySqlCommand comando = new MySqlCommand(sql, conexion);



                    MySqlDataAdapter da = new MySqlDataAdapter(comando);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    gvDatosAlimentos.DataSource = dt;
                    gvDatosAlimentos.DataBind();

                }
                catch (Exception ex)
                {

                }

            }
        }

        protected void gvDatosAlimentos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            String Idalimentos = e.CommandArgument.ToString();
            if (e.CommandName == "Actualizar")
            {
                String targetUrl = "RegistroAlimento.aspx";
                String formHtml = $"<form action='{targetUrl}' method='post' style='display:none'>" +
                    $"<input type='hidden' name='IdAlimentos' value='{Idalimentos}' />" +
                    "</form><script>document.forms[0].submit();</script>";
                Response.Clear();
                Response.Write(formHtml);
                Response.End();
            }
            else if(e.CommandName == "Eliminar")
            {
                eliminarAlimento(Idalimentos);
            }
        }

        private void eliminarAlimento(string idalimentos)
        {
            using (MySqlConnection conexion = new MySqlConnection(cadenaConexion))
            {
                try
                {
                    MySqlCommand comando = new MySqlCommand("DELETE FROM alimentos WHERE idAlimentos = @idAlimentos", conexion);
                    comando.Parameters.AddWithValue("idAlimentos", idalimentos);
                    conexion.Open();
                    int filasBorradas = comando.ExecuteNonQuery();
                    if (filasBorradas > 0)
                    {
                        string script = "alert('Alimento Eliminado exitosamente.');window.location.href='Alimentos.aspx'";
                        ClientScript.RegisterStartupScript(this.GetType(), "RedirectOK", script, true);
                    }
                    else
                    {
                        string script = "alert('Alimento no registrado.');window.location.href='Alimentos.aspx'";
                        ClientScript.RegisterStartupScript(this.GetType(), "RedirectNf", script, true);
                    }




                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Alimento Ingresado con Exito.');", true);

                }
                catch (Exception ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Error general: " +
                        HttpUtility.JavaScriptStringEncode(ex.Message), true);
                }

            }
        }
    }
}