using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Touro.Patrimonio
{
    public partial class Sala : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lvSolicitantes_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            SqlDataSourceSolicitante.DeleteParameters["Id_Usuario"].DefaultValue = WebMatrix.WebData.WebSecurity.CurrentUserId.ToString();
            SqlDataSourceSolicitante.DeleteParameters["Id_Solicitante"].DefaultValue = e.CommandArgument.ToString();
            SqlDataSourceSolicitante.Delete();
            lvSolicitantes.DataBind();
            ListViewAutorizar.DataBind();
        }

        protected void ListViewAutorizar_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            SqlDataSourceAutorizar.InsertParameters["Id_Usuario"].DefaultValue = WebMatrix.WebData.WebSecurity.CurrentUserId.ToString();
            SqlDataSourceAutorizar.InsertParameters["Id_Solicitante"].DefaultValue = e.CommandArgument.ToString();
            SqlDataSourceAutorizar.Insert();
            lvSolicitantes.DataBind();
            ListViewAutorizar.DataBind();
        }
    }
}