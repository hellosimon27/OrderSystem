<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="requirement_edit.aspx.cs" Inherits="requirement_edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    新增： 分類<asp:TextBox ID="group" runat="server"></asp:TextBox> 項目 <asp:TextBox ID="requirement" runat="server"></asp:TextBox> 金額修正 <asp:TextBox ID="cost_modify" runat="server"></asp:TextBox><asp:Button ID="Button1" runat="server" Text="送出" OnClick="Button1_Click" />
      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataKeyNames="id" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="None">
          <AlternatingRowStyle BackColor="PaleGoldenrod" />
          <Columns>
              <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
              <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
              <asp:BoundField DataField="option_group" HeaderText="option_group" SortExpression="option_group" />
              <asp:BoundField DataField="option_item" HeaderText="option_item" SortExpression="option_item" />
              <asp:BoundField DataField="cost_modify" HeaderText="cost_modify" SortExpression="cost_modify" />
          </Columns>
          <FooterStyle BackColor="Tan" />
          <HeaderStyle BackColor="Tan" Font-Bold="True" />
          <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
          <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
          <SortedAscendingCellStyle BackColor="#FAFAE7" />
          <SortedAscendingHeaderStyle BackColor="#DAC09E" />
          <SortedDescendingCellStyle BackColor="#E1DB9C" />
          <SortedDescendingHeaderStyle BackColor="#C2A47B" />
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OrderSystemConnectionString %>" DeleteCommand="DELETE FROM [requirement] WHERE id = @id" InsertCommand="INSERT INTO [requirement] ([option_group], [option_item], [cost_modify]) VALUES (@option_group, @option_item, @cost_modify)" SelectCommand="SELECT * FROM [requirement] ORDER BY [option_group]" UpdateCommand="UPDATE [requirement]  SET [cost_modify] = @cost_modify, [option_group] = @option_group ,[option_item] = @option_item WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="option_group" Type="String" />
            <asp:Parameter Name="option_item" Type="String" />
            <asp:Parameter Name="cost_modify" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="cost_modify" Type="Int32" />
            <asp:Parameter Name="option_group" Type="String" />
            <asp:Parameter Name="option_item" Type="String" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>

