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

namespace Touro
{
    public partial class LayOut : System.Web.UI.MasterPage
    {
        public string NomeUsuario;
        public string UnreadTransportes;
        protected void Page_Load(object sender, EventArgs e)
        {
            Soli.Visible = Roles.IsUserInRole("Solicitacao");
            Patr.Visible = Roles.IsUserInRole("Patrimonio");
            Tran.Visible = Roles.IsUserInRole("Transportes");
            Area.Visible = Roles.IsUserInRole("AreaTecnica");
            Esta.Visible = Roles.IsUserInRole("Estatistica");
            Admi.Visible = Roles.IsUserInRole("Admin");

            NomeUsuario = Nome();

            UnreadTransportes = UnreadMsgTransportes();
        }
        public string Nome()
        {
            using (SqlConnection SQLconn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ToString()))
            {
                SqlCommand cmd = new SqlCommand("Select Nome from Tb_Usuario Where Id_Usuario ='" + WebMatrix.WebData.WebSecurity.CurrentUserId.ToString() + "'", SQLconn);

                cmd.CommandType = CommandType.Text;

                SQLconn.Open();

                string N = cmd.ExecuteScalar().ToString();

                SQLconn.Close();

                return N;
            }
        }

        public string UnreadMsgTransportes()
        {
            using (SqlConnection SQLconn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ToString()))
            {

                string command = "SELECT COUNT(Tb_Msg.Id_Msg) AS Total FROM Tb_TipoMsg INNER JOIN Tb_Msg ON Tb_TipoMsg.Id_TipoMsg = Tb_Msg.Id_TipoMsg WHERE(Tb_TipoMsg.Id_AreaMsg = 3) and (Tb_Msg.DataRead IS NULL)";

                SqlCommand cmd = new SqlCommand(command, SQLconn);

                cmd.CommandType = CommandType.Text;

                SQLconn.Open();

                string T = cmd.ExecuteScalar().ToString();

                SQLconn.Close();

                if (T == "0")
                {
                    return "";
                }
                else
                {
                    return T;
                }

            }
        }

        protected void btnLogOff_Click(object sender, EventArgs e)
        {
            WebSecurity.Logout();
            Response.Redirect("/Login.aspx");
        }
    }
}