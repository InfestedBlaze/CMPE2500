using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ICA10 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DropDownCustomerSelect.AppendDataBoundItems = true;
            DropDownCustomerSelect.Items.Add(new ListItem("Please select a customer", ""));
        }
    }

    protected void DropDownCustomerSelect_SelectedIndexChanged(object sender, EventArgs e)
    {
        ListViewOrders.SelectedIndex = -1;
    }
}