using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using WebMatrix.WebData;

namespace Touro
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            WebSecurity.InitializeDatabaseConnection("Conn", "Tb_Usuario", "Id_Usuario", "Username", true);

            if (!Roles.RoleExists("Admin"))
            {
                Roles.CreateRole("Admin");
            }

            if (!Roles.RoleExists("Patrimonio"))
            {
                Roles.CreateRole("Patrimonio");
            }

            if (!Roles.RoleExists("Transportes"))
            {
                Roles.CreateRole("Transportes");
            }

            if (!Roles.RoleExists("Solicitacao"))
            {
                Roles.CreateRole("Solicitacao");
            }

            if (!Roles.RoleExists("AreaTecnica"))
            {
                Roles.CreateRole("AreaTecnica");
            }

            if (!Roles.RoleExists("Estatistica"))
            {
                Roles.CreateRole("Estatistica");
            }

            if (!WebSecurity.UserExists("admin"))
            {
                WebSecurity.CreateUserAndAccount("admin", "admin", new
                {
                    Nome = "Admin"
                });

                Roles.AddUserToRole("admin", "Admin");
            }
        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}