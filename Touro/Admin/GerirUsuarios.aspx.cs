using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Touro.Admin
{
    public partial class GerirUsuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var Id = Request.QueryString["Id"];

            if (!string.IsNullOrEmpty(Id))
            {
                //lvUsuarios.Items[].DataItem;
                //lvUsuarios.SelectItem();
            }


        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {

        }

        protected void fvOps_ItemCommand(object sender, FormViewCommandEventArgs e)
        {
            if (e.CommandName == "Permicoes")
            {
                if (((CheckBox)fvOps.FindControl("cbSoli")).Checked)
                {
                    if (!Roles.IsUserInRole(e.CommandArgument.ToString(), "Solicitacao"))
                    {
                        Roles.AddUserToRole(e.CommandArgument.ToString(), "Solicitacao");
                    }
                }
                else
                {
                    if (Roles.IsUserInRole(e.CommandArgument.ToString(), "Solicitacao"))
                    {
                        Roles.RemoveUserFromRole(e.CommandArgument.ToString(), "Solicitacao");
                    }
                }

                if (((CheckBox)fvOps.FindControl("cbPatr")).Checked)
                {
                    if (!Roles.IsUserInRole(e.CommandArgument.ToString(), "Patrimonio"))
                    {
                        Roles.AddUserToRole(e.CommandArgument.ToString(), "Patrimonio");
                    }
                }
                else
                {
                    if (Roles.IsUserInRole(e.CommandArgument.ToString(), "Patrimonio"))
                    {
                        Roles.RemoveUserFromRole(e.CommandArgument.ToString(), "Patrimonio");
                    }
                }

                if (((CheckBox)fvOps.FindControl("cbTran")).Checked)
                {
                    if (!Roles.IsUserInRole(e.CommandArgument.ToString(), "Transportes"))
                    {
                        Roles.AddUserToRole(e.CommandArgument.ToString(), "Transportes");
                    }
                }
                else
                {
                    if (Roles.IsUserInRole(e.CommandArgument.ToString(), "Transportes"))
                    {
                        Roles.RemoveUserFromRole(e.CommandArgument.ToString(), "Transportes");
                    }
                }

                if (((CheckBox)fvOps.FindControl("cbArea")).Checked)
                {
                    if (!Roles.IsUserInRole(e.CommandArgument.ToString(), "AreaTecnica"))
                    {
                        Roles.AddUserToRole(e.CommandArgument.ToString(), "AreaTecnica");
                    }
                }
                else
                {
                    if (Roles.IsUserInRole(e.CommandArgument.ToString(), "AreaTecnica"))
                    {
                        Roles.RemoveUserFromRole(e.CommandArgument.ToString(), "AreaTecnica");
                    }
                }

                if (((CheckBox)fvOps.FindControl("cbEsta")).Checked)
                {
                    if (!Roles.IsUserInRole(e.CommandArgument.ToString(), "Estatistica"))
                    {
                        Roles.AddUserToRole(e.CommandArgument.ToString(), "Estatistica");
                    }
                }
                else
                {
                    if (Roles.IsUserInRole(e.CommandArgument.ToString(), "Estatistica"))
                    {
                        Roles.RemoveUserFromRole(e.CommandArgument.ToString(), "Estatistica");
                    }
                }

                if (((CheckBox)fvOps.FindControl("cbGest")).Checked)
                {
                    if (!Roles.IsUserInRole(e.CommandArgument.ToString(), "Admin"))
                    {
                        Roles.AddUserToRole(e.CommandArgument.ToString(), "Admin");
                    }
                }
                else
                {
                    if (Roles.IsUserInRole(e.CommandArgument.ToString(), "Admin"))
                    {
                        Roles.RemoveUserFromRole(e.CommandArgument.ToString(), "Admin");
                    }
                }
                SqlDataSourceUsuario.InsertParameters["Id_Usuario"].DefaultValue = WebMatrix.WebData.WebSecurity.CurrentUserId.ToString();
                SqlDataSourceUsuario.Insert();
                Response.Redirect(Request.RawUrl);
            }

            if (e.CommandName == "Senha")
            {
                string Token = WebMatrix.WebData.WebSecurity.GeneratePasswordResetToken(e.CommandArgument.ToString());
                WebMatrix.WebData.WebSecurity.ResetPassword(Token, ((TextBox)fvOps.FindControl("txtPass")).Text);

                SqlDataSourceUsuarios.InsertParameters["Id_Usuario"].DefaultValue = WebMatrix.WebData.WebSecurity.CurrentUserId.ToString();
                SqlDataSourceUsuarios.Insert();
                Response.Redirect(Request.RawUrl);
            }



        }

        //public string NomeUsuario(int Id)
        //{
        //    int I = 0;



        //    return I;
        //}

    }
}