using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Touro.Patrimonio
{
    public partial class HistorialEntradas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lvEnttradaStock_DataBound(object sender, EventArgs e)
        {

            var I = Request.QueryString["Id"];

            if (!string.IsNullOrEmpty(I))
            {
                for (int i = 0; i < lvEnttradaStock.Items.Count; i++)
                {
                    // Ignore values that cannot be cast as integer.
                    try
                    {
                        if (lvEnttradaStock.DataKeys[i].Value.ToString() == I)
                            lvEnttradaStock.SelectedIndex = i;
                    }
                    catch { }
                }
            }


        }
    }
}