using System;
using System.Web;

namespace StrongFit
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Limpia la sesión
            Session.Clear();
            Session.Abandon();

            // Configura cabeceras para evitar caché del navegador
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
            Response.Cache.SetNoStore();

            // Redirige a la página principal
            Response.Redirect("homePage.aspx", true);
        }
    }
}
