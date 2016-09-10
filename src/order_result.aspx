<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="order_result.aspx.cs" Inherits="order_result" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataSourceID="SqlDataSource4" ForeColor="Black" GridLines="None" OnRowDataBound="GridView4_RowDataBound" Width="80%">
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
        <Columns>
            <asp:BoundField DataField="fb_name" HeaderText="fb_name" SortExpression="fb_name" />
            <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
            <asp:BoundField DataField="tel" HeaderText="tel" SortExpression="tel" />
            <asp:BoundField DataField="valid" HeaderText="valid" SortExpression="valid" />
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
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:OrderSystemConnectionString %>" SelectCommand="select fb_name,name,tel,valid from dbo.order_list a left join dbo.users b on a.chairman = b.fb_id 
left join dbo.menu c on a.rest_id = c.sn where id=@id">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="id" QueryStringField="order_id" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br>


    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="None" Width="80%">
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
        <Columns>
            <asp:BoundField DataField="name" HeaderText="名稱" SortExpression="name">
                <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="requirement1" HeaderText="選項" SortExpression="requirement1">
                <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="requirement2" HeaderText="選項" SortExpression="requirement2">
                <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="requirement3" HeaderText="選項" SortExpression="requirement3">
                <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="amount" HeaderText="數量" ReadOnly="True" SortExpression="amount">
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OrderSystemConnectionString %>" SelectCommand="SELECT name,c.option_item requirement1,d.option_item requirement2,e.option_item requirement3
     ,sum([amount]) amount     
  FROM [OrderSystem].[dbo].[order_det] a 
  left join dbo.dish b on a.item_id = b.id
  left join dbo.requirement c on a.requirement1 = c.id
  left join dbo.requirement d on a.requirement2 = d.id
  left join dbo.requirement e on a.requirement3 = e.id
  where order_id = @order_id
  group by order_id,name,c.option_item ,d.option_item ,e.option_item
  order by name">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="order_id" QueryStringField="order_id" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    總計:<br />
    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataSourceID="SqlDataSource3" ForeColor="Black" GridLines="None" Width="80%">
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
        <Columns>
            <asp:BoundField DataField="amount" HeaderText="總數" ReadOnly="True" SortExpression="amount">
                <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="cost" HeaderText="總金額" ReadOnly="True" SortExpression="cost">
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
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:OrderSystemConnectionString %>" SelectCommand=" 
  select sum(amount) amount,SUM((cost + isnull(c.cost_modify,0) + isnull(d.cost_modify,0) + isnull(e.cost_modify,0))* amount) cost 
	FROM [OrderSystem].[dbo].[order_det] a 
	left join dbo.dish b on a.item_id = b.id
	left join dbo.requirement c on a.requirement1 = c.id
    left join dbo.requirement d on a.requirement2 = d.id
    left join dbo.requirement e on a.requirement3 = e.id
	
	  where order_id = @order_id">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="order_id" QueryStringField="order_id" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    明細:<br />
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataSourceID="SqlDataSource2" ForeColor="Black" GridLines="None" Width="80%" DataKeyNames="id" style="margin-right: 1px" OnRowDataBound="GridView2_RowDataBound" OnRowEditing="GridView2_RowEditing" OnRowUpdating="GridView2_RowUpdating">
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
        <Columns>
            <asp:BoundField DataField="fb_name" HeaderText="姓名" SortExpression="fb_name" ReadOnly="True">
                <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="品項" SortExpression="name">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="dish1" DataTextField="name" DataValueField="id" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" SelectedValue='<%# Bind("item_id") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="dish1" runat="server" ConnectionString="<%$ ConnectionStrings:OrderSystemConnectionString %>" SelectCommand="SELECT dish.name, dish.id FROM dish INNER JOIN order_list ON dish.rest = order_list.rest_id WHERE (order_list.id = @order_id)">
                        <SelectParameters>
                            <asp:QueryStringParameter DefaultValue="0" Name="order_id" QueryStringField="order_id" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="選項" SortExpression="requirement1">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource5" DataTextField="option_item" DataValueField="id" OnDataBinding="DropDownList2_DataBinding" style="margin-bottom: 0px">
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("requirement1") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="選項" SortExpression="requirement2">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource6" DataTextField="option_item" DataValueField="id" OnDataBinding="DropDownList2_DataBinding">
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("requirement2") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="選項" SortExpression="requirement3">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource7" DataTextField="option_item" DataValueField="id" OnDataBinding="DropDownList2_DataBinding">
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("requirement3") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:BoundField DataField="amount" HeaderText="數量" SortExpression="amount">
                <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:CommandField ShowDeleteButton="True" DeleteText="刪除" />
            <asp:CommandField ShowEditButton="True" EditText="修改" />
            <asp:BoundField DataField="fb_id" HeaderText="fb_id" SortExpression="fb_id" Visible="False" ReadOnly="True" />
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
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:OrderSystemConnectionString %>" SelectCommand="SELECT a.id, a.item_id, c.fb_id, c.fb_name, b.name, d.option_item AS requirement1, e.option_item AS requirement2, f.option_item AS requirement3, a.amount, e.id AS id2, f.id AS id3, d.id AS id1 FROM order_det AS a LEFT OUTER JOIN dish AS b ON a.item_id = b.id LEFT OUTER JOIN users AS c ON a.fb_id = c.fb_id LEFT OUTER JOIN requirement AS d ON a.requirement1 = d.id LEFT OUTER JOIN requirement AS e ON a.requirement2 = e.id LEFT OUTER JOIN requirement AS f ON a.requirement3 = f.id WHERE (a.order_id = @order_id)" DeleteCommand="sp_del_order" DeleteCommandType="StoredProcedure" UpdateCommand="change_order" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="order_id" QueryStringField="order_id" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="id" Type="Int32"  />
            <asp:SessionParameter DefaultValue="0" Name="fb_id" SessionField="fb_id" />
            <asp:QueryStringParameter DefaultValue="0" Name="order_id" QueryStringField="order_id" />
            
            <asp:Parameter Name="item_id" Type="Int32" />
            <asp:Parameter Name="amount" Type="Int32" />
            <asp:Parameter Name="requirement1" Type="Int32" />
            <asp:Parameter Name="requirement2" Type="Int32" />
            <asp:Parameter Name="requirement3" Type="Int32" />
            <asp:Parameter Name="note" Type="String" />
            
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:OrderSystemConnectionString %>" SelectCommand="SELECT requirement.option_item, requirement.cost_modify, requirement.id FROM requirement INNER JOIN dish ON requirement.option_group = dish.requirement1 WHERE (dish.id = @id)">
        <SelectParameters>
            <asp:Parameter Name="id" />
        </SelectParameters>
    </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:OrderSystemConnectionString %>" SelectCommand="SELECT requirement.option_item, requirement.cost_modify, requirement.id FROM requirement INNER JOIN dish ON requirement.option_group = dish.requirement2 WHERE (dish.id = @id)">
        <SelectParameters>
            <asp:Parameter Name="id" />
        </SelectParameters>
    </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:OrderSystemConnectionString %>" SelectCommand="SELECT requirement.option_item, requirement.cost_modify, requirement.id FROM requirement INNER JOIN dish ON requirement.option_group = dish.requirement3 WHERE (dish.id = @id)">
        <SelectParameters>
            <asp:Parameter Name="id" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />
</asp:Content>

