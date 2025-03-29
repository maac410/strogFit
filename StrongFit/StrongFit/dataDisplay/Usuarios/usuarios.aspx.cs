using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StrongFit.dataDisplay.Alimentos
{
    public partial class Usuarios : System.Web.UI.Page
    {
        String cadenaConexion = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarGridView();
            }
        }

        // Method to load data into the GridView
        private void CargarGridView()
        {
            using (MySqlConnection conexion = new MySqlConnection(cadenaConexion))
            {
                try
                {
                    // SQL query to fetch users data
                    String sql = "SELECT usuario_id, nombre, rol, correo FROM usuarios";
                    conexion.Open();
                    MySqlCommand comando = new MySqlCommand(sql, conexion);
                    MySqlDataAdapter da = new MySqlDataAdapter(comando);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    // Bind the data to the GridView
                    gvDatosUsuarios.DataSource = dt;
                    gvDatosUsuarios.DataBind();
                }
                catch (Exception ex)
                {
                    // Display error if there is an issue with data retrieval
                    ClientScript.RegisterStartupScript(this.GetType(), "alert",
                        "alert('Error al cargar datos: " + HttpUtility.JavaScriptStringEncode(ex.Message) + "');", true);
                }
            }
        }

        // Event handler for the GridView RowCommand event (for Update and Delete operations)
        protected void gvDatosUsuarios_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string IdUsuario = e.CommandArgument.ToString();

            if (e.CommandName == "Actualizar")
            {
                // Redirect to the update page with the user ID
                Response.Redirect("ActualizarUsuario.aspx?usuario_id=" + IdUsuario);
            }
            else if (e.CommandName == "Eliminar")
            {
                // Call the method to delete the user
                eliminarUsuario(IdUsuario);
            }
        }

        // Method to delete a user by their ID
        private void eliminarUsuario(string idUsuario)
        {
            using (MySqlConnection conexion = new MySqlConnection(cadenaConexion))
            {
                try
                {
                    // SQL command to delete a user from the database
                    MySqlCommand comando = new MySqlCommand("DELETE FROM usuarios WHERE usuario_id = @IdUsuario", conexion);
                    comando.Parameters.AddWithValue("@IdUsuario", idUsuario);
                    conexion.Open();
                    int filasBorradas = comando.ExecuteNonQuery();

                    // Notify the user if the deletion was successful
                    string script = filasBorradas > 0
                        ? "alert('Usuario eliminado exitosamente.');window.location.href='usuarios.aspx';"
                        : "alert('Usuario no encontrado.');window.location.href='usuarios.aspx';";

                    ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script, true);
                }
                catch (Exception ex)
                {
                    // Handle errors and display them
                    ClientScript.RegisterStartupScript(this.GetType(), "alert",
                        "alert('Error al eliminar: " + HttpUtility.JavaScriptStringEncode(ex.Message) + "');", true);
                }
            }
        }
    }
}
