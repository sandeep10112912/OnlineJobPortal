using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobPortalWeb
{
    public partial class InterviewPage : System.Web.UI.Page
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
            InterviewStepsGridView.DataSource = DataContext.DataContext.GetInterviewSteps();
            InterviewStepsGridView.DataBind();
        }
        protected void AddInterviewSteps_Click(object sender, EventArgs e)
        {
            if (ValidateData(txtinterviewStep.Text))
            {
                var result = DataContext.DataContext.AddInterviewSteps(txtinterviewStep.Text);
                if (result)
                {
                    messageText.Text = "Recored Inserted Succesfully";
                    messageText.ForeColor = Color.Green;
                    RefreshGrid();
                }
                else
                {
                    messageText.Text = "Recored Already Exist";
                    messageText.ForeColor = Color.Red;
                }
            }
            else
            {
                messageText.Text = "Interview Steps are Required";
                messageText.ForeColor = Color.Red;
            }

        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            txtinterviewStep.Text = "";
            InterviewStepsGridView.EditIndex = -1;
            txtid.Text = "";
        }

        protected void InterviewStepsGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            InterviewStepsGridView.EditIndex = e.NewEditIndex;
            RefreshGrid();
        }

        protected void InterviewStepsGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label id = InterviewStepsGridView.Rows[e.RowIndex].FindControl("lbl_Id") as Label;
            var result = DataContext.DataContext.DeleteSteps(int.Parse(id.Text));
            if (result)
            {
                messageText.Text = "Recored Deleted ";
                messageText.ForeColor = Color.Green;
            }
            else
            {
                messageText.Text = "Error while Deleting";
                messageText.ForeColor = Color.Red;
            }
            RefreshGrid();
            txtinterviewStep.Text = "";
        }

        protected void InterviewStepsGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

            InterviewStepsGridView.EditIndex = -1;
            RefreshGrid();
        }
        public bool ValidateData(string name)
        {
            if (!string.IsNullOrEmpty(name.Trim()))
            {
                return true;
            }
            else
                return false;

        }

        protected void InterviewStepsGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label id = InterviewStepsGridView.Rows[e.RowIndex].FindControl("lbl_Id") as Label;
            TextBox txt_Name = InterviewStepsGridView.Rows[e.RowIndex].FindControl("txt_Name") as TextBox;
            
            if (ValidateData(txt_Name.Text))
            {
                var result = DataContext.DataContext.updateInterviewSteps(txt_Name.Text, int.Parse(id.Text));
                if (result)
                {
                    messageText.Text = "Recored Updated Succesfully";
                    messageText.ForeColor = Color.Green;
                    RefreshGrid();
                }
                else
                {
                    messageText.Text = "Recored Already Exist";
                    messageText.ForeColor = Color.Red;
                }
            }
            else
            {
                messageText.Text = "Please fill Proper Details";

            }
            InterviewStepsGridView.EditIndex = -1;
            RefreshGrid();
        }
    }
}