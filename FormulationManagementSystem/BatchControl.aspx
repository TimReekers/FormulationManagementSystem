<%@ Page Title="Batch Control" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BatchControl.aspx.cs" Inherits="FormulationManagementSystem.Production" %>






<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>Production Campaigns</h3>
    <p>Use dropdown to select filter.</p>

    <asp:HyperLink runat="server" NavigateUrl="~/AddProdRequest" Text="Add New Production Request" />

<br /><br />
<asp:Label runat="server" Text="Show:" />
<asp:DropDownList runat="server" AutoPostBack="true" ID="ProdStateList" DataValueField="ProdStateID">
    <asp:ListItem Text="All" Value="" />
    <asp:ListItem Text="Not Started" Value="Not Started" />
    <asp:ListItem Text="In Progress" Value ="In Progress" />
    <asp:ListItem Text="Completed" value ="Completed"/>




</asp:DropDownList>

<asp:ValidationSummary runat="server" ShowModelStateErrors="true"/>


<asp:SqlDataSource ID="ProdReqStateAll" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT ProductionRequest.ID, Customer.CustomerName, VdscArea.Area, Material.VdscCode, ProductionRequest.QuantityRequested, ProductionRequest.Status, Material.ProductionGoal, ProductionRequest.BeginDate, ProductionRequest.EndDate, Material.Description, Material.UnitOfMeasure
FROM VdscArea RIGHT JOIN (Customer RIGHT JOIN (ProductionRequest LEFT JOIN Material ON ProductionRequest.MaterialID = Material.ID) ON Customer.Id = ProductionRequest.CustomerId) ON VdscArea.Id = ProductionRequest.VdscAreaId
GROUP BY ProductionRequest.ID, Customer.CustomerName, VdscArea.Area, Material.VdscCode, ProductionRequest.QuantityRequested, ProductionRequest.Status, Material.ProductionGoal, ProductionRequest.BeginDate, ProductionRequest.EndDate, Material.Description, Material.UnitOfMeasure
ORDER BY VdscArea.Area, Material.Description;"
    FilterExpression="Status='{0}'">

    <FilterParameters>
        <asp:ControlParameter ControlID ="ProdStateList"    Name="ProdState" PropertyName="SelectedValue" />

    </FilterParameters>

  
</asp:SqlDataSource>
    

    <asp:GridView ID="ProdRequestGrid" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="ProdReqStateAll" CellPadding="3" ForeColor="Black" GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>

         
            <asp:BoundField DataField="CustomerName"  HeaderText="Customer Name" SortExpression="CustomerName"  ItemStyle-Width="175px" >
<ItemStyle Width="175px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="BeginDate" HeaderText="Begin Date" SortExpression="BeginDate" ItemStyle-Width="85px" DataFormatString="{0:d}" HtmlEncode=false>
<ItemStyle Width="85px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="EndDate" HeaderText="End Date" SortExpression="EndDate" ItemStyle-Width="85px" DataFormatString="{0:d}" HtmlEncode=false >
<ItemStyle Width="85px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="Area" HeaderText="Area" SortExpression="Area" ItemStyle-Width="195px" >
<ItemStyle Width="195px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="VDSCCode" HeaderText="VDSC Code" SortExpression="VDSCCode" ItemStyle-Width="55px" >
<ItemStyle Width="55px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" ItemStyle-Width="350px"> 
<ItemStyle Width="350px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="QuantityRequested" HeaderText="Quantity Requested" SortExpression="QuantityRequested" DataFormatString="{0:N0}" /> 
            <asp:BoundField DataField="ProductionGoal" HeaderText="Production Goal" SortExpression="ProductionGoal" DataFormatString="{0:N0}"/>
            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
            <asp:BoundField DataField="UnitofMeasure" HeaderText="UOM" SortExpression="UnitofMeasure" />
        
            
            <asp:ButtonField Text="Select" ItemStyle-ForeColor="Blue"  />
        
            
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
