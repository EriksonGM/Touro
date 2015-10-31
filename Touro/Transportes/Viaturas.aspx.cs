using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Touro.Transportes
{
    public partial class Viaturas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnOk_Click(object sender, EventArgs e)
        {
            SqlDataSourceViaturas.InsertParameters["Id_Usuario"].DefaultValue = WebMatrix.WebData.WebSecurity.CurrentUserId.ToString();
            SqlDataSourceViaturas.InsertParameters["Matricula"].DefaultValue = txtMatricula.Text.ToUpper();
            SqlDataSourceViaturas.InsertParameters["NumMotor"].DefaultValue = txtNumMotor.Text.ToUpper();
            SqlDataSourceViaturas.InsertParameters["Pneus"].DefaultValue = txtPneus.Text.ToUpper();
            SqlDataSourceViaturas.Insert();
            Util.Notificar();
            Response.Redirect(Request.RawUrl);
        }
    }
}