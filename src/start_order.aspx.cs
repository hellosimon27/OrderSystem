using System;
using System.Configuration;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class start_order : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
	}

	protected void GridView1_DataBound(object sender, EventArgs e)
	{
		//if (Session["user_group"].ToString() != "1")
		//	GridView1.Columns[0].Visible = false;
	}

	protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		if (e.Row.RowType == DataControlRowType.DataRow)
		{
			if (int.Parse(e.Row.Cells[5].Text) > 0)
			{
				e.Row.Style.Add(HtmlTextWriterStyle.BackgroundColor, "yellow");
			}

			if (DataBinder.Eval(e.Row.DataItem, "fb_id").ToString() != Session["fb_id"].ToString() && Session["user_group"].ToString() != "1")
			{
				e.Row.Cells[0].Text = "--";
			}

			if (DataBinder.Eval(e.Row.DataItem, "valid").ToString() == "0" )
			{
				string decodedText = HttpUtility.HtmlDecode("<a href =\"order_det.aspx?order_id=" + e.Row.Cells[1].Text + "\">>> 點餐 <<</a>");
				e.Row.Cells[9].Text = decodedText;
			}
			else
				e.Row.Cells[9].Text = e.Row.Cells[6].Text + "已收單";
		}
	}

	protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
	{
		if (e.CommandName == "close")
		{
			ConnectionStringSettings mySetting = ConfigurationManager.ConnectionStrings["OrderSystemConnectionString"];
			if (mySetting == null || string.IsNullOrEmpty(mySetting.ConnectionString))
				throw new Exception("Fatal error: missing connecting string in web.config file");
			var conString = mySetting.ConnectionString;

			string query = "update [OrderSystem].[dbo].[order_list] set valid = 1 where id = " + e.CommandArgument;

			SqlDataSource sql = new SqlDataSource();
			sql.ConnectionString = conString;
			sql.UpdateCommand = query;
			sql.Update();
		}
		else if (e.CommandName == "open")
		{
			ConnectionStringSettings mySetting = ConfigurationManager.ConnectionStrings["OrderSystemConnectionString"];
			if (mySetting == null || string.IsNullOrEmpty(mySetting.ConnectionString))
				throw new Exception("Fatal error: missing connecting string in web.config file");
			var conString = mySetting.ConnectionString;

			string query = "update [OrderSystem].[dbo].[order_list] set valid = 0 where id = " + e.CommandArgument;

			SqlDataSource sql = new SqlDataSource();
			sql.ConnectionString = conString;
			sql.UpdateCommand = query;
			sql.Update();
		}
		else if (e.CommandName == "fold")
		{
			ConnectionStringSettings mySetting = ConfigurationManager.ConnectionStrings["OrderSystemConnectionString"];
			if (mySetting == null || string.IsNullOrEmpty(mySetting.ConnectionString))
				throw new Exception("Fatal error: missing connecting string in web.config file");
			var conString = mySetting.ConnectionString;

			string query = "update [OrderSystem].[dbo].[order_list] set valid = 2 where id = " + e.CommandArgument;

			SqlDataSource sql = new SqlDataSource();
			sql.ConnectionString = conString;
			sql.UpdateCommand = query;
			sql.Update();
		}
		GridView1.DataBind();
	}
}