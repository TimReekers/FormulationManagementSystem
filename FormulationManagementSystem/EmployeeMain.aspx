<%@ Page Title="Employee"Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmployeeMain.aspx.cs" Inherits="FormulationManagementSystem.EmployeeMain" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>Active Team Memeber Listing</h3>
    <p>Additional information coming soon.</p>


    <asp:label id="Label1" runat="server"></asp:label>


   <asp:HyperLink runat="server" NavigateUrl="~/AddEmployee" Text="Add New Employee" />

<br /><br />
   <asp:HyperLink runat="server" NavigateUrl="~/AddEmployee" Text="View Non-Active Employee Listing" />
    <br /><br />
    <asp:TextBox runat="server" ID="TxtSearch" Text="First Name" AutoPostBack="true"></asp:TextBox>
    <br /><br />

    <script runat="server">

 private void OnDSUpdatedHandler(Object source, SqlDataSourceStatusEventArgs e) {
    if (e.AffectedRows > 0) {
        // Perform any additional processing, such as sending an e-mail notification.
        Label1.Text = Request.LogonUserIdentity.Name +
            " changed user information sucessfully!";
    }
    else {
        Label1.Text = "No data updated!";
    }
 }
</script>



    
<asp:SqlDataSource ID="EmployeeListing" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"  ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT Employee.Id, Employee.EmployeeIdent, Employee.FirstName, Employee.LastName, VdscArea.Area, Employee.TeamLeader, Employee.AreaManager, Employee.OvertimePreference, Employee.Shift, Employee.ForkliftLicense, Employee.ShippingEmployee, Employee.EmploymentTerminated
FROM Employee INNER JOIN VdscArea ON Employee.VdscAreaId = VdscArea.Id;" 
          OnUpdated="OnDSUpdatedHandler">
     


</asp:SqlDataSource>


<script>

    $(document).on("Keyup", function () {
        SearchGrid('<%=TxtSearch.ClientID%>', '<%=EmployeeGrid.ClientID%>');
    });

</script>




    <asp:GridView ID="EmployeeGrid" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="EmployeeListing" CellPadding="3" ForeColor="Black" GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" AutoGenerateEditButton="True">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>

         
            <asp:BoundField DataField="EmployeeIdent"  HeaderText="Employee ID" SortExpression="Employee ID"  ItemStyle-Width="175px" >
<ItemStyle Width="175px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" ItemStyle-Width="85px" >
<ItemStyle Width="85px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" ItemStyle-Width="85px"  >
<ItemStyle Width="85px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="Area" HeaderText="Area" SortExpression="Area" ItemStyle-Width="195px" >
<ItemStyle Width="195px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="TeamLeader" HeaderText="Team Leader" SortExpression="TeamLeader" ItemStyle-Width="55px" >
<ItemStyle Width="55px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="AreaManager" HeaderText="Area Manager" SortExpression="AreaManager" ItemStyle-Width="50px"> 
<ItemStyle Width="50px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="OvertimePreference" HeaderText="Overtime Preference" SortExpression="OvertimePreference"  /> 
            <asp:BoundField DataField="Shift" HeaderText="Shift" SortExpression="Shift"/>
            <asp:BoundField DataField="ForkliftLicense" HeaderText="ForkliftLicense" SortExpression="ForkliftLicense" />
            <asp:BoundField DataField="ShippingEmployee" HeaderText="ShippingEmployee" SortExpression="ShippingEmployee" />
            <asp:BoundField DataField="EmploymentTerminated" HeaderText="EmploymentTerminated" SortExpression="EmploymentTerminated" />
               <asp:ButtonField ButtonType="Link" Text="Details" ItemStyle-ForeColor ="Blue">
        
            
<ItemStyle ForeColor="Blue"></ItemStyle>
            </asp:ButtonField>
        
            
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Gray" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
    <br />
   



<script>
    function SearchGrid(txtSearch, EmployeeGrid) {
        if ($("[id *=" + txtSearch + " ]").val() != "") {
            $("[id *=" + EmployeeGrid + " ]").children
                ('tbody').children('tr').each(function () {
                    $(this).show();
                });
            $("[id *=" + EmployeeGrid + " ]").children
                ('tbody').children('tr').each(function () {
                    var match = false;
                    $(this).children('td').each(function () {
                        if ($(this).text().toUpperCase().indexOf($("[id *=" +
                            txtSearch + " ]").val().toUpperCase()) > -1) {
                            match = true;
                            return false;
                        }
                    });
                    if (match) {
                        $(this).show();
                        $(this).children('th').show();
                    }
                    else {
                        $(this).hide();
                        $(this).children('th').show();
                    }
                });


            $("[id *=" + EmployeeGrid + " ]").children('tbody').
                children('tr').each(function (index) {
                    if (index == 0)
                        $(this).show();
                });
        }
        else {
            $("[id *=" + EmployeeGrid + " ]").children('tbody').
                children('tr').each(function () {
                    $(this).show();
                });
        }
    }
</script>






 













</asp:Content>