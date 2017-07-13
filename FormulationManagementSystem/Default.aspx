<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FormulationManagementSystem._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>FMS</h1>
        <br />

        <p class="lead">Formulation Management Systems provides quick access to information across various departments within the organization. </p>
        <p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>
    </div>

    <div class="row">
        <div class="col-lg-3">
            <h2>Production</h2>
            <p>
                In depth look at production details.
            </p>
            <p>
                <a class="btn btn-default" runat="server" href="~/Production"> Access»</a>
            </p>
        </div>
        <div class="col-lg-3">
            <h2>Logistics</h2>
            <p>
                Quickly access product shipments, receipts, and transfers. &nbsp;</p>
            <p>
                <a class="btn btn-default" runat="server" href="~/Logistics"> Access &raquo;</a>
            </p>
        </div>
        <div class="col-lg-3">
            <h2>Quality</h2>
            <p>
                Information for product clearance, pallet inspections, and overall quality performance.&nbsp;
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301950">Access»</a>
            </p>
        </div>
                <div class="col-lg-3">
            <h2>Safety</h2>
            <p>
                Quickly access your training records, behavior tools, and safety information.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301950"> Access&raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
