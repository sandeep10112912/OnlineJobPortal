using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobPortalWeb
{
    public partial class Position : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                interviewSteps.DataSource = DataContext.DataContext.GetInterviewSteps();
                interviewSteps.DataBind();

                for (int i = 0; i < interviewSteps.Items.Count; i++)
                {
                    if (interviewSteps.Items[i].Text.Contains("L1"))// getting selected value from CheckBox List  
                    {
                        interviewSteps.Items[i].Selected = true;
                        break;
                    }
                }

                RefreshGrid();
            }

        }

        public void RefreshGrid()
        {
            PostionGridView.DataSource = DataContext.DataContext.GetPostionDetails();
            PostionGridView.DataBind();
        }

        protected void AddPostion_Click(object sender, EventArgs e)
        {

            var str = "";
            for (int i = 0; i < interviewSteps.Items.Count; i++)
            {
                if (interviewSteps.Items[i].Selected == true)// getting selected value from CheckBox List  
                {
                    if (str.Length > 0)
                    {
                        str += "," + interviewSteps.Items[i].Text;// add selected Item text to the String .  
                    }
                    else
                    {
                        str = interviewSteps.Items[i].Text;
                    }
                }
            }
            if (str.Length <= 0)
            {
                messageText.Text = "Please selec Steps";
                messageText.ForeColor = Color.Red;
                return;
            }
            var result = false;
            if (ValidateData(txtPostionName.Text, txtPostionDesciption.Text, str))
            {
                result = DataContext.DataContext.AddNewPostion(txtPostionName.Text, txtPostionDesciption.Text, str);
                messageText.Text = "Recored Inserted Succesfully";
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
                messageText.Text = "Error while Instreing";
                messageText.ForeColor = Color.Red;
            }

    }

      

        protected void PostionGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            PostionGridView.EditIndex = -1;
            RefreshGrid();
        }

        protected void PostionGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            PostionGridView.EditIndex = e.NewEditIndex;
            RefreshGrid();
        }


        
        protected void PostionGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label id = PostionGridView.Rows[e.RowIndex].FindControl("lbl_Id") as Label;
            var result = DataContext.DataContext.DeletePosition(int.Parse(id.Text));
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
        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            PostionGridView.EditIndex = -1;
            txtPostionName.Text = "";
            txtPostionDesciption.Text = "";
            foreach (var item in interviewSteps.Items)
            {
                var ct = item as ListItem;
                ct.Selected = false;
            }
            interviewSteps.DataSource = DataContext.DataContext.GetInterviewSteps();
            interviewSteps.DataBind();
            RefreshGrid();
            AddPostion.Text = "Save Position";
        }

        public bool ValidateData(string name, string txt_Descriptions, string txt_InterviewStep)
        {
            if (!string.IsNullOrEmpty(name.Trim()) && !string.IsNullOrEmpty(txt_Descriptions.Trim())
                  && !string.IsNullOrEmpty(txt_InterviewStep.Trim()) )
            {
                return true;
            }
            else
                return false;

        }

        protected void PostionGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label id = PostionGridView.Rows[e.RowIndex].FindControl("lbl_Id") as Label;
            TextBox txt_Name = PostionGridView.Rows[e.RowIndex].FindControl("txt_Name") as TextBox;
            TextBox txt_Descriptions = PostionGridView.Rows[e.RowIndex].FindControl("txt_Descriptions") as TextBox;
            TextBox txt_InterviewStep = PostionGridView.Rows[e.RowIndex].FindControl("txt_InterviewStepIds") as TextBox;
            CheckBox txt_IsActive = PostionGridView.Rows[e.RowIndex].FindControl("txt_IsActive") as CheckBox;
            
            if (ValidateData(txt_Name.Text, txt_Descriptions.Text, txt_InterviewStep.Text))
            {
                var result = DataContext.DataContext.UpdatePostion(int.Parse(id.Text), txt_Name.Text, txt_Descriptions.Text,txt_IsActive.Checked, txt_InterviewStep.Text);
                if (result)
                    messageText.Text = "Recored Updated Succesfully";
                else
                    messageText.Text = "Error While Updating";
            }
            else
            {
                messageText.Text = "Please fill Proper Details";

            }
            PostionGridView.EditIndex = -1;
            RefreshGrid();
        }
    }
}