using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Touro.Admin
{
    public partial class ModeloEquipamentos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void txtModeloEquip_TextChanged(object sender, EventArgs e)
        {
            

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (txtModeloEquip.Text != "")
            {
                SqlDataSourceMarcaEquip.InsertParameters["Id_Usuario"].DefaultValue = WebMatrix.WebData.WebSecurity.CurrentUserId.ToString();
                SqlDataSourceMarcaEquip.Insert();
                Response.Redirect(Request.RawUrl);
            }
        }
    }
}