using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class order_result : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {

  }



  protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
  {
    if (e.Row.RowType == DataControlRowType.DataRow)
    {
      if (DataBinder.Eval(e.Row.DataItem, "fb_id").ToString() == Session["fb_id"].ToString() || Session["user_group"].ToString() == "1")
      {

      }
      else
      {
        e.Row.Cells[6].Text = "";
        e.Row.Cells[7].Text = "";
      }

      if ((e.Row.RowState & DataControlRowState.Edit) > 0)
      {
        SqlDataSource5.SelectParameters["id"].DefaultValue = ((DropDownList)e.Row.FindControl("DropDownList1")).SelectedValue;
        SqlDataSource5.Select(DataSourceSelectArguments.Empty);
        DropDownList DdlCountry = (DropDownList)e.Row.FindControl("DropDownList2");
        // bind DropDown manually
        DdlCountry.DataBind();
        DdlCountry.SelectedValue = DataBinder.Eval(e.Row.DataItem, "id1").ToString();

        SqlDataSource6.SelectParameters["id"].DefaultValue = ((DropDownList)e.Row.FindControl("DropDownList1")).SelectedValue;
        SqlDataSource6.Select(DataSourceSelectArguments.Empty);
        DropDownList DdlCountry2 = (DropDownList)e.Row.FindControl("DropDownList3");
        // bind DropDown manually
        DdlCountry2.DataBind();
        DdlCountry2.SelectedValue = DataBinder.Eval(e.Row.DataItem, "id2").ToString();

        SqlDataSource7.SelectParameters["id"].DefaultValue = ((DropDownList)e.Row.FindControl("DropDownList1")).SelectedValue;
        SqlDataSource7.Select(DataSourceSelectArguments.Empty);
        DropDownList DdlCountry3 = (DropDownList)e.Row.FindControl("DropDownList4");
        // bind DropDown manually
        DdlCountry3.DataBind();
        DdlCountry3.SelectedValue = DataBinder.Eval(e.Row.DataItem, "id3").ToString();

      }



    }
  }

  protected void GridView4_RowDataBound(object sender, GridViewRowEventArgs e)
  {
    
    if (e.Row.RowType == DataControlRowType.DataRow)
    {
      if (int.Parse(DataBinder.Eval(e.Row.DataItem, "valid").ToString()) >= 1 && Session["user_group"].ToString() != "1")
      {/*
        e.Row.Cells[6].Visible = false;
        e.Row.Cells[7].Visible = false;
        */
        GridView2.Columns[6].Visible = false;
        GridView2.Columns[7].Visible = false;
        
        
      }





    }
  }

  protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
  {

  }

  protected void DropDownList2_DataBinding(object sender, EventArgs e)
  {


  }

  protected void GridView2_RowEditing(object sender, GridViewEditEventArgs e)
  {

  }

  protected void GridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
  {
    SqlDataSource2.UpdateParameters["requirement1"].DefaultValue = ((DropDownList)GridView2.Rows[e.RowIndex].FindControl("DropDownList2")).SelectedValue;
    SqlDataSource2.UpdateParameters["requirement2"].DefaultValue = ((DropDownList)GridView2.Rows[e.RowIndex].FindControl("DropDownList3")).SelectedValue;
    SqlDataSource2.UpdateParameters["requirement3"].DefaultValue = ((DropDownList)GridView2.Rows[e.RowIndex].FindControl("DropDownList4")).SelectedValue;

  }
}