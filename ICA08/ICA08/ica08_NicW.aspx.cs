using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.IO;
using System.Web.UI.WebControls;

public partial class ica08_NicW : System.Web.UI.Page
{
    //Page items
    protected void Page_Load(object sender, EventArgs e)
    {
        //If it is our first time on the page
        if (!IsCallback)
        {
            Status.Text = "Let's begin.";
        }

        //Back from our album page
        if (Page.PreviousPage != null && Page.PreviousPage.IsCrossPagePostBack)
        {
            object hf = Page.PreviousPage.FindControl("PictureCount");
            //Add another picture
            if(hf is HiddenField)
            {
                Status.Text = $"Add another! You already have {(hf as HiddenField).Value}";
                MultiView.ActiveViewIndex = 1;
            }
            
            if(Session["username"] == null)
            {
                Status.Text = "Login";
                MultiView.ActiveViewIndex = 0;
            }
        }
    }

    protected void Logout_Click(object sender, EventArgs e)
    {
        //Clear the session
        Session.Clear();
        //Go back to login screen
        MultiView.ActiveViewIndex = 0;
    }

    //View 1 items
    protected void Nextv1_Click(object sender, EventArgs e)
    {
        //Must have a username and password entered
        if(UsernameInput.Text == "")
        {
            Status.Text = "Must input a username.";
            UsernameInput.Focus();
            return;
        }
        else if (PasswordInput.Text == "")
        {
            Status.Text = "Must input a password.";
            PasswordInput.Focus();
            return;
        }
        //"Login" and move to next view
        Status.Text = "Successfully logged in.";
        Session["username"] = UsernameInput.Text;
        MultiView.ActiveViewIndex++;
    }

    //View 2 items
    protected void View2_Activate(object sender, EventArgs e)
    {
        //Thank the user, with our Session global
        ThankYou.Text = $"Thank you {Session["username"]}, select a picture to upload:";
    }

    protected void Nextv2_Click(object sender, EventArgs e)
    {
        //If we don't have a file yet
        if (!FileUpload_Image.HasFile)
        {
            Status.Text = "You need to select an image to upload.";
            return;
        }

        //If not a picture, return
        if (FileUpload_Image.PostedFile.ContentType != "image/jpeg" &&
            FileUpload_Image.PostedFile.ContentType != "image/jpg" &&
            FileUpload_Image.PostedFile.ContentType != "image/png")
        {
            Status.Text = "Can't upload that filetype.";
            return;
        }

        //Construct our save folder path
        string savePath = MapPath(@"/Uploads/" + Session["username"]);

        //If we don't have that username yet
        if (!Directory.Exists(savePath))
        {
            Directory.CreateDirectory(savePath);
        }

        //If we have a file by that name already, delete it
        if (File.Exists(savePath + @"\" + FileUpload_Image.FileName))
        {
            File.Delete(savePath + @"\" + FileUpload_Image.FileName);
        }

        try
        {
            FileUpload_Image.SaveAs(savePath + @"\" + FileUpload_Image.FileName);
        }
        catch
        {
            Status.Text = "Failed to save picture";
            return;
        }

        //Save our last pic filename
        LastUploadedPic.Value = FileUpload_Image.FileName;
        //Saved the file successfully
        Status.Text = $"Saved picture: {FileUpload_Image.FileName}";
        //Go to next view
        MultiView.ActiveViewIndex++;
    }
}