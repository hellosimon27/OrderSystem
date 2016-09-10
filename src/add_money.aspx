<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="add_money.aspx.cs" Inherits="add_money" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    儲值
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="margin:10px;">
    <asp:DropDownList ID="select_name" runat="server" DataSourceID="SqlDataSource1" DataTextField="fb_name" DataValueField="fb_id">
    </asp:DropDownList>
    <asp:TextBox ID="add_money_value" runat="server"></asp:TextBox><asp:Button ID="Button1" runat="server" Text="送出" OnClick="Button1_Click" />
        <br />
        <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OrderSystemConnectionString %>" SelectCommand="SELECT [fb_id], [fb_name], [money] FROM [users]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:OrderSystemConnectionString %>" SelectCommand="add_money" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="select_name" DefaultValue="0" Name="fb_id" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="add_money_value" DefaultValue="0" Name="money" PropertyName="Text" Type="Int32" />
            </SelectParameters>
    </asp:SqlDataSource>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataKeyNames="fb_id" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="None" Width="80%">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:BoundField DataField="fb_id" HeaderText="Facebook ID" ReadOnly="True" SortExpression="fb_id" >
                <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="fb_name" HeaderText="名字" SortExpression="fb_name" >
                <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="money" HeaderText="儲值金額" SortExpression="money" >
                <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
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
    </div>
&nbsp;

</asp:Content>

