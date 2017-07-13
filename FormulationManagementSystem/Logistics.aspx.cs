using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Services;
using System.Configuration;
using System.Data.SqlClient;

namespace FormulationManagementSystem
{
    public partial class Logistics : System.Web.UI.Page
    {
        private static int PageSize = 5;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                BindDummyRow();
            }

            }




        private void BindDummyRow()
        {
            DataTable dummy = new DataTable();
            dummy.Columns.Add("ID");
            dummy.Columns.Add("EmployeeIdent");
            dummy.Columns.Add("FirstName");
            dummy.Columns.Add("LastName");
            dummy.Rows.Add();
            EmployeeGrid.DataSource = dummy;
            EmployeeGrid.DataBind();

        }
        public static string GetEmployee(string searchTerm, int pageIndex)

        {

            string query = "[GetEmployee_Pager]";

            SqlCommand cmd = new SqlCommand(query);

            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@SearchTerm", searchTerm);

            cmd.Parameters.AddWithValue("@PageIndex", pageIndex);

            cmd.Parameters.AddWithValue("@PageSize", PageSize);

            cmd.Parameters.Add("@RecordCount", SqlDbType.Int, 4).Direction = ParameterDirection.Output;

            return GetData(cmd, pageIndex).GetXml();

        }



        private static DataSet GetData(SqlCommand cmd, int pageIndex)

        {

            string strConnString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(strConnString))

            {

                using (SqlDataAdapter sda = new SqlDataAdapter())

                {

                    cmd.Connection = con;

                    sda.SelectCommand = cmd;

                    using (DataSet ds = new DataSet())

                    {

                        sda.Fill(ds, "Customers");

                        DataTable dt = new DataTable("Pager");

                        dt.Columns.Add("PageIndex");

                        dt.Columns.Add("PageSize");

                        dt.Columns.Add("RecordCount");

                        dt.Rows.Add();

                        dt.Rows[0]["PageIndex"] = pageIndex;

                        dt.Rows[0]["PageSize"] = PageSize;

                        dt.Rows[0]["RecordCount"] = cmd.Parameters["@RecordCount"].Value;

                        ds.Tables.Add(dt);

                        return ds;

                    }

                }

            }


        }
    }
}