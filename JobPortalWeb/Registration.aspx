<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="JobPortalWeb.Registration" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.css" rel="stylesheet" />
    <div style="border: 2px solid black; padding: 30px">
        <div class="form-row">
            <asp:TextBox class="form-control" ID="txtcandidateID" Visible="false" placeholder="Enter   Name" runat="server"></asp:TextBox>
            <div class="form-group col-12 col-sm-4 col-md-3 col-lg-3">
                <label id="lfname" for="email" class="label">Full Name:</label>
            </div>
            <div class="form-group col-12 col-sm-8 col-md-9 col-lg-9">
                <asp:TextBox class="form-control" ID="txtFullName" placeholder="Enter Full Name" runat="server"></asp:TextBox>
                <asp:Label ID="txtFullNamelable" Text="" runat="server"></asp:Label>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group col-12 col-sm-4 col-md-3 col-lg-3">
                <label id="l2fname" for="email" class="lable">Contact No:</label>
            </div>
            <div class="form-group col-12 col-sm-8 col-md-9 col-lg-9">
                <asp:TextBox class="form-control" ID="txtContactNo" TextMode="Phone" placeholder="Enter Contact No" runat="server"></asp:TextBox>
                <asp:Label ID="txtContactNolabel" Text="" runat="server"></asp:Label>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group col-12 col-sm-4 col-md-3 col-lg-3">
                <label id="l3fname" for="email" class="lable">EmailId :</label>
            </div>
            <div class="form-group col-12 col-sm-8 col-md-9 col-lg-9">
                <asp:TextBox class="form-control" ID="txtEmailId" placeholder="Enter EmailId " TextMode="Email" runat="server"></asp:TextBox>
                <asp:Label ID="txtEmailIdlabel" Text="" runat="server"></asp:Label>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group col-12 col-sm-4 col-md-3 col-lg-3">
                <label for="email" class="lable">Is Internal:</label>
            </div>
            <div class="form-group col-12 col-sm-8 col-md-9 col-lg-9">
                <asp:CheckBox class="form-control" ID="chkIsInternal" runat="server"></asp:CheckBox>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group col-12 col-sm-4 col-md-3 col-lg-3">
                <label for="email" class="lable">Upload Resume</label>
            </div>
            <div class="form-group col-12 col-sm-8 col-md-9 col-lg-9">
                <asp:FileUpload class="form-control" ID="Uploadfile" placeholder="Upload Resume " runat="server"></asp:FileUpload>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group col-12 col-sm-4 col-md-3 col-lg-3">
                <label for="email" class="lable">Primary Skill :</label>
            </div>
            <div class="form-group col-12 col-sm-8 col-md-9 col-lg-9">
                <asp:TextBox class="form-control" ID="txtPrimarySkill" TextMode="MultiLine" placeholder="Enter Primary Skill " runat="server"></asp:TextBox>
                <asp:Label ID="txtPrimarySkilllabel" Text="" runat="server"></asp:Label>
            </div>
        </div>


        <div class="form-row">
            <div class="form-group col-12 col-sm-4 col-md-3 col-lg-3">
                <label for="email" class="lable">Select Postion :</label>
            </div>
            <div class="form-group col-12 col-sm-8 col-md-9 col-lg-9">
                <asp:DropDownList class="form-control" ID="drpPosition" placeholder="Select Posstion " runat="server"></asp:DropDownList>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group col-12 col-sm-4 col-md-3 col-lg-3">
                <label for="email" class="lable">Years Of Experice</label>
            </div>
            <div class="form-group col-12 col-sm-8 col-md-9 col-lg-9">
                <asp:TextBox class="form-control" ID="txtExpericace" TextMode="Number" placeholder="Enter Year of Experinace" runat="server"></asp:TextBox>
                <asp:Label ID="txtExpericacelabel" Text="" runat="server"></asp:Label>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-12 col-sm-4 col-md-3 col-lg-3">
                <asp:Button runat="server" Text="Save Candidate" ID="AddCandidate" class="form-control btn btn-primary" OnClientClick="return userData()" OnClick="AddCandidate_Click" />
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
        <asp:GridView ID="CandidateGridView" OnRowDataBound="CandidateGridView_RowDataBound" OnRowCancelingEdit="CandidateGridView_RowCancelingEdit" OnRowUpdating="CandidateGridView_RowUpdating"   OnRowEditing="CandidateGridView_RowEditing" OnRowDeleting="CandidateGridView_RowDeleting" CssClass="table" runat="server" AutoGenerateColumns="False" PageSize="10">
            <Columns>
            

                <asp:TemplateField HeaderText="ID">
                    <ItemTemplate>
                        <asp:Label ID="lbl_ID" runat="server" Text='<%#Eval("ID") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Name">
                    <ItemTemplate>
                        <asp:Label ID="lbl_FullName" runat="server" Text='<%#Eval("FullName") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_FullName" runat="server" Text='<%#Eval("FullName") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Contact No">
                    <ItemTemplate>
                        <asp:Label ID="lbl_ContactNo" runat="server" Text='<%#Eval("ContactNo") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_ContactNo" Width="120" runat="server" Text='<%#Eval("ContactNo") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Email Id">
                    <ItemTemplate>
                        <asp:Label ID="lbl_EmailId" runat="server" Text='<%#Eval("EmailId") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_EmailId" runat="server" Text='<%#Eval("EmailId") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Internal">
                    <ItemTemplate>
                          <asp:CheckBox ID="txt_IsInternal" runat="server" Enabled="false" Checked='<%#Eval("IsInternal") %>'></asp:CheckBox>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:CheckBox ID="txt_IsInternal" runat="server" Checked='<%#Eval("IsInternal") %>'></asp:CheckBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Resume">
                    <ItemTemplate>
                        <asp:LinkButton ID="lbl_Resume" runat="server" CommandName="Download" CommandArgument='<%# Eval("Resume") %>' Text='<%#Eval("Resume") %>'></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Primary Skill">
                    <ItemTemplate>
                        <asp:Label ID="lbl_PrimarySkill" runat="server" Text='<%#Eval("PrimarySkill") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_PrimarySkill" runat="server" Text='<%#Eval("PrimarySkill") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Postions" Visible="false">
                    <ItemTemplate>
                        <asp:Label ID="lbl_AssginedPostions" runat="server" Text='<%#Eval("AssginedPostion") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Postion">
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownListAssginedPostion" runat="server" Enabled="false"/>
                    </ItemTemplate>
                    <EditItemTemplate>
                            <asp:DropDownList ID="DropDownListAssginedPostion" runat="server">
                        </asp:DropDownList>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Experice">
                    <ItemTemplate>
                        <asp:Label ID="lbl_YearsOfExperice" runat="server" Text='<%#Eval("YearsOfExperice") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_YearsOfExperice" runat="server" Width="20" Text='<%#Eval("YearsOfExperice") %>'></asp:TextBox>
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
            var Name = document.getElementById("MainContent_txtFullName").value;
            var i = 0;
            if (Name = undefined || Name == "") {
                document.getElementById("MainContent_txtFullNamelable").innerHTML = "Please enter Full Name";
                document.getElementById("MainContent_txtFullNamelable").style="color:red"
                i = 1
            }
            var ContactNo = document.getElementById("MainContent_txtContactNo").value;
            if (ContactNo = undefined || ContactNo == "" || ContactNo.length < 10) {
                document.getElementById("MainContent_txtContactNolabel").innerHTML = "Please enter Correct Mobile No";
                document.getElementById("MainContent_txtContactNolabel").style = "color:red"
                i = 1

            }
            var email = document.getElementById("MainContent_txtEmailId").value;
            if (email = undefined || email == "") {
                document.getElementById("MainContent_txtEmailIdlabel").innerHTML = "Please enter Email Id";
                document.getElementById("MainContent_txtEmailIdlabel").style = "color:red"
                i = 1

            }
            var doc = document.getElementById("MainContent_Uploadfile").value;
            if (doc = undefined || doc == "" || doc.length < 3) {
                document.getElementById("MainContent_messageText").innerHTML = "Please Upload file";
                document.getElementById("MainContent_messageText").style = "color:red"
                i = 1

            }
            var skill = document.getElementById("MainContent_txtPrimarySkill").value;
            if (skill = undefined || skill == "" || skill.length < 3) {
                document.getElementById("MainContent_txtPrimarySkilllabel").innerHTML = "Please Enter Primary Skill";
                document.getElementById("MainContent_txtPrimarySkilllabel").style = "color:red"
                i = 1

            }
            var expricance = document.getElementById("MainContent_txtExpericace").value;
            if (expricance = undefined || expricance <= 0) {
                document.getElementById("MainContent_txtExpericacelabel").innerHTML = "Please Enter Valid Expriance";
                document.getElementById("MainContent_txtExpericacelabel").style = "color:red"
                i = 1

            }

            if (Name.length > 100) {
                document.getElementById("MainContent_messageText").value = "Accept Only 100 Character";
                document.getElementById("MainContent_messageText").style = "color:red"
                i = 1

            }
            if (i == 0) {
                return true;
            }
            else {
                return false;
            }


        }
    </script>
</asp:Content>
