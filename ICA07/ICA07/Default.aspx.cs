using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Drawing;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //Programmitically add radio buttons
            greenAmount.Items.Add(new ListItem("0%", "0"));
            greenAmount.Items.Add(new ListItem("50%", "128"));
            greenAmount.Items.Add(new ListItem("100%", "255"));

            greenAmount.Items[0].Selected = true;
        }
    }

    protected void ButtonPreviewColour_Click(object sender, EventArgs e)
    {
        //Get colour from our form items
        Color? temp = GetColour();

        if(temp != null)
        {
            //If it isn't null, set the colour
            PreviewColor.BackColor = (Color)temp;
            //Clear our status bar
            StatusBar.Text = "&nbsp;";
        }
    }

    protected void ButtonSaveColour_Click(object sender, EventArgs e)
    {
        Color? tempColour = GetColour();

        //Can't make our colour
        if(tempColour == null)
        {
            StatusBar.ForeColor = Color.Red;
            StatusBar.Text = "Can not make colour.";
            return;
        }

        //Our colour is valid, save it as a colour
        Color validColour = (Color)tempColour;

        //Colour is already saved
        if(Processing.checkColourInListBox(validColour, SavedColours))
        {
            StatusBar.ForeColor = Color.Red;
            StatusBar.Text = "Colour is already saved.";
            return;
        }

        //Don't have a name for our colour
        if(ColourNameInput.Text.Length == 0)
        {
            StatusBar.ForeColor = Color.Red;
            StatusBar.Text = "Need a name for the colour";
            return;
        }
        //We don't have that name in our list box
        else if(Processing.checkNameInListBox(ColourNameInput.Text, SavedColours))
        {
            StatusBar.ForeColor = Color.Red;
            StatusBar.Text = "Name already saved.";
            return;
        }

        SavedColours.Items.Add(new ListItem(ColourNameInput.Text, validColour.ToArgb().ToString()));
        StatusBar.ForeColor = Color.Green;
        StatusBar.Text = $"Colour - {ColourNameInput.Text} : Saved Successfully";
    }

    protected void SavedColours_SelectedIndexChanged(object sender, EventArgs e)
    {
        PreviewColor.BackColor = Color.FromArgb(int.Parse(SavedColours.SelectedItem.Value));

        StatusBar.ForeColor = Color.Green;
        StatusBar.Text = $"Colour - {SavedColours.SelectedItem.Text} : Successfully Loaded";
    }

    private Color? GetColour()
    {
        byte red = 0, green = 0, blue = 0;

        try
        {
            red = byte.Parse(redAmount.Text);
            
            green = byte.Parse(greenAmount.SelectedItem.Value);
            
            blue = byte.Parse(blueAmount.SelectedItem.Value);
                    
        }
        catch
        {
            return null;
        }

        return Processing.MakeColour(red, green, blue, grayscale.Checked);
    }
}