using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobPortalWeb
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            if ( txtUserName.Text != null && txtPassword.Text != null)
            {
                var res = DataContext.DataContext.GetLoginDetails(txtUserName.Text, txtPassword.Text);
                if (res != "User")
                {
                    Response.Redirect("Default.aspx");
                }
                else if (res != null && res == "User")
                {
                    Response.Redirect("Registration.aspx");
                }
                else
                {
                    messageText.Text = "No UserName Found";
                    messageText.ForeColor = Color.Red;
                }

            }
        }

        protected void Register_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserRegister.aspx");
        }
    }
}