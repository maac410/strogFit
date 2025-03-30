using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Web;
using System.Web.UI;

namespace StrongFit.dataDisplay.registroRecetas
{
    public partial class registroRecetas     : System.Web.UI.Page
    {
        String cadenaConexion = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    string idDieta = Request.QueryString["id"];
                    CargarDieta(idDieta);
                    lblAccion.Text = "Actualizar Dieta";
                    btnAñadir.Visible = false;
                    btnActualizar.Visible = true;
                }
                else
                {
                    lblAccion.Text = "Registrar Nueva Dieta";
                    btnAñadir.Visible = true;
                    btnActualizar.Visible = false;
                }
            }
        }

        private void CargarDieta(string idDieta)
        {
            using (MySqlConnection conexion = new MySqlConnection(cadenaConexion))
            {
                try
                {
                    conexion.Open();
                    string sql = "SELECT * FROM dieta WHERE id = @id";
                    MySqlCommand comando = new MySqlCommand(sql, conexion);
                    comando.Parameters.AddWithValue("@id", idDieta);
                    MySqlDataReader reader = comando.ExecuteReader();
                    if (reader.Read())
                    {
                        txtNombreDieta.Text = reader["nombre"].ToString();
                        txtDescripcion.Text = reader["descripcion"].ToString();
                        txtCalorias.Text = reader["calorias"].ToString();
                    }
                }
                catch (Exception ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert",
                        "alert('Error al cargar los datos de la dieta: " + HttpUtility.JavaScriptStringEncode(ex.Message) + "');", true);
                }
            }
        }

        protected void btnAñadir_Click(object sender, EventArgs e)
        {
            using (MySqlConnection conexion = new MySqlConnection(cadenaConexion))
            {
                try
                {
                    string sql = "INSERT INTO dieta (nombre, descripcion, calorias) VALUES (@nombre, @descripcion, @calorias)";
                    MySqlCommand comando = new MySqlCommand(sql, conexion);
                    comando.Parameters.AddWithValue("@nombre", txtNombreDieta.Text);
                    comando.Parameters.AddWithValue("@descripcion", txtDescripcion.Text);
                    comando.Parameters.AddWithValue("@calorias", txtCalorias.Text);

                    conexion.Open();
                    comando.ExecuteNonQuery();

                    ClientScript.RegisterStartupScript(this.GetType(), "alert",
                        "alert('Dieta registrada exitosamente.');window.location.href='recetas.aspx';", true);
                }
                catch (Exception ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert",
                        "alert('Error al registrar la dieta: " + HttpUtility.JavaScriptStringEncode(ex.Message) + "');", true);
                }
            }
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            string idDieta = Request.QueryString["id"];
            using (MySqlConnection conexion = new MySqlConnection(cadenaConexion))
            {
                try
                {
                    string sql = "UPDATE dieta SET nombre = @nombre, descripcion = @descripcion, calorias = @calorias WHERE id = @id";
                    MySqlCommand comando = new MySqlCommand(sql, conexion);
                    comando.Parameters.AddWithValue("@id", idDieta);
                    comando.Parameters.AddWithValue("@nombre", txtNombreDieta.Text);
                    comando.Parameters.AddWithValue("@descripcion", txtDescripcion.Text);
                    comando.Parameters.AddWithValue("@calorias", txtCalorias.Text);

                    conexion.Open();
                    comando.ExecuteNonQuery();

                    ClientScript.RegisterStartupScript(this.GetType(), "alert",
                        "alert('Dieta actualizada exitosamente.');window.location.href='recetas.aspx';", true);
                }
                catch (Exception ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert",
                        "alert('Error al actualizar la dieta: " + HttpUtility.JavaScriptStringEncode(ex.Message) + "');", true);
                }
            }
        }
    }
}