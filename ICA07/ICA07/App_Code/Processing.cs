using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Drawing;
using System.Web.UI.WebControls;

/// <summary>
/// This will do the processing for the current ICA (07)
/// </summary>
static public class Processing
{
    static public Color MakeColour(byte red, byte green, byte blue, bool grayscale)
    {
        //Check if we are a gray scale colour
        if (grayscale)
        {
            //Spec says use all red as values
            return Color.FromArgb(red, red, red);
        }
        else
        {
            //Make a proper colour
            return Color.FromArgb(red, green, blue);
        }
    }

    static public bool checkNameInListBox(string Name, ListBox refListBox)
    {
        //Go through the entire list box
        for (int i = 0; i < refListBox.Items.Count; i++)
        {
            //If an item matches the name we inputted, return true
            if (Name == refListBox.Items[i].Text)
            {
                return true;
            }
        }
        //No match in list box
        return false;
    }

    static public bool checkColourInListBox(Color inColour, ListBox refListBox)
    {
        //Go through the entire list box
        for (int i = 0; i < refListBox.Items.Count; i++)
        {
            //If an item matches the name we inputted, return true
            if (inColour.ToArgb().ToString() == refListBox.Items[i].Value)
            {
                return true;
            }
        }
        //No match in list box
        return false;
    }
}