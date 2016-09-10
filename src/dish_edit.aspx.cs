using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dish_edit : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {

  }

  protected void GridView1_DataBound(object sender, EventArgs e)
  {


  }

  protected void GridView1_Load(object sender, EventArgs e)
  {
    if (GridView1.Rows.Count == 0)
    {
      DataTable dt = new DataTable();
      dt.Columns.Add("id");
      dt.Columns.Add("name");
      dt.Columns.Add("cost");
      dt.Columns.Add("requirement1");
      dt.Columns.Add("requirement2");
      dt.Columns.Add("requirement3");

      DataRow dr = dt.NewRow();
      dt.Rows.Add(dr);
      GridView1.DataSourceID = null;
      GridView1.DataSource = dt;
      GridView1.DataBind();
      GridView1.Rows[0].Cells[0].Text = "";
    }

  }

  protected void Button1_Click(object sender, EventArgs e)
  {
    SqlDataSource1.InsertParameters["name"].DefaultValue = (GridView1.FooterRow.FindControl("name") as TextBox).Text;
    SqlDataSource1.InsertParameters["cost"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("cost")).Text;
    SqlDataSource1.InsertParameters["rest"].DefaultValue = Request.QueryString["rest_id"];
    SqlDataSource1.InsertParameters["requirement1"].DefaultValue = ((DropDownList)GridView1.FooterRow.FindControl("requirement1")).SelectedValue;
    SqlDataSource1.InsertParameters["requirement2"].DefaultValue = ((DropDownList)GridView1.FooterRow.FindControl("requirement2")).SelectedValue;
    SqlDataSource1.InsertParameters["requirement3"].DefaultValue = ((DropDownList)GridView1.FooterRow.FindControl("requirement3")).SelectedValue;
    SqlDataSource1.Insert();
    GridView1.DataBind();
    ((DropDownList)GridView1.FooterRow.FindControl("requirement1")).SelectedValue =  SqlDataSource1.InsertParameters["requirement1"].DefaultValue;
    ((DropDownList)GridView1.FooterRow.FindControl("requirement2")).SelectedValue =  SqlDataSource1.InsertParameters["requirement2"].DefaultValue;
    ((DropDownList)GridView1.FooterRow.FindControl("requirement3")).SelectedValue =  SqlDataSource1.InsertParameters["requirement3"].DefaultValue;
  }
}