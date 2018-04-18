/* Author: Nic Wasylyshyn
 * Date: April 18, 2018
 * Description:
 * This webpage will allow you to view customer information
 * by using stored procedures from a SQL server
 */
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

    protected void GridViewCustomerCategory_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if(e.Row.Cells.Count == 3)
        {
            e.Row.Cells[1].HorizontalAlign = HorizontalAlign.Center;
            e.Row.Cells[2].HorizontalAlign = HorizontalAlign.Right;
            if(decimal.TryParse(e.Row.Cells[2].Text, out decimal temp))
            {
                e.Row.Cells[2].Text = temp.ToString("C2");
            }
        }
    }
}