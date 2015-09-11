using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Touro.Patrimonio
{
    public partial class CadastrarConsumivel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            SqlDataSourceTipoConsumivel.InsertParameters["Id_Usuario"].DefaultValue = WebMatrix.WebData.WebSecurity.CurrentUserId.ToString();
            SqlDataSourceTipoConsumivel.Insert();

        }

        protected void SqlDataSourceTipoConsumivel_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            Response.Redirect("/Patrimonio/Consumivel.aspx?Id=" + e.Command.Parameters["@RETURN_VALUE"].Value.ToString());
        }
    }
}