using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {
    if (Request.Form["fb_id"] == null)
      Response.Redirect("login.aspx");
    else
    {
      Session["fb_id"] = Request.Form["fb_id"];
      Session["fb_name"] = Request.Form["fb_name"];

      SqlDataSource2.SelectParameters["fb_id"].DefaultValue = Request.Form["fb_id"];
      DataView result = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);

      if (result != null && result.Count != 1)
      {
        SqlDataSource2.InsertParameters["fb_id"].DefaultValue = Request.Form["fb_id"];
        SqlDataSource2.InsertParameters["fb_name"].DefaultValue = Request.Form["fb_name"];
        SqlDataSource2.Insert();
        Session["user_group"] = "0";
      }
      else
      {
        Session["user_group"] = result[0]["user_group"].ToString();
      }

      Response.Redirect("start_order.aspx");
      
   

  }
  
  /* Session["fb_id"] = "1104187996259275";
    Session["fb_name"] = "SIMON";
    Session["user_group"] = "1";
    */
  }
}