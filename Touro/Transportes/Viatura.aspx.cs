using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Touro.Transportes
{
    public partial class Viatura : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnOk_Click(object sender, EventArgs e)
        {
            SqlDataSourceManu.InsertParameters["Id_Usuario"].DefaultValue = WebMatrix.WebData.WebSecurity.CurrentUserId.ToString();
            SqlDataSourceManu.Insert();
            Util.Notificar();
            Response.Redirect(Request.RawUrl);
        }

        public int LastCheck(int Km, int Intervalo )
        {
            using (SqlConnection SQLconn = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ToString()))
            {
                string c = "Select Max(Km) from Tb_CheckViatura Where Id_Viatura = " + Request.QueryString["Id"].ToString();

                SqlCommand cmd = new SqlCommand(c, SQLconn);

                cmd.CommandType = CommandType.Text;

                SQLconn.Open();

                int R = (int)cmd.ExecuteScalar();

                SQLconn.Close();

                return Intervalo - (Km- R);
            }
        }

    }
}