using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Touro.Transportes
{
    public partial class Saidas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnOk_Click(object sender, EventArgs e)
        {
            SqlDataSourceSaidas.InsertParameters["Id_Usuario"].DefaultValue = WebMatrix.WebData.WebSecurity.CurrentUserId.ToString();
            SqlDataSourceSaidas.InsertParameters["KmEntrada"].DefaultValue = ((TextBox)fvKmEntrada.FindControl("txtKmEntrada")).Text;
            SqlDataSourceSaidas.Insert();
            Util.Notificar();
            Response.Redirect(Request.RawUrl);
        }
    }
}