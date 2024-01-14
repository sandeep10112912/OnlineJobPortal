using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobPortalWeb
{
    public partial class CandidateStatus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                drpPosition.DataSource = DataContext.DataContext.GetPostionDetails();
                drpPosition.DataTextField = "Name";
                drpPosition.DataValueField = "Id";
                drpPosition.DataBind();

                drpCandidate.DataSource = DataContext.DataContext.GetCandidateDetails();
                drpCandidate.DataTextField = "FullName";
                drpCandidate.DataValueField = "Id";
                drpCandidate.DataBind();
                drpStatus.Items.Add("Shortlisted");
                drpStatus.Items.Add("Profile Not Sutailble");
                drpStatus.Items.Add("L1 Selected");
                drpStatus.Items.Add("L1 Rejected");

                drpStatus.Items.Add("L2 Selected");
                drpStatus.Items.Add("L2 Rejected");

                drpStatus.Items.Add("L3 Selected");
                drpStatus.Items.Add("L3 Rejected");


                drpStatus.Items.Add("Client Selected");
                drpStatus.Items.Add("Client Rejected");

                drpStatus.Items.Add("HR Selected");
                drpStatus.Items.Add("HR Rejected");

                drpStatus.Items.Add("Offer Accepted");
                drpStatus.Items.Add("Offer Rejected");
            }
        }

        protected void StatusCandidate_Click(object sender, EventArgs e)
        {
            if (drpCandidate.SelectedItem != null && drpPosition.SelectedItem != null)
            {
                var res = DataContext.DataContext.SetCandidatePostionDetails(int.Parse(drpCandidate.SelectedValue), int.Parse(drpPosition.SelectedValue), drpStatus.Text);
                if (res)
                {
                    messageText.Text = "  Canditate Status Saved succesully";
                    messageText.ForeColor = Color.Green;
                }
                else
                {
                    messageText.Text = " error While saving  Canditate Status";
                    messageText.ForeColor = Color.Red;
                }

            }
        }
    }
}