using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1_StrongFit.Alimentos
{
    public partial class Añadir : System.Web.UI.Page
    {
        String cadenaConexion = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadAlimentos();
        }

        private void LoadAlimentos()
        {
            using (MySqlConnection conexion = new MySqlConnection(cadenaConexion))
            {
                try
                {
                    String sql = "SELECT Alimento,Cantidad,Tamaño_ración FROM alimentos\r\nINNER JOIN registro_de_comidas";
                    conexion.Open();
                    MySqlCommand comando = new MySqlCommand(sql, conexion);
                    MySqlDataReader lector = comando.ExecuteReader();
                }
                catch (Exception ex)
                {

                }
            }
        }


        protected void Registrar_Click(object sender, EventArgs e)
        {

        }
    }
}