/* Author: Nic Wasylyshyn
 * Date: April 18, 2018
 * Description:
 * This webpage will allow you to delete and insert
 * order details into the SQL server by using stored 
 * procedures from a SQL server
 */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ICA14 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ButtonGetOrderDetails_Click(object sender, EventArgs e)
    {
        //Update the gridview
        GridViewOrderDetails.DataBind();
    }

    protected void ButtonDelete_Click(object sender, EventArgs e)
    {
        //Get the orderID and productID of the selected item
        int orderID, productID;
        try
        {
            orderID = int.Parse(GridViewOrderDetails.SelectedDataKey.Values["OrderID"].ToString());
            productID = int.Parse(GridViewOrderDetails.SelectedDataKey.Values["ProductID"].ToString());
        }
        catch { return; }
        //Delete the row
        LabelStatus.Text = NorthwindAccess.DeleteOrderDetails(orderID, productID);
        //Update the gridview
        GridViewOrderDetails.DataBind();
    }

    protected void ButtonInsertRecord_Click(object sender, EventArgs e)
    {
        short quantity;
        //If we don't get an OrderID or a number, just return
        if (TextBoxOrderIDInsert.Text.Length == 0 || !short.TryParse(TextBoxQuantity.Text, out quantity))
            return;

        int OrderID, ProductID;

        try
        {
            //Get the integers for IDs
            OrderID = int.Parse(TextBoxOrderIDInsert.Text);
            ProductID = int.Parse(DropDownListProductList.SelectedValue);
        }
        catch
        {
            //Couldn't parse out the OrderID and the ProductID
            return;
        }
        //Insert the record and update the status bar
        LabelStatusInsert.Text = $"Inserted {NorthwindAccess.InsertOrderDetails(OrderID, ProductID,quantity)} records";
        //Update the gridview
        GridViewOrderDetails.DataBind();
    }
}