using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1_StrongFit
{
    public partial class Inicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] == null)
            {
                Response.Redirect("login.aspx");
            }

        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("homePage.aspx", false);
            Context.ApplicationInstance.CompleteRequest();
        }
    }
}