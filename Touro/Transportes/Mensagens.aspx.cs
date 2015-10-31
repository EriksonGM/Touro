using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Touro.Transportes
{
    public partial class Mensagens : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public string IsRead(string Data)
        {
            if(string.IsNullOrEmpty(Data))
            {
                return "unread";
            }
            else
            {
                return "";
            }
        }

        protected void lvMsg_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if(e.CommandName == "Read")
            {
                SqlDataSourceMsg.SelectParameters["Id_Msg"].DefaultValue = e.CommandArgument.ToString();
                fvMensagem.DataBind();
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Read", "$('#ReadModal').modal();", true);

            }
        }

        protected void lvMsg_SelectedIndexChanged(object sender, EventArgs e)
        {
            fvMensagem.DataBind();
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Read", "$('#ReadModal').modal();", true);
        }
    }
}