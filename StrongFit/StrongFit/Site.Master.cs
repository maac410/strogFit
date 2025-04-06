using System;
using System.Web;
using System.Web.UI;

namespace WebApplication1_StrongFit
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Evita que se almacene la página en caché (clave para el botón atrás)
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
            Response.Cache.SetNoStore();

            if (!IsPostBack)
            {
                if (Session["Usuario"] == null)
                {
                    Response.Redirect("~/homePage.aspx", true);
                }
            }
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            // Elimina cookies de sesión si es necesario
            if (Request.Cookies["ASP.NET_SessionId"] != null)
            {
                Response.Cookies["ASP.NET_SessionId"].Expires = DateTime.Now.AddDays(-1);
            }

            Response.Redirect("~/homePage.aspx", true);
            Context.ApplicationInstance.CompleteRequest();
        }

    }
}
