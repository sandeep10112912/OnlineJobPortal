<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CandidateStatus.aspx.cs" Inherits="JobPortalWeb.CandidateStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.css" rel="stylesheet" />
    <div style="border: 2px solid black; padding: 30px">
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
                <label for="email" class="lable">Select Candidate :</label>
            </div>
            <div class="form-group col-12 col-sm-8 col-md-9 col-lg-9">
                <asp:DropDownList class="form-control" ID="drpCandidate" placeholder="Select Candidate " runat="server"></asp:DropDownList>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-12 col-sm-4 col-md-3 col-lg-3">
                <label for="email" class="lable">Set Status :</label>
            </div>
            <div class="form-group col-12 col-sm-8 col-md-9 col-lg-9">
                <asp:DropDownList class="form-control" ID="drpStatus" placeholder="Select Status " runat="server"></asp:DropDownList>
            </div>
        </div>
          <div class="form-row">
            <div class="form-group col-12 col-sm-4 col-md-3 col-lg-3">
                <asp:Label ID="messageText" Text="" runat="server"></asp:Label>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-12 col-sm-4 col-md-3 col-lg-3">
                <asp:Button runat="server" Text="Save" ID="StatusCandidate" class="form-control btn btn-primary"  OnClick="StatusCandidate_Click" />
            </div>
        </div>
    </div>

</asp:Content>
