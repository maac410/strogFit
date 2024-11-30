using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1_StrongFit
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (Session["Usuario"] == null)
                {
                    Response.Redirect("~/homePage.aspx", true);
                }
            }
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/homePage.aspx", true);
            Context.ApplicationInstance.CompleteRequest();
        }
    }
}