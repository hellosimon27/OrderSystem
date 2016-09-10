using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
  protected void Page_Load(object sender, EventArgs e)
  {
    
    var fb_id = (string)(Session["fb_id"]);
    var fb_name = (string)(Session["fb_name"]);
    var page = System.IO.Path.GetFileName(Request.PhysicalPath);

    if (fb_id == null || fb_name == null) 
    {
      if (page != "login.aspx")
        Response.Redirect("login.aspx");
    }
    else 
    {
      SqlDataSource1.SelectParameters["fb_id"].DefaultValue = fb_id;
      DataView result = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
      l_fb_name.Text = result[0]["fb_name"].ToString();
      l_money.Text = result[0]["money"].ToString();
      if (result[0]["user_group"].ToString() != "1")
      {
        add_money.Visible = false;
        //system.Visible = false;
      }
    }
    
  }
}
