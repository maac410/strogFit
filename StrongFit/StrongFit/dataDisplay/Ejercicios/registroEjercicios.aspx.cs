using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Web.UI;

namespace StrongFit.dataDisplay.Entrenamientos
{
    public partial class RegistroEntrenamiento : System.Web.UI.Page
    {
        string cadenaConexion = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    int entrenamientoId = int.Parse(Request.QueryString["id"]);
                    CargarEntrenamiento(entrenamientoId);
                }
            }
        }

        private void CargarEntrenamiento(int entrenamientoId)
        {
            using (MySqlConnection conexion = new MySqlConnection(cadenaConexion))
            {
                try
                {
                    string sql = "SELECT * FROM entrenamientos WHERE id = @id";
                    MySqlCommand comando = new MySqlCommand(sql, conexion);
                    comando.Parameters.AddWithValue("@id", entrenamientoId);
                    conexion.Open();

                    MySqlDataReader reader = comando.ExecuteReader();
                    if (reader.Read())
                    {
                        txtNombre.Text = reader["nombre"].ToString();
                        ddlTipoObjetivo.SelectedValue = reader["tipo objetivo"].ToString();
                        txtSeries.Text = reader["series"].ToString();
                        txtRepeticiones.Text = reader["repeticiones"].ToString();
                        txtDescripcion.Text = reader["descripcion"].ToString();
                        txtGuia.Text = reader["guia"].ToString();
                    }
                }
                catch (Exception ex)
                {
                    // Manejo de errores
                    Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                }
            }
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            using (MySqlConnection conexion = new MySqlConnection(cadenaConexion))
            {
                try
                {
                    string sql = "INSERT INTO entrenamientos (tipo objetivo, nombre, series, repeticiones, descripcion, guia) " +
                                 "VALUES (@tipo_objetivo, @nombre, @series, @repeticiones, @descripcion, @guia)";

                    MySqlCommand comando = new MySqlCommand(sql, conexion);
                    comando.Parameters.AddWithValue("@tipo_objetivo", ddlTipoObjetivo.SelectedValue);
                    comando.Parameters.AddWithValue("@nombre", txtNombre.Text);
                    comando.Parameters.AddWithValue("@series", int.Parse(txtSeries.Text));
                    comando.Parameters.AddWithValue("@repeticiones", int.Parse(txtRepeticiones.Text));
                    comando.Parameters.AddWithValue("@descripcion", txtDescripcion.Text);
                    comando.Parameters.AddWithValue("@guia", txtGuia.Text);

                    conexion.Open();
                    comando.ExecuteNonQuery();

                    Response.Write("<script>alert('Entrenamiento registrado exitosamente');</script>");
                    Response.Redirect("Entrenamientos.aspx");
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                }
            }
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                int entrenamientoId = int.Parse(Request.QueryString["id"]);

                using (MySqlConnection conexion = new MySqlConnection(cadenaConexion))
                {
                    try
                    {
                        string sql = "UPDATE entrenamientos SET " +
                                     "tipo objetivo = @tipo_objetivo, nombre = @nombre, series = @series, " +
                                     "repeticiones = @repeticiones, descripcion = @descripcion, guia = @guia " +
                                     "WHERE id = @id";

                        MySqlCommand comando = new MySqlCommand(sql, conexion);
                        comando.Parameters.AddWithValue("@id", entrenamientoId);
                        comando.Parameters.AddWithValue("@tipo_objetivo", ddlTipoObjetivo.SelectedValue);
                        comando.Parameters.AddWithValue("@nombre", txtNombre.Text);
                        comando.Parameters.AddWithValue("@series", int.Parse(txtSeries.Text));
                        comando.Parameters.AddWithValue("@repeticiones", int.Parse(txtRepeticiones.Text));
                        comando.Parameters.AddWithValue("@descripcion", txtDescripcion.Text);
                        comando.Parameters.AddWithValue("@guia", txtGuia.Text);

                        conexion.Open();
                        comando.ExecuteNonQuery();

                        Response.Write("<script>alert('Entrenamiento actualizado exitosamente');</script>");
                        Response.Redirect("Entrenamientos.aspx");
                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                    }
                }
            }
        }
    }
}
