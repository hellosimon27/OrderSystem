<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="consume_log.aspx.cs" Inherits="consume_log"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    消費紀錄
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div style="margin : 10px;">
         您至今共吃掉了<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>元<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:OrderSystemConnectionString %>" SelectCommand="SELECT SUM(order_cost) AS cost FROM order_det WHERE (fb_id = @fb_id)">
             <SelectParameters>
                 <asp:SessionParameter Name="fb_id" SessionField="fb_id" />
             </SelectParameters>
         </asp:SqlDataSource>
         <br>
         <br>
         <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" Visible="False">
             <Columns>
                 <asp:BoundField DataField="y" HeaderText="y" ReadOnly="True" SortExpression="y" />
                 <asp:BoundField DataField="cost" HeaderText="cost" ReadOnly="True" SortExpression="cost" />
             </Columns>
         </asp:GridView>


         <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:OrderSystemConnectionString %>" SelectCommand="SELECT
     
     
        CAST( YEAR([timestamp]) as CHAR(4)) +'/' +  cast (Month([timestamp]) as CHAR(2)) y
      
       ,sum([money_change] ) cost
    
  FROM [OrderSystem].[dbo].[money_log]
  where fb_id = @fb_id
  group by YEAR([timestamp]),Month([timestamp])">
             <SelectParameters>
                 <asp:SessionParameter Name="fb_id" SessionField="fb_id" />
             </SelectParameters>
         </asp:SqlDataSource>


    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="80%" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None">
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
        <Columns>
            <asp:BoundField DataField="timestamp" HeaderText="時間" SortExpression="timestamp">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="reason" HeaderText="事件" SortExpression="reason">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="money_change" HeaderText="金額" SortExpression="money_change">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="left_money" HeaderText="剩餘金額" SortExpression="left_money">
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
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OrderSystemConnectionString %>" SelectCommand="SELECT [money_change], [left_money], [timestamp], [reason] FROM [money_log] WHERE ([fb_id] = @fb_id)
order by [timestamp] desc">
    <SelectParameters>
        <asp:SessionParameter DefaultValue="0" Name="fb_id" SessionField="fb_id" Type="String" />
    </SelectParameters>
</asp:SqlDataSource>
        </div>
    <br />
    <br />
</asp:Content>

