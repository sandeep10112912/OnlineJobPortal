<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Position.aspx.cs" Inherits="JobPortalWeb.Position" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.css" rel="stylesheet" />
    <div style="border: 2px solid black; padding: 30px">
        <div class="form-row">
            <asp:TextBox class="form-control" ID="posstionID" Visible="false" placeholder="Enter Postion Name" runat="server"></asp:TextBox>
            <div class="form-group col-12 col-sm-4 col-md-3 col-lg-3">
                <label for="email" class="label">Postion Name:</label>
            </div>
            <div class="form-group col-12 col-sm-8 col-md-9 col-lg-9">
                <asp:TextBox class="form-control" ID="txtPostionName" placeholder="Enter Postion Name" runat="server"></asp:TextBox>
                <asp:Label ID="lblPostionName" Text="" runat="server"></asp:Label>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group col-12 col-sm-4 col-md-3 col-lg-3">
                <label for="email" class="lable">Postion Desciption:</label>
            </div>
            <div class="form-group col-12 col-sm-8 col-md-9 col-lg-9">
                <asp:TextBox class="form-control" ID="txtPostionDesciption" TextMode="MultiLine" placeholder="Enter Postion Description" runat="server"></asp:TextBox>
                <asp:Label ID="lblPostionDesciption" Text="" runat="server"></asp:Label>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-12 col-sm-4 col-md-3 col-lg-3">
                <label for="email" class="lable">Interview Steps:</label>
            </div>
            <div class="form-group col-12 col-sm-8 col-md-9 col-lg-9">
                <asp:CheckBoxList ID="interviewSteps" DataTextField="Name" DataValueField="Id" CellPadding="5" CellSpacing="5" RepeatColumns="2" RepeatDirection="Vertical" RepeatLayout="Flow" TextAlign="Right" runat="server" />
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-12 col-sm-4 col-md-3 col-lg-3">
                <asp:Button type="submit" runat="server" Text="Save Position" ID="AddPostion" class="form-control btn btn-primary" OnClientClick="return userData()" OnClick="AddPostion_Click" />
            </div>
            <div class="form-group col-12 col-sm-8 col-md-9 col-lg-9">
                <asp:Button type="submit" runat="server" Text="Cancel" ID="cancel" class="form-control btn btn-primary" OnClick="cancel_Click" />
            </div>
        </div>

        <br>
        <div class="form-row">
            <div class="form-group col-12 col-sm-4 col-md-3 col-lg-3">
                <asp:Label ID="messageText" Text="" runat="server"></asp:Label>
            </div>
        </div>
    </div>
    <br />
    <div class="form-group">
        <asp:GridView ID="PostionGridView" OnRowEditing="PostionGridView_RowEditing" OnRowCancelingEdit="PostionGridView_RowCancelingEdit" OnRowDeleting="PostionGridView_RowDeleting" OnRowUpdating="PostionGridView_RowUpdating" CssClass="table" runat="server" AutoGenerateColumns="False" PageSize="10">
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
                <asp:TemplateField HeaderText="Descriptions">
                    <ItemTemplate>
                        <asp:Label ID="lbl_Descriptions" runat="server" Text='<%#Eval("Descriptions") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_Descriptions" runat="server" Text='<%#Eval("Descriptions") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="InterviewStep">
                    <ItemTemplate>
                        <asp:Label ID="lbl_InterviewStepIds" runat="server" Text='<%#Eval("InterviewStepIds") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_InterviewStepIds" runat="server" Text='<%#Eval("InterviewStepIds") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Active">
                    <ItemTemplate>
                        <asp:CheckBox ID="txt_IsActive" runat="server" Enabled="false" Checked='<%#Eval("Is_Active") %>'></asp:CheckBox>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:CheckBox ID="txt_IsActive" runat="server" Checked='<%#Eval("Is_Active") %>'></asp:CheckBox>
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

    <script>
        function userData() {

            var Name = document.getElementById("MainContent_txtPostionName").value;
            var i = 0;
            Name = Name.trim();
            if (Name = undefined || Name == "") {
                document.getElementById("MainContent_lblPostionName").innerHTML = "Please enter  Position Name";
                document.getElementById("MainContent_lblPostionName").style = "color:red"
                i = 1
            }
            var Desciption = document.getElementById("MainContent_txtPostionDesciption").value;
            Desciption = Desciption.trim();
            if (Desciption = undefined || Desciption == "") {
                document.getElementById("MainContent_lblPostionDesciption").innerHTML = "Please enter Postion Desciption";
                document.getElementById("MainContent_lblPostionDesciption").style = "color:red"
                i = 1
            }
            if (i == 1)
                return false
            else
                return true

        }
    </script>
</asp:Content>
