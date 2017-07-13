<%@ Page Title="Batch Control Recipe Main" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BatchControlRecipeMain.aspx.cs" Inherits="FormulationManagementSystem.BatchControlRecipeMain" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>Batch Recipes</h3>
    <p>Additional information coming soon.</p>


    <asp:label id="Label2" runat="server"></asp:label>


   <asp:HyperLink runat="server" NavigateUrl="~/AddEmployee" Text="Add New Employee" />

<br /><br />
   <asp:HyperLink runat="server" NavigateUrl="~/AddEmployee" Text="View Non-Active Employee Listing" />


    <script runat="server">

 private void OnDSUpdatedHandler(Object source, SqlDataSourceStatusEventArgs e) {
    if (e.AffectedRows > 0) {
        // Perform any additional processing, such as sending an e-mail notification.
        Label2.Text = Request.LogonUserIdentity.Name +
            " changed user information sucessfully!";
    }
    else {
        Label2.Text = "No data updated!";
    }
 }
</script>




    
<asp:SqlDataSource ID="EmployeeListing" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT Recipe.Id, Material.VdscCode, Recipe.Description, Recipe.DescriptionNotes, Recipe.BatchQty
FROM Recipe INNER JOIN Material ON Recipe.MaterialId = Material.Id
;" UpdateCommand="Update Recipe SET MaterialID=?,Description=?,DescriptionNotes=?,BatchQty=? WHERE ID=?"
          OnUpdated="OnDSUpdatedHandler"></asp:SqlDataSource>


    <asp:GridView ID="ProdRequestGrid" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="EmployeeListing" CellPadding="3" ForeColor="Black" GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" AutoGenerateEditButton="True">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>

         
            <asp:BoundField DataField="VDSCCode"  HeaderText="VDSC Code" SortExpression="VDSC Code"  ItemStyle-Width="75px" >
<ItemStyle Width="175px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" ItemStyle-Width="285px" >
<ItemStyle Width="285px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="DescriptionNotes" HeaderText="DescriptionNotes" SortExpression="DescriptionNotes" ItemStyle-Width="285px"  >
<ItemStyle Width="285px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="BatchQty" HeaderText="BatchQty" SortExpression="BatchQty" ItemStyle-Width="195px" >
<ItemStyle Width="195px"></ItemStyle>
            </asp:BoundField>

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








 













</asp:Content>
