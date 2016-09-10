using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class order_det : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {    

    if (IsPostBack)
    {
      var fb_id = Session["fb_id"].ToString();
      string query = "";
      foreach (GridViewRow row in GridView1.Rows)
      {
        if (row.RowType == DataControlRowType.DataRow)
        {
          int amount = 0;
          if (int.TryParse(((TextBox)row.FindControl("amount")).Text, out amount) && amount > 0)
          {
            var id = ((HiddenField)row.FindControl("item_id")).Value;
            var requirement1 = ((DropDownList)row.FindControl("requirement1")).SelectedValue;
            var requirement2 = ((DropDownList)row.FindControl("requirement2")).SelectedValue;
            var requirement3 = ((DropDownList)row.FindControl("requirement3")).SelectedValue;
            var note = ((TextBox)row.FindControl("note")).Text;



            query += "EXECUTE [OrderSystem].[dbo].[sp_add_order] ";
            query += (fb_id + ',');
            query += (Request.QueryString["order_id"].ToString()) + ',';
            query += (id + ',');
            query += (amount.ToString() + ',');
            query += ("\'" + requirement1 + "\'" + ',');
            query += ("\'" + requirement2 + "\'" + ',');
            query += ("\'" + requirement3 + "\'" + ',');
            query += "\'" + note + "\'\n";

          }
        }
      }
      ConnectionStringSettings mySetting = ConfigurationManager.ConnectionStrings["OrderSystemConnectionString"];
      if (mySetting == null || string.IsNullOrEmpty(mySetting.ConnectionString))
        throw new Exception("Fatal error: missing connecting string in web.config file");
      var conString = mySetting.ConnectionString;
      SqlDataSource sql = new SqlDataSource(conString, query);
      sql.Select(DataSourceSelectArguments.Empty);
      Response.Redirect("order_result.aspx?order_id=" + Request.QueryString["order_id"].ToString());
    }
  }

  protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
  {

    if (e.Row.RowType == DataControlRowType.DataRow)
    {
      ConnectionStringSettings mySetting = ConfigurationManager.ConnectionStrings["OrderSystemConnectionString"];
      if (mySetting == null || string.IsNullOrEmpty(mySetting.ConnectionString))
        throw new Exception("Fatal error: missing connecting string in web.config file");
      var conString = mySetting.ConnectionString;


      if (e.Row.Cells[2].Text != "無")
      {
        string query = "SELECT [id],case when cost_modify >=0 then '+' when cost_modify<0 then '' end +  cast(cost_modify as VARCHAR) + '$ ' + [option_item]  option_item FROM[OrderSystem].[dbo].[requirement] where[option_group] = \'" + e.Row.Cells[2].Text + "\'";
        SqlDataSource sql1 = new SqlDataSource(conString, query);
        ((DropDownList)e.Row.FindControl("requirement1")).DataSource = sql1;
        ((DropDownList)e.Row.FindControl("requirement1")).DataTextField = "option_item";
        ((DropDownList)e.Row.FindControl("requirement1")).DataValueField = "id";
        ((DropDownList)e.Row.FindControl("requirement1")).DataBind();
      }
      else
      {
        ((DropDownList)e.Row.FindControl("requirement1")).Visible = false;
      }

      if (e.Row.Cells[4].Text != "無")
      {
        string query2 = "SELECT [id],case when cost_modify >=0 then '+' when cost_modify<0 then '' end +  cast(cost_modify as VARCHAR) + '$ ' + [option_item]  option_item  FROM[OrderSystem].[dbo].[requirement] where[option_group] = \'" + e.Row.Cells[4].Text + "\'";
        SqlDataSource sql2 = new SqlDataSource(conString, query2);
        ((DropDownList)e.Row.FindControl("requirement2")).DataSource = sql2;
        ((DropDownList)e.Row.FindControl("requirement2")).DataTextField = "option_item";
        ((DropDownList)e.Row.FindControl("requirement2")).DataValueField = "id";
        ((DropDownList)e.Row.FindControl("requirement2")).DataBind();

      }
      else
      {
        ((DropDownList)e.Row.FindControl("requirement2")).Visible = false;
      }

      if (e.Row.Cells[6].Text != "無")
      {
        string query3 = "SELECT [id],case when cost_modify >=0 then '+' when cost_modify<0 then '' end +  cast(cost_modify as VARCHAR) + '$ ' + [option_item]  option_item  FROM[OrderSystem].[dbo].[requirement] where[option_group] = \'" + e.Row.Cells[6].Text + "\'";
        SqlDataSource sql3 = new SqlDataSource(conString, query3);
        ((DropDownList)e.Row.FindControl("requirement3")).DataSource = sql3;
        ((DropDownList)e.Row.FindControl("requirement3")).DataTextField = "option_item";
        ((DropDownList)e.Row.FindControl("requirement3")).DataValueField = "id";
        ((DropDownList)e.Row.FindControl("requirement3")).DataBind();
      }
      else
      {
        ((DropDownList)e.Row.FindControl("requirement3")).Visible = false;
      }

      if (e.Row.Cells[10].Text != "0")
      {
        e.Row.Cells[10].Text = "<span style='color:red'>" + e.Row.Cells[10].Text + "</span>";
      }



    }
  }

  protected void Button1_Click(object sender, EventArgs e)
  {

  }
}