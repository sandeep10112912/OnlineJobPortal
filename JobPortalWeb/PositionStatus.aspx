<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PositionStatus.aspx.cs" Inherits="JobPortalWeb.PositionStatus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.css" rel="stylesheet" />
     <div class="form-group">
        <asp:GridView ID="PostionGridView" CssClass="table" runat="server" AutoGenerateColumns="False" PageSize="10">
            <Columns>
                <asp:TemplateField HeaderText="ID">
                    <ItemTemplate>
                        <asp:Label ID="lbl_ID" runat="server" Text='<%#Eval("Id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Candidate Name">
                    <ItemTemplate>
                        <asp:Label ID="lbl_CandidateName" runat="server" Text='<%#Eval("CandidateName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Position Name">
                    <ItemTemplate>
                        <asp:Label ID="lbl_PositionName" runat="server" Text='<%#Eval("PositionName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Position Status">
                    <ItemTemplate>
                        <asp:Label ID="lbl_Status" runat="server" Text='<%#Eval("Status") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle CssClass="success" />
            <PagerStyle CssClass="" />
        </asp:GridView>
         </div>
</asp:Content>
