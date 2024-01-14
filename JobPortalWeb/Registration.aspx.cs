using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobPortalWeb
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                drpPosition.DataSource = DataContext.DataContext.GetPostionDetails();
                drpPosition.DataTextField = "Name";
                drpPosition.DataValueField = "Id";
                drpPosition.DataBind();
                RefreshGrid();
            }
        }

        public void RefreshGrid()
        {
            CandidateGridView.DataSource = DataContext.DataContext.GetCandidateDetails();
            CandidateGridView.DataBind();
        }

        protected void CandidateGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            CandidateGridView.EditIndex = e.NewEditIndex;
            RefreshGrid();

        }

        protected void CandidateGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label id = CandidateGridView.Rows[e.RowIndex].FindControl("lbl_ID") as Label;
            var result = DataContext.DataContext.DeleteCandidate(int.Parse(id.Text));
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

            txtcandidateID.Text = "";
            txtFullName.Text = "";
            txtContactNo.Text = "";
            txtEmailId.Text = "";
            txtPrimarySkill.Text = "";
            txtExpericace.Text = "";
            chkIsInternal.Checked = false;
            drpPosition.DataSource = DataContext.DataContext.GetPostionDetails();
            drpPosition.DataTextField = "Name";
            drpPosition.DataValueField = "Id";
            drpPosition.DataBind();
            RefreshGrid();
        }

        public bool uploadFile()
        {
            if ((Uploadfile.PostedFile != null) && (Uploadfile.PostedFile.ContentLength > 0))
            {
                string fn = System.IO.Path.GetFileName(Uploadfile.PostedFile.FileName);
                string SaveLocation = Server.MapPath("Uploads") + "\\" + fn;
                try
                {
                    Uploadfile.PostedFile.SaveAs(SaveLocation);
                    messageText.Text = "The file has been uploaded.";
                    return true;
                }
                catch (Exception ex)
                {
                    messageText.Text = "Error: " + ex.Message;
                    return false;
                }
            }
            else
            {
                messageText.Text = "Please select a file to upload.";
                return false;
            }
        }
        protected void AddCandidate_Click(object sender, EventArgs e)
        {

            var res = uploadFile();
            if (!res) { return; }
            var result = false;
            if (ValidateData(txtFullName.Text, txtContactNo.Text, txtEmailId.Text, txtPrimarySkill.Text, txtExpericace.Text))
            {
                result = DataContext.DataContext.AddCadidate(txtFullName.Text, txtContactNo.Text, txtEmailId.Text, chkIsInternal.Checked, Uploadfile.FileName, txtPrimarySkill.Text, int.Parse(drpPosition.SelectedValue), int.Parse(txtExpericace.Text));
                if (result)
                {
                    messageText.ForeColor = Color.Green;
                    messageText.Text = "Recored Inserted Succesfully";
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
                messageText.Text = "Provided Details are not valid";
                messageText.ForeColor = Color.Red;
            }
        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            txtcandidateID.Text = "";
            txtFullName.Text = "";
            txtContactNo.Text = "";
            txtEmailId.Text = "";
            txtPrimarySkill.Text = "";
            txtExpericace.Text = "";
            chkIsInternal.Checked = false;
            drpPosition.DataSource = DataContext.DataContext.GetPostionDetails();
            drpPosition.DataTextField = "Name";
            drpPosition.DataValueField = "Id";
            drpPosition.DataBind();
            RefreshGrid();
        }

        protected void CandidateGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Download")
            {
                Response.ContentType = "application/pdf";
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + e.CommandArgument + "");
                string filePath = System.IO.Path.GetFileName(e.CommandArgument.ToString());
                string SaveLocation = Server.MapPath("Uploads") + "\\" + filePath;
                // Write the file to the Response
                const int bufferLength = 10000;
                byte[] buffer = new Byte[bufferLength];
                int length = 0;
                Stream download = null;

                try
                {
                    download = new FileStream(SaveLocation,
                                            FileMode.Open,
                                            FileAccess.Read);

                    do
                    {
                        if (Response.IsClientConnected)
                        {
                            length = download.Read(buffer, 0, bufferLength);
                            Response.OutputStream.Write(buffer, 0, length);
                            buffer = new Byte[bufferLength];
                        }
                        else
                        {
                            length = -1;
                        }
                    }
                    while (length > 0);

                    Response.Flush();
                    Response.End();
                }
                finally
                {
                    if (download != null)
                        download.Close();
                }
            }

        }

        protected void CandidateGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {

            
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DropDownList DropDownList1 = (e.Row.FindControl("DropDownListAssginedPostion") as DropDownList);
                    if (DropDownList1 != null)
                    {
                        DropDownList1.DataSource = DataContext.DataContext.GetPostionDetails(); ;
                        DropDownList1.DataTextField = "Name";
                        DropDownList1.DataValueField = "Id";
                        DropDownList1.DataBind();
                        var possition=e.Row.FindControl("lbl_AssginedPostions") as Label;
                        DropDownList1.SelectedValue = possition.Text;
                    }
            }
            }
            catch (Exception)
            {

                throw;
            }
        }

        public bool ValidateData(string name,string contactno,string email,string primaryskill,string experiance)
        {
            if (!string.IsNullOrEmpty(name.Trim()) && !string.IsNullOrEmpty(contactno.Trim())
                  && !string.IsNullOrEmpty(email.Trim())
                  && !string.IsNullOrEmpty(primaryskill.Trim())
                  && !string.IsNullOrEmpty(contactno.Trim()))
            {
                return true;
            }
            else
                return false;
        
        }
        protected void CandidateGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            Label id = CandidateGridView.Rows[e.RowIndex].FindControl("lbl_ID") as Label;
            TextBox txt_FullName = CandidateGridView.Rows[e.RowIndex].FindControl("txt_FullName") as TextBox;
            TextBox txt_ContactNo = CandidateGridView.Rows[e.RowIndex].FindControl("txt_ContactNo") as TextBox;
            TextBox txt_EmailId = CandidateGridView.Rows[e.RowIndex].FindControl("txt_EmailId") as TextBox;
            CheckBox txt_IsInternal = CandidateGridView.Rows[e.RowIndex].FindControl("txt_IsInternal") as CheckBox;
            TextBox txt_PrimarySkill = CandidateGridView.Rows[e.RowIndex].FindControl("txt_PrimarySkill") as TextBox;
            DropDownList txt_AssginedPostion = CandidateGridView.Rows[e.RowIndex].FindControl("DropDownListAssginedPostion") as DropDownList;
            TextBox txt_YearsOfExperice = CandidateGridView.Rows[e.RowIndex].FindControl("txt_YearsOfExperice") as TextBox;
            LinkButton resume = CandidateGridView.Rows[e.RowIndex].FindControl("lbl_Resume") as LinkButton;
            if (ValidateData(txt_FullName.Text, txt_ContactNo.Text, txt_EmailId.Text, txt_PrimarySkill.Text, txt_YearsOfExperice.Text))
            {
                var result = DataContext.DataContext.UpdateCandidate(int.Parse(id.Text), txt_FullName.Text, txt_ContactNo.Text, txt_EmailId.Text, txt_IsInternal.Checked, resume.Text, txt_PrimarySkill.Text, int.Parse(txt_AssginedPostion.SelectedValue), int.Parse(txt_YearsOfExperice.Text));
                if (result)
                    messageText.Text = "Recored Updated Succesfully";
                else
                    messageText.Text = "Error While Updating";
            }
            else
            {
                messageText.Text = "Please fill Proper Details";

            }
            CandidateGridView.EditIndex = -1;
            RefreshGrid();

        }

        protected void CandidateGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            CandidateGridView.EditIndex = -1;
            RefreshGrid();
        }
    }
}