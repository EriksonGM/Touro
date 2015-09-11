using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebMatrix.WebData;

namespace Touro
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (WebMatrix.WebData.WebSecurity.UserExists(txtUsername.Text))
                {
                    if (WebSecurity.Login(txtUsername.Text, txtPass.Text))
                    {
                        try
                        {
                            using (SqlConnection SQLconn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ToString()))
                            {
                                SqlCommand cmd = new SqlCommand("Select Nome from Tb_Usuario Where Username ='" + txtUsername.Text + "'", SQLconn);

                                cmd.CommandType = CommandType.Text;

                                SQLconn.Open();

                                ConfigurationManager.AppSettings["Usuario"] = cmd.ExecuteScalar().ToString();

                                SQLconn.Close();
                            }
                        }
                        catch (Exception)
                        {

                            throw;
                        }

                        var returnUrl = Request.QueryString["ReturnUrl"];

                        if (string.IsNullOrEmpty(returnUrl))
                        {
                            Response.Redirect("/Inicio.aspx");
                        }
                        else
                        {
                            Response.Redirect(returnUrl);
                        }
                    }
                    else
                    {
                        lblMsg.Visible = true;
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