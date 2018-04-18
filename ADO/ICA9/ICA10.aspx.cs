using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;


public partial class ICA9 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ButtonProducts_Click(object sender, EventArgs e)
    {
        MVInfoSelector.Visible = true;
        MVInfoSelector.SetActiveView(ViewProducts);
    }

    protected void ButtonEmployees_Click(object sender, EventArgs e)
    {
        MVInfoSelector.Visible = true;
        MVInfoSelector.SetActiveView(ViewEmployees);
    }

    protected void GridViewProducts_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        // Fire for every row generated for view
        if (e == null || e.Row == null || e.Row.DataItem == null)
            return; // can't get to data, bail out, nothing to do here

        //Grab all the data from that row
        DataRowView drv = e.Row.DataItem as DataRowView;

        if((short)drv["UnitsInStock"] < 25)
        {
            e.Row.BackColor = Color.LightSalmon;
        }

        if((decimal)drv["UnitPrice"] > 25)
        {
            e.Row.Cells[2].BackColor = Color.Yellow;
        }

        if((short)drv["UnitsInStock"] < 20 && (short)drv["UnitsOnOrder"] < 5)
        {
            e.Row.BackColor = Color.Cyan;
            e.Row.Cells[3].BackColor = Color.GreenYellow;
        }
    }

    protected void GridViewEmployees_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        // Fire for every row generated for view
        if (e == null || e.Row == null || e.Row.DataItem == null)
            return; // can't get to data, bail out, nothing to do here

        //Grab all the data from that row
        DataRowView drv = e.Row.DataItem as DataRowView;
    }
}