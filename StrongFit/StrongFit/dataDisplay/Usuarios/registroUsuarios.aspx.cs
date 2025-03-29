using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Web;
using System.Web.UI;

namespace StrongFit.dataDisplay.Usuarios
{
    public partial class RegistroUsuario : System.Web.UI.Page
    {
        String cadenaConexion = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    // Si el parámetro 'id' está presente, es para actualizar un usuario
                    string idUsuario = Request.QueryString["id"];
                    CargarUsuario(idUsuario);
                    lblAccion.Text = "Actualizar Usuario";
                    btnAñadir.Visible = false; // Ocultar botón de Añadir si estamos actualizando
                    btnActualizar.Visible = true; // Mostrar botón de Actualizar
                }
                else
                {
                    lblAccion.Text = "Registrar Nuevo Usuario";
                    btnAñadir.Visible = true;
                    btnActualizar.Visible = false;
                }
            }
        }

        private void CargarUsuario(string idUsuario)
        {
            using (MySqlConnection conexion = new MySqlConnection(cadenaConexion))
            {
                try
                {
                    conexion.Open();
                    string sql = "SELECT * FROM usuarios WHERE id = @id";
                    MySqlCommand comando = new MySqlCommand(sql, conexion);
                    comando.Parameters.AddWithValue("@id", idUsuario);
                    MySqlDataReader reader = comando.ExecuteReader();
                    if (reader.Read())
                    {
                        txtNombre.Text = reader["nombre"].ToString();
                        txtCorreo.Text = reader["correo"].ToString();
                        ddlTipoUsuario.SelectedValue = reader["rol"].ToString();
                    }
                }
                catch (Exception ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert",
                        "alert('Error al cargar los datos del usuario: " + HttpUtility.JavaScriptStringEncode(ex.Message) + "');", true);
                }
            }
        }

        protected void btnAñadir_Click(object sender, EventArgs e)
        {
            using (MySqlConnection conexion = new MySqlConnection(cadenaConexion))
            {
                try
                {
                    string sql = "INSERT INTO usuarios (nombre, correo, rol) " +
                                 "VALUES (@nombre, @correo, @rol)";
                    MySqlCommand comando = new MySqlCommand(sql, conexion);
                    comando.Parameters.AddWithValue("@nombre", txtNombre.Text);
                    comando.Parameters.AddWithValue("@correo", txtCorreo.Text);
                    comando.Parameters.AddWithValue("@rol", ddlTipoUsuario.SelectedValue);

                    conexion.Open();
                    comando.ExecuteNonQuery();

                    ClientScript.RegisterStartupScript(this.GetType(), "alert",
                        "alert('Usuario registrado exitosamente.');window.location.href='Usuarios.aspx';", true);
                }
                catch (Exception ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert",
                        "alert('Error al registrar el usuario: " + HttpUtility.JavaScriptStringEncode(ex.Message) + "');", true);
                }
            }
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            string idUsuario = Request.QueryString["id"];
            using (MySqlConnection conexion = new MySqlConnection(cadenaConexion))
            {
                try
                {
                    string sql = "UPDATE usuarios SET nombre = @nombre, correo = @correo, rol = @rol WHERE id = @id";
                    MySqlCommand comando = new MySqlCommand(sql, conexion);
                    comando.Parameters.AddWithValue("@id", idUsuario);
                    comando.Parameters.AddWithValue("@nombre", txtNombre.Text);
                    comando.Parameters.AddWithValue("@correo", txtCorreo.Text);
                    comando.Parameters.AddWithValue("@rol", ddlTipoUsuario.SelectedValue);

                    conexion.Open();
                    comando.ExecuteNonQuery();

                    ClientScript.RegisterStartupScript(this.GetType(), "alert",
                        "alert('Usuario actualizado exitosamente.');window.location.href='Usuarios.aspx';", true);
                }
                catch (Exception ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert",
                        "alert('Error al actualizar el usuario: " + HttpUtility.JavaScriptStringEncode(ex.Message) + "');", true);
                }
            }
        }
    }
}
