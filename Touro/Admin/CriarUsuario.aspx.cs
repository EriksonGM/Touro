using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebMatrix.WebData;

namespace Touro.Admin
{
    public partial class CriarUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if(Page.IsValid)
            {
                if (!WebSecurity.UserExists(txtUsername.Text))
                {
                    WebSecurity.CreateUserAndAccount(txtUsername.Text, txtPass.Text, new
                    {
                        Nome = txtNome.Text
                    });

                    if (cbSoli.Checked)
                    {
                        Roles.AddUserToRole(txtUsername.Text, "Solicitacao");
                    }

                    if (cbPatr.Checked)
                    {
                        Roles.AddUserToRole(txtUsername.Text, "Patrimonio");
                    }

                    if (cbTran.Checked)
                    {
                        Roles.AddUserToRole(txtUsername.Text, "Transportes");
                    }

                    if (cbArea.Checked)
                    {
                        Roles.AddUserToRole(txtUsername.Text, "AreaTecnica");
                    }

                    if (cbEsta.Checked)
                    {
                        Roles.AddUserToRole(txtUsername.Text, "Estatistica");
                    }

                    if (cbGest.Checked)
                    {
                        Roles.AddUserToRole(txtUsername.Text, "Admin");
                    }

                    try
                    {
                        using (SqlConnection SQLconn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ToString()))
                        {
                            SqlCommand cmd = new SqlCommand("RegNewUser", SQLconn);

                            cmd.CommandType = CommandType.StoredProcedure;

                            cmd.Parameters.AddWithValue("@Id_Usuario", WebSecurity.CurrentUserId);

                            cmd.Parameters.AddWithValue("@Username", txtUsername.Text);

                            SQLconn.Open();

                            string Id = cmd.ExecuteScalar().ToString();

                            SQLconn.Close();

                            Response.Redirect("/Admin/GerirUsuarios.aspx?Id="+Id);
                        }
                    }
                    catch(Exception)
                    {

                    }
                }
                else
                {
                    lblMsg.Visible = true;
                }

            }
           
        }
    }
}