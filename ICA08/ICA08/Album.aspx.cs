using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Album : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int picCount = 0;
        //Get how many things we have in a folder
        string path = MapPath(@"/Uploads/" + Session["username"]);
        if (Directory.Exists(path))
        {
            DirectoryInfo di = new DirectoryInfo(path);
            FileInfo[] fiA = di.GetFiles();
            picCount = fiA.Length;
        }
        //Set the header text
        Header.InnerText = $"{Session["username"]} Album of [{picCount}]";
        //Set picCount to hidden field
        PictureCount.Value = picCount.ToString();
    }
}