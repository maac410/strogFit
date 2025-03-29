using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StrongFit.dataDisplay.Alimentos
{
    public partial class RegistroAlimento : System.Web.UI.Page
    {
        String cadenaConexion = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
        String pa_idAlimentos;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadRegistro();
                if (Request.Form["idAlimentos"] != null)
                {
                    pa_idAlimentos = Request.Form["idAlimentos"];
                    lblAccion.Text = "Actualizar Alimento";
                    btnUpdate.Visible = true;
                    txtAlimento.Enabled = false;
                    CargarDatos();
                }
                else
                {
                    lblAccion.Text = "Insertar alimento";
                    btnAñadir.Visible = true;
                }
            }
        }

        private void CargarDatos()
        {
            using (MySqlConnection conexion = new MySqlConnection(cadenaConexion))
            {
                try
                {
                    // Fix the parameter name to use ID for fetching
                    MySqlCommand comando = new MySqlCommand("SELECT alimento, cantidad, Tamaño_ración FROM alimentos WHERE idAlimento = @idAlimento", conexion);
                    comando.Parameters.AddWithValue("@idAlimento", pa_idAlimentos); // Using ID for fetching the data

                    conexion.Open();
                    MySqlDataReader lector = comando.ExecuteReader();
                    if (lector.HasRows)
                    {
                        lector.Read();
                        txtAlimento.Text = lector["alimento"].ToString();
                        txtCantidad.Text = lector["cantidad"].ToString();
                        ddlPorcion.SelectedValue = lector["Tamaño_ración"].ToString();
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No se encontró el alimento para actualizar');", true);
                    }
                }
                catch (Exception ex)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Error general: " + HttpUtility.JavaScriptStringEncode(ex.Message) + "');", true);
                }
            }
        }

        private void LoadRegistro()
        {
            using (MySqlConnection conexion = new MySqlConnection(cadenaConexion))
            {
                try
                {
                    string sql = "SELECT * FROM alimentos";
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
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Error al cargar datos: " + HttpUtility.JavaScriptStringEncode(ex.Message) + "');", true);
                }
            }
        }

        protected void btnAñadir_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string alimento = txtAlimento.Text;
                string cantidad = txtCantidad.Text;
                string Porcion = ddlPorcion.Text;

                using (MySqlConnection conexion = new MySqlConnection(cadenaConexion))
                {
                    try
                    {
                        using (MySqlCommand comando = new MySqlCommand("INSERT INTO alimentos (alimento, cantidad, tamaño_ración) VALUES (@alimento, @Cantidad, @tamaño_ración)", conexion))
                        {
                            comando.Parameters.AddWithValue("alimento", alimento);
                            comando.Parameters.AddWithValue("cantidad", cantidad);
                            comando.Parameters.AddWithValue("tamaño_ración", Porcion);

                            conexion.Open();
                            comando.ExecuteNonQuery();
                        }

                        // Clear input fields after successful insert
                        txtAlimento.Text = "";
                        txtCantidad.Text = "";
                        ddlPorcion.SelectedIndex = 0;
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Alimento Ingresado con Exito.');", true);
                    }
                    catch (Exception ex)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Error general: " + HttpUtility.JavaScriptStringEncode(ex.Message) + "');", true);
                    }
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string alimento = txtAlimento.Text;
                string cantidad = txtCantidad.Text;
                string Porcion = ddlPorcion.Text;

                using (MySqlConnection conexion = new MySqlConnection(cadenaConexion))
                {
                    try
                    {
                        using (MySqlCommand comando = new MySqlCommand("UPDATE alimentos SET cantidad = @cantidad, tamaño_ración = @tamaño_ración WHERE alimento = @alimento", conexion))
                        {
                            comando.Parameters.AddWithValue("@alimento", alimento);
                            comando.Parameters.AddWithValue("@cantidad", cantidad);
                            comando.Parameters.AddWithValue("@tamaño_ración", Porcion);

                            conexion.Open();
                            int filasAfectadas = comando.ExecuteNonQuery();

                            if (filasAfectadas > 0)
                            {
                                string script = "alert('Alimento Actualizado exitosamente.');window.location.href='Alimentos.aspx'";
                                ClientScript.RegisterStartupScript(this.GetType(), "RedirectOK", script, true);
                            }
                            else
                            {
                                string script = "alert('Alimento no registrado.');window.location.href='Alimentos.aspx'";
                                ClientScript.RegisterStartupScript(this.GetType(), "RedirectNf", script, true);
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Error general: " + HttpUtility.JavaScriptStringEncode(ex.Message) + "');", true);
                    }
                }
            }
        }
    }
}
