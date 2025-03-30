using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Web;
using System.Web.UI;

namespace StrongFit.dataDisplay.Usuarios
{
    public partial class RegistroUsuario : System.Web.UI.Page
    {
        private readonly string cadenaConexion = ConfigurationManager.ConnectionStrings["conexion"]?.ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    string idUsuario = Request.QueryString["id"];
                    CargarUsuario(idUsuario);
                    lblAccion.Text = "Actualizar Usuario";
                    btnAñadir.Visible = false;
                    btnActualizar.Visible = true;
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
                    string sql = "SELECT nombre, correo, rol, contrasena FROM usuarios WHERE id = @id";
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
                    MostrarAlerta($"Error al cargar los datos del usuario: {ex.Message}");
                }
            }
        }

        protected void btnAñadir_Click(object sender, EventArgs e)
        {
            using (MySqlConnection conexion = new MySqlConnection(cadenaConexion))
            {
                try
                {
                    if (txtContrasena == null || string.IsNullOrEmpty(txtContrasena.Text))
                    {
                        MostrarAlerta("La contraseña no puede estar vacía.");
                        return;
                    }

                    string sql = "INSERT INTO usuarios (nombre, correo, rol, contrasena) VALUES (@nombre, @correo, @rol, @contrasena)";
                    MySqlCommand comando = new MySqlCommand(sql, conexion);
                    comando.Parameters.AddWithValue("@nombre", txtNombre.Text);
                    comando.Parameters.AddWithValue("@correo", txtCorreo.Text);
                    comando.Parameters.AddWithValue("@rol", ddlTipoUsuario.SelectedValue);
                    comando.Parameters.AddWithValue("@contrasena", txtContrasena.Text); // Sin encriptar

                    conexion.Open();
                    comando.ExecuteNonQuery();

                    MostrarAlerta("Usuario registrado exitosamente.", "Usuarios.aspx");
                }
                catch (Exception ex)
                {
                    MostrarAlerta($"Error al registrar el usuario: {ex.Message}");
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
                    string sql = "UPDATE usuarios SET nombre = @nombre, correo = @correo, rol = @rol";
                    if (txtContrasena != null && !string.IsNullOrEmpty(txtContrasena.Text))
                    {
                        sql += ", contrasena = @contrasena";
                    }
                    sql += " WHERE id = @id";

                    MySqlCommand comando = new MySqlCommand(sql, conexion);
                    comando.Parameters.AddWithValue("@id", idUsuario);
                    comando.Parameters.AddWithValue("@nombre", txtNombre.Text);
                    comando.Parameters.AddWithValue("@correo", txtCorreo.Text);
                    comando.Parameters.AddWithValue("@rol", ddlTipoUsuario.SelectedValue);

                    if (txtContrasena != null && !string.IsNullOrEmpty(txtContrasena.Text))
                    {
                        comando.Parameters.AddWithValue("@contrasena", txtContrasena.Text); // Sin encriptar
                    }

                    conexion.Open();
                    comando.ExecuteNonQuery();

                    MostrarAlerta("Usuario actualizado exitosamente.", "Usuarios.aspx");
                }
                catch (Exception ex)
                {
                    MostrarAlerta($"Error al actualizar el usuario: {ex.Message}");
                }
            }
        }

        private void MostrarAlerta(string mensaje, string redireccion = null)
        {
            string script = $"alert('{HttpUtility.JavaScriptStringEncode(mensaje)}');";
            if (!string.IsNullOrEmpty(redireccion))
            {
                script += $"window.location.href='{redireccion}';";
            }
            ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
        }
    }
}
