using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Touro.Patrimonio
{
    public partial class CadastrarEquipamento : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSaveEquip_Click(object sender, EventArgs e)
        {
            //try
            //{
                SqlDataSourceTipoEquip.InsertParameters["Id_Usuario"].DefaultValue = WebMatrix.WebData.WebSecurity.CurrentUserId.ToString();
                SqlDataSourceTipoEquip.Insert();
            //}
            //catch (Exception)
            //{

            //    throw;
            //}
        }

        protected void SqlDataSourceTipoEquip_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            try
            {
                Response.Redirect("/Patrimonio/Equipamento.aspx?Id=" + e.Command.Parameters["@RETURN_VALUE"].Value.ToString());

            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}