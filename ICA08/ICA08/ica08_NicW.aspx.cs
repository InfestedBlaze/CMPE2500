using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ica08_NicW : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsCallback)
        {
            MultiView.ActiveViewIndex = 0;
            Status.Text = "Let's begin.";
        }
    }

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

        Status.Text = "Successfully logged in.";
        Session["username"] = UsernameInput.Text;
        MultiView.ActiveViewIndex++;
    }

    protected void View2_Activate(object sender, EventArgs e)
    {
        ThankYou.Text = $"Thank you {Session["username"]}, select a picture to upload:";
    }

    protected void Nextv2_Click(object sender, EventArgs e)
    {

        MultiView.ActiveViewIndex++;
    }
}