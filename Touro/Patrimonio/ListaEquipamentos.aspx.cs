using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Touro.Patrimonio
{
    public partial class ListaEquipamentos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cbSala_CheckedChanged(object sender, EventArgs e)
        {
            ddlSala.Enabled = cbSala.Checked;
        }

        protected void cbTipo_CheckedChanged(object sender, EventArgs e)
        {
            ddlTipoEquip.Enabled = cbTipo.Checked;
        }

        protected void cbEstado_CheckedChanged(object sender, EventArgs e)
        {
            ddlEstado.Enabled = cbEstado.Checked;
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {

        }
    }
}