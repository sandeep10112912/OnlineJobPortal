using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Net.NetworkInformation;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JobPortalWeb
{
    public partial class UserRegister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            }
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            if (UserType.SelectedItem != null && txtUserName.Text != null && txtPassword.Text != null)
            {
                var res = DataContext.DataContext.SaveUserDetails(txtUserName.Text, txtPassword.Text, UserType.SelectedItem.Text);
                if (res)
                {
                    messageText.Text = "  User Saved succesully";
                    messageText.ForeColor = Color.Green;
                }
                else
                {
                    messageText.Text = " error While saving";
                    messageText.ForeColor = Color.Red;
                }

            }
        }
    }
}