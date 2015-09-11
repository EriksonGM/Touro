using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Touro.Patrimonio
{
    public partial class EntradaStock : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            SqlDataSourceConsumivel.InsertParameters["Id_Usuario"].DefaultValue = WebMatrix.WebData.WebSecurity.CurrentUserId.ToString();
            SqlDataSourceConsumivel.Insert();
            
        }

        protected void SqlDataSourceConsumivel_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            Response.Redirect("/Patrimonio/HistorialEntradas.aspx?Id="+e.Command.Parameters["@RETURN_VALUE"].Value.ToString());
        }
    }
}