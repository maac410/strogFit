using MySql.Data.MySqlClient;
using Org.BouncyCastle.Asn1.Ocsp;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1_StrongFit.Alimentos;

namespace StrongFit.dataDisplay.Alimentos
{
    public partial class RegistroAlimento : System.Web.UI.Page
    {
        String cadenaConexion = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
        String pa_idAlimentos;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                LoadRegistro();
                if (Request.Form["idAlimentos"] != null)
                {
                    pa_idAlimentos = Request.Form["idAlimentos"];
                    Response.Write("<script>alert('Se recibio: " + pa_idAlimentos + "');</script>");
                }
            }


            
        }

        private void LoadRegistro()
        {
            using (MySqlConnection conexion = new MySqlConnection(cadenaConexion))
            {
                try
                {
                    String sql = "SELECT distinct Tamaño_ración FROM alimentos INNER JOIN registro_de_comidas ";
                    conexion.Open();
                    MySqlCommand comando = new MySqlCommand(sql, conexion);
                    ddlPorcion.DataSource = comando.ExecuteReader();
                    ddlPorcion.DataTextField = "Tamaño_ración";
                    ddlPorcion.DataValueField = "Tamaño_ración";
                    ddlPorcion.DataBind();
                    ddlPorcion.Items.Insert(0, new ListItem("--Seleccione unidad--", "0"));

                }
                catch (Exception ex)
                {

                }

            }
        }
        
        protected void btnAñadir_Click(object sender, EventArgs e)
        {
            if(Page.IsValid)
            {
                string alimento = txtAlimento.Text;
                string cantidad = txtCantidad.Text;
                string Porcion = ddlPorcion.Text;
                using (MySqlConnection conexion = new MySqlConnection(cadenaConexion))
                {
                    try
                    {
                        MySqlCommand comando = new MySqlCommand("INSERT INTO alimentos (alimento,cantidad,tamaño_ración) VALUES (@alimento,@Cantidad,@tamaño_ración)", conexion);
                        comando.Parameters.AddWithValue("alimento", alimento);
                        comando.Parameters.AddWithValue("cantidad", cantidad);
                        comando.Parameters.AddWithValue("tamaño_ración", Porcion);
                        conexion.Open();
                        comando.ExecuteNonQuery();
                        //limpiar los campos del formulario
                        txtAlimento.Text = "";
                        txtCantidad.Text = "";
                        ddlPorcion.SelectedIndex = 0;
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Alimento Ingresado con Exito.');", true);

                    }
                    catch (Exception ex)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Error general: " + HttpUtility.JavaScriptStringEncode(ex.Message), true);
                    }

                }
            }
        }
    }
}
