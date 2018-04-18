using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            foreach (FileInfo fi in new DirectoryInfo(MapPath(".")).GetFiles())
            {
                if (fi.Name.Contains(".aspx") && !fi.Name.Contains(".cs"))
                {
                    HyperLink hl = new HyperLink();
                    hl.Text = fi.Name;
                    hl.NavigateUrl = fi.Name;
                    HyperLinks.Controls.Add(hl);
                    HyperLinks.Controls.Add(new LiteralControl("<br />"));
                }
            }
        }
    }
}