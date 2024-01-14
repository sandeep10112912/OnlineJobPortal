using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobPortalWeb
{
    public partial class PositionStatus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                RefreshGrid();
            }
        }
        public void RefreshGrid()
        {
            PostionGridView.DataSource = DataContext.DataContext.GetCandidateStatusDetails();
            PostionGridView.DataBind();
        }
    }
}