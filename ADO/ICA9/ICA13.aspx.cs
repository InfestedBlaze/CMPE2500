using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ICA13 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillDDL(DropDownListCustomers, "");
        }
    }

    protected void DropDownListCustomers_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewCustomerCategory.DataSource = NorthwindAccess.CustomerCategorySummary(DropDownListCustomers.SelectedValue);
        GridViewCustomerCategory.DataBind();
    }

    protected void ButtonFilter_Click(object sender, EventArgs e)
    {
        FillDDL(DropDownListCustomers, TextBoxFilter.Text);
    }

    private void FillDDL(DropDownList ddl, string filter)
    {
        ddl.AppendDataBoundItems = true;
        ddl.DataSource = NorthwindAccess.GetCustomerSDS(filter); // binds the SDS
        ddl.DataTextField = "CustomerName";
        ddl.DataValueField = "CustomerID";
        ddl.Items.Clear(); // clear any existing items
        ddl.DataBind();
        ddl.Items.Insert(0, new ListItem($"Please Pick a Customer from [{ddl.Items.Count}]", ""));
        ddl.AutoPostBack = true;
    }
}