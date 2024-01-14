<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InterviewPage.aspx.cs" Inherits="JobPortalWeb.InterviewPage" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.css" rel="stylesheet" />
    <div class="container">
         <asp:TextBox class="form-control" ID="txtid" placeholder="Enter Step"  Visible="false" runat="server"></asp:TextBox>
        <div style="border: 2px solid black; padding: 30px">
            <div class="form-row">
                <div class="form-group col-12 col-sm-4 col-md-3 col-lg-3">
                    <label for="Steps Name" class="label">Interview Step Name:</label>
                </div>
                <div class="form-group col-12 col-sm-8 col-md-9 col-lg-9">
                    <asp:TextBox  class="form-control" ID="txtinterviewStep" TextMode="SingleLine" placeholder="Enter Step" runat="server"></asp:TextBox>
                    <asp:Label ID="txtinterviewSteplabel" Text="" runat="server"></asp:Label>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-12 col-sm-4 col-md-3 col-lg-3">
                    <asp:Button type="submit" runat="server" Text="Add Interview Step" ID="AddInterviewSteps" OnClientClick="return userData()" class="form-control btn btn-primary" OnClick="AddInterviewSteps_Click" />
                </div>
                <div class="form-group col-12 col-sm-8 col-md-3 col-lg-8">
                    <asp:Button type="submit" runat="server" Text="Cancel" ID="cancel" class="form-control btn btn-primary" OnClick="cancel_Click" />
                </div>
            </div>
            <br>
            <div class="form-row">
                <asp:Label ID="messageText" Text="" runat="server"></asp:Label>
            </div>
        </div>
        <br />
        <div class="form-group">
            <asp:GridView ID="InterviewStepsGridView" OnRowEditing="InterviewStepsGridView_RowEditing" OnRowCancelingEdit="InterviewStepsGridView_RowCancelingEdit" OnRowUpdating="InterviewStepsGridView_RowUpdating" OnRowDeleting="InterviewStepsGridView_RowDeleting" CssClass="table" runat="server" AutoGenerateColumns="False" PageSize="10">
                <Columns>
                     <asp:TemplateField HeaderText="ID">
                    <ItemTemplate>
                        <asp:Label ID="lbl_ID" runat="server" Text='<%#Eval("Id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Name">
                    <ItemTemplate>
                        <asp:Label ID="lbl_Name" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_Name" runat="server" Text='<%#Eval("Name") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                  <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btn_Edit" runat="server" Text="Edit" CommandName="Edit" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Button ID="btn_Update" runat="server" Text="Update" CommandName="Update" />
                        <asp:Button ID="btn_Cancel" runat="server" Text="Cancel" CommandName="Cancel" />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btn_Delete" runat="server" Text="Delete" CommandName="Delete" />
                    </ItemTemplate>
                </asp:TemplateField>
                </Columns>
                <HeaderStyle CssClass="success" />
                <PagerStyle CssClass="" />
            </asp:GridView>
        </div>
    </div>
    <script>
        function userData() {
            
            var Name = document.getElementById("MainContent_txtinterviewStep").value;
            var i = 0;
            Name = Name.trim();
            if (Name = undefined || Name == "") {
                document.getElementById("MainContent_txtinterviewSteplabel").innerHTML = "Please enter Full Name";
                document.getElementById("MainContent_txtinterviewSteplabel").style = "color:red";
                return false;
            }
            else {
                return true;
            }

        }
    </script>
</asp:Content>
