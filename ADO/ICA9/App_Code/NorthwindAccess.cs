using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

public static class NorthwindAccess
{
    public static SqlDataSource GetSupplierSDS(string filter)
    {
        string query = "SELECT CompanyName, SupplierID FROM Suppliers";
        query += " WHERE CompanyName LIKE '%" + filter + "%'";

        return new SqlDataSource(ConfigurationManager.ConnectionStrings["nwasylyshyn1_NorthwindNewConnectionString"].ConnectionString, query);
    }

    public static List<List<string>> GetProducts(string SupplierID)
    {
        List<List<string>> output = new List<List<string>>();

        //Don't have a string to check, just leave with nothing
        if (SupplierID.Length == 0) return output;

        string query = $"SELECT ProductName, QuantityPerUnit, UnitsInStock FROM Products WHERE SupplierID = '{SupplierID}'";

        using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["nwasylyshyn1_NorthwindNewConnectionString"].ConnectionString))
        {
            using (SqlCommand command = new SqlCommand(query, conn))
            {
                conn.Open(); // open our connection
                SqlDataReader reader = command.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
                if (!reader.HasRows) return output; // NO rows, explicit return
                while (reader.Read()) // true while a result row exists that is not consumed
                {
                    //We don't have headers yet
                    if(output.Count == 0)
                    {
                        //Go through all the fields
                        for (int i = 0; i < reader.FieldCount; i++)
                        {
                            //Add the headers to the top of our lists
                            output.Add(new List<string>() { reader.GetName(i)});
                        }
                    }

                    //Add all of the info to our lists
                    for (int i = 0; i < reader.FieldCount; i++)
                    {
                        output[i].Add(reader[i].ToString());
                    }
                }
            }
        }

        return output;
    }


    public static SqlDataReader GetCustomerSDS(string filter)
    {
        SqlDataReader output = null;
        
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["nwasylyshyn1_NorthwindNewConnectionString"].ConnectionString);
        conn.Open();

        using (SqlCommand command = new SqlCommand())
        {
            command.Connection = conn; // Set connection to 'talk' with
            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.CommandText = "GetCustomers"; // SP name, not query here

            // Create and Populate parameters
            SqlParameter pFilter = new SqlParameter("@filter", System.Data.SqlDbType.VarChar, 25);
            pFilter.Value = filter; // set the VALUE
            pFilter.Direction = System.Data.ParameterDirection.Input;
            command.Parameters.Add(pFilter); // ADD IT !!!!

            output = command.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
        }

        return output;
    }

    public static SqlDataReader CustomerCategorySummary(string CustomerID)
    {
        SqlDataReader output = null;

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["nwasylyshyn1_NorthwindNewConnectionString"].ConnectionString);
        conn.Open();

        using (SqlCommand command = new SqlCommand())
        {
            command.Connection = conn; // Set connection to 'talk' with
            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.CommandText = "CustCatSummary"; // SP name, not query here

            // Create and Populate parameters
            SqlParameter customerID = new SqlParameter("@CustomerID", System.Data.SqlDbType.NChar, 5);
            customerID.Value = CustomerID; // set the VALUE
            customerID.Direction = System.Data.ParameterDirection.Input;
            command.Parameters.Add(customerID); // ADD IT !!!!

            output = command.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
        }

        return output;
    }

    public static string DeleteOrderDetails(int OrderID, int ProductID)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["nwasylyshyn1_NorthwindNewConnectionString"].ConnectionString);
        conn.Open();

        using (SqlCommand command = new SqlCommand())
        {
            command.Connection = conn; // Set connection to 'talk' with
            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.CommandText = "DeleteOrderDetails"; // SP name, not query here

            // Create and Populate parameters
            SqlParameter orderID = new SqlParameter("@OrderID", System.Data.SqlDbType.Int);
            orderID.Value = OrderID; // set the VALUE
            orderID.Direction = System.Data.ParameterDirection.Input;
            command.Parameters.Add(orderID); // ADD IT !!!!

            SqlParameter productID = new SqlParameter("@ProductID", System.Data.SqlDbType.Int);
            productID.Value = ProductID; // set the VALUE
            productID.Direction = System.Data.ParameterDirection.Input;
            command.Parameters.Add(productID); // ADD IT !!!!

            SqlParameter message = new SqlParameter("@Message", System.Data.SqlDbType.VarChar, 80);
            message.Value = "";
            message.Direction = System.Data.ParameterDirection.Output;
            command.Parameters.Add(message);

            command.ExecuteNonQuery();
            conn.Close();

            //Return the value of the output
            return message.Value.ToString();
        }
    }

    public static int InsertOrderDetails(int OrderID, int ProductID, short Quantity)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["nwasylyshyn1_NorthwindNewConnectionString"].ConnectionString);
        conn.Open();

        using (SqlCommand command = new SqlCommand())
        {
            command.Connection = conn; // Set connection to 'talk' with
            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.CommandText = "InsertOrderDetails"; // SP name, not query here

            // Create and Populate parameters
            SqlParameter orderID = new SqlParameter("@OrderID", System.Data.SqlDbType.Int);
            orderID.Value = OrderID; // set the VALUE
            orderID.Direction = System.Data.ParameterDirection.Input;
            command.Parameters.Add(orderID); // ADD IT !!!!

            SqlParameter productID = new SqlParameter("@ProductID", System.Data.SqlDbType.Int);
            productID.Value = ProductID; // set the VALUE
            productID.Direction = System.Data.ParameterDirection.Input;
            command.Parameters.Add(productID); // ADD IT !!!!

            SqlParameter quantity = new SqlParameter("@Quantity", System.Data.SqlDbType.SmallInt);
            quantity.Value = Quantity;
            quantity.Direction = System.Data.ParameterDirection.Input;
            command.Parameters.Add(quantity);

            int output;
            try
            {
                output = command.ExecuteNonQuery();
            }
            catch{
                return 0;
            }
            
            conn.Close();

            //Return the value of the output
            return output;
        }
    }
}