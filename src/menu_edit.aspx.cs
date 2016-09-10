using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class menu_edit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlDataSource1.InsertParameters["name"].DefaultValue = (GridView1.FooterRow.FindControl("rest_name") as TextBox).Text;
        SqlDataSource1.InsertParameters["tel"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("tel")).Text;
        SqlDataSource1.InsertParameters["note"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("note")).Text;
        SqlDataSource1.Insert();
        GridView1.DataBind();
    }

    protected void Unnamed1_Click(object sender, EventArgs e)
    {

    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        var c = e.CommandArgument.ToString();
        if (e.CommandName == "start_order")
        {
           
            SqlDataSource2.InsertParameters["rest_id"].DefaultValue = c;
            SqlDataSource2.InsertParameters["chairman"].DefaultValue = Session["fb_id"].ToString();
            SqlDataSource2.InsertParameters["max_cost"].DefaultValue = "0";
            SqlDataSource2.InsertParameters["max_order"].DefaultValue = "0";
            SqlDataSource2.Insert();
            Response.Redirect("start_order.aspx");

        }
        else if (e.CommandName == "start_shout")
        {
            GridViewRow row = (GridViewRow)(((Button)e.CommandSource).NamingContainer);       
            String max_cost = ((TextBox)row.FindControl("max_cost")).Text;
            String max_order = ((TextBox)row.FindControl("max_order")).Text;
            SqlDataSource2.InsertParameters["rest_id"].DefaultValue = c;
            SqlDataSource2.InsertParameters["chairman"].DefaultValue = Session["fb_id"].ToString();
            SqlDataSource2.InsertParameters["max_cost"].DefaultValue = max_cost;
            SqlDataSource2.InsertParameters["max_order"].DefaultValue = max_order;
            SqlDataSource2.Insert();
            Response.Redirect("start_order.aspx");
        }
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
   
            Button btnAdd = e.Row.FindControl("shout_buttom") as Button;
            btnAdd.Attributes.Add("OnClick", "return check_money("+e.Row.RowIndex.ToString() +");");
        }
    }
}