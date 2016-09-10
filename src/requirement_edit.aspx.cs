using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class requirement_edit : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {

  }

  protected void Button1_Click(object sender, EventArgs e)
  {
    SqlDataSource1.InsertParameters["option_group"].DefaultValue = group.Text;
    SqlDataSource1.InsertParameters["option_item"].DefaultValue = requirement.Text;
    SqlDataSource1.InsertParameters["cost_modify"].DefaultValue = cost_modify.Text;
    SqlDataSource1.Insert();
    GridView1.DataBind();

  }
}