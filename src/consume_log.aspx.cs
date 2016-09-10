using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class consume_log : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {
    DataView dvSql = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
    foreach (DataRowView drvSql in dvSql)
    {
      Label1.Text = drvSql["cost"].ToString();
    }

  }
}