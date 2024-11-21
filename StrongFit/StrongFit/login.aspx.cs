using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1_StrongFit
{
    public partial class login : System.Web.UI.Page
    {
        String cadenaConexion = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            String Usuario = txtUsuario.Text;
            String Contra = txtContraseña.Text;
            using (MySqlConnection conexion = new MySqlConnection(cadenaConexion))
            {
                try
                {
                    String sql = "SELECT contraseña FROM clientes WHERE Nombre=@Usuario and contraseña=@contra";
                    conexion.Open();
                    MySqlCommand comando = new MySqlCommand(sql, conexion);
                    comando.Parameters.AddWithValue("Usuario", Usuario);
                    comando.Parameters.AddWithValue("Contra", Contra);
                    MySqlDataReader lector = comando.ExecuteReader();
                    if (lector.HasRows)
                    {
                        Session["usuario"] = Usuario;
                        Response.Redirect("Inicio.aspx", false);
                        //lblEstado.Text = "¡El usario se encuetra registrado en la BD!";
                    }
                    else
                    {
                        lblEstado.Text = "¡El usuario no esta registrado en la BD!";
                    }

                }
                catch (Exception ex)
                {
                    lblEstado.Text = "Error en la conexón: " + ex.Message;
                }

            }
        }
    }
}


