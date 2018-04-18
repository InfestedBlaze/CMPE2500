using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ICA12 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillDDL(DropDownListSuppliers, "");
        }
    }

    protected void ButtonFilter_Click(object sender, EventArgs e)
    {
        FillDDL(DropDownListSuppliers, TextBoxFilter.Text);
    }

    protected void DropDownListSuppliers_SelectedIndexChanged(object sender, EventArgs e)
    {
        BuildTable(NorthwindAccess.GetProducts(DropDownListSuppliers.SelectedValue));
    }

    private void FillDDL(DropDownList ddl, string filter)
    {
        ddl.AppendDataBoundItems = true;
        ddl.DataSource = NorthwindAccess.GetSupplierSDS(filter); // binds the SDS
        ddl.DataTextField = "CompanyName";
        ddl.DataValueField = "SupplierID";
        ddl.Items.Clear(); // clear any existing items
        ddl.DataBind();
        ddl.Items.Insert(0, new ListItem($"Please Pick a Company from [{ddl.Items.Count}]", ""));
        ddl.AutoPostBack = true;
    }

    private void BuildTable(List<List<string>> info)
    {
        //If we don't have any info, don't do anything
        if (info.Count == 0) return;

        TableHeaderRow thr = new TableHeaderRow();
        TableHeaderCell thc;
        TableRow tr;
        TableCell tc;

        //Make the header info
        for (int i = 0; i < info.Count; i++)
        {
            thc = new TableHeaderCell();
            thc.Text = info[i][0];
            thr.Cells.Add(thc);
        }
        TableOutput.Rows.Add(thr);
        
        for (int row = 1; row < info[0].Count; row++)
        {
            tr = new TableRow();
            
            for (int column = 0; column < info.Count; column++)
            {
                tc = new TableCell();
                tc.Text = info[column][row];
                tr.Cells.Add(tc);
            }
            
            TableOutput.Rows.Add(tr);
        }
    }
}