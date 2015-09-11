using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Touro.Admin
{
    public partial class DadosPatrimonio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnTipoEquip_Click(object sender, EventArgs e)
        {
            //if(txtTipoEquip.Text!="")
            //{
            //    SqlDataSourceTipo.InsertParameters["Id_Usuario"].DefaultValue = WebMatrix.WebData.WebSecurity.CurrentUserId.ToString();
            //    SqlDataSourceTipo.Insert();
            //    txtTipoEquip.Text = "";
            //    lvTipo.DataBind();
            //}
        }

        protected void txtTipoEquip_TextChanged(object sender, EventArgs e)
        {
            if (txtTipoEquip.Text != "")
            {
                SqlDataSourceTipo.InsertParameters["Id_Usuario"].DefaultValue = WebMatrix.WebData.WebSecurity.CurrentUserId.ToString();
                SqlDataSourceTipo.Insert();
                Response.Redirect(Request.RawUrl);
            }
        }

        protected void txtMarca_TextChanged(object sender, EventArgs e)
        {
            if(txtMarca.Text != "")
            {
                SqlDataSourceMarca.InsertParameters["Id_Usuario"].DefaultValue = WebMatrix.WebData.WebSecurity.CurrentUserId.ToString();
                SqlDataSourceMarca.Insert();
                Response.Redirect(Request.RawUrl);
            }
        }
    }
}