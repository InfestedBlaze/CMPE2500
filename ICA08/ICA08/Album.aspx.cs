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
        if (!IsPostBack)
        {
            if (Page.PreviousPage != null && Page.PreviousPage.IsCrossPagePostBack && Session["username"] != null)
            {
                //Reset variables
                PlaceHolderImages.Controls.Clear();
                int picCount = 0;
                FileInfo[] fiA;

                //Get how many things we have in a folder
                string path = MapPath(@"/Uploads/" + Session["username"]);
                if (Directory.Exists(path))
                {
                    //Grab all the files
                    DirectoryInfo di = new DirectoryInfo(path);
                    fiA = di.GetFiles();
                    picCount = fiA.Length;

                    //Add all the pictures to the placeholder
                    foreach (FileInfo item in fiA)
                    {
                        Image img = new Image();
                        img.ImageUrl = @"\Uploads\" + Session["username"] + "\\" + item.Name.ToString();
                        img.Height = 200;
                        img.Visible = true;

                        object hf = Page.PreviousPage.FindControl("LastUploadedPic");
                        if ((hf is HiddenField) && item.Name.ToString() == (hf as HiddenField).Value)
                        {
                            img.BorderColor = System.Drawing.Color.Red;
                            img.BorderWidth = 1;
                        }
                        PlaceHolderImages.Controls.Add(img);
                    }
                }
                //Set the header text
                Header.InnerText = $"{Session["username"]}'s Album of [{picCount}]";
                //Set picCount to hidden field
                PictureCount.Value = picCount.ToString();
            }
            else
            {
                Button ret = new Button();
                ret.PostBackUrl = "ica08_NicW.aspx";
                ret.Text = "You are not logged in. Please return to login.";
                PlaceHolderImages.Controls.Add(ret);
                UploadAgain.Visible = false;
            }
        }
    }
}