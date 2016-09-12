<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="start_order.aspx.cs" Inherits="start_order" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    開始訂餐
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<script src="js/JavaScript.js"></script>
<script>

    function check_abandon() {

        return confirm("確定要'退款'嗎?\n確定要'退款'嗎?\n確定要'退款'嗎?\n\n很重要所以說三次!!\n不能反悔喔");

    }
</script>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="2" DataKeyNames="id" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="None" Width="100%" HorizontalAlign="Left" OnDataBound="GridView1_DataBound" OnRowDataBound="GridView1_RowDataBound" Style="text-align: left" OnRowCommand="GridView1_RowCommand">
        <AlternatingRowStyle CssClass="alterrow" />
        <Columns>
            <asp:TemplateField ShowHeader="False" HeaderText="功能">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="編輯"></asp:LinkButton>
                    ,<asp:LinkButton ID="LinkButton3" runat="server" CommandArgument='<%# Eval("id")%>' CommandName="close">收單</asp:LinkButton>
                    ,<asp:LinkButton ID="LinkButton5" runat="server" CommandArgument='<%# Eval("id")%>' CommandName="open">重啟</asp:LinkButton>
                    ,<asp:LinkButton ID="LinkButton4" runat="server" CommandArgument='<%# Eval("id")%>' CommandName="fold">結案</asp:LinkButton>
                    ,<asp:LinkButton ID="LinkButton6" runat="server" CommandArgument='<%# Eval("id") %>' CommandName="abandon" OnClientClick="return check_abandon();">退款</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="chairman" HeaderText="發起人" ReadOnly="True" SortExpression="chairman" />
            <asp:BoundField DataField="rest_id" HeaderText="名稱" ReadOnly="True" SortExpression="rest_id" />
            <asp:BoundField DataField="start_time" HeaderText="開始時間" ReadOnly="True" SortExpression="start_time" />
            <asp:TemplateField HeaderText="點餐" SortExpression="valid">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("valid") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("valid") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="查看結果">
                <ItemTemplate>
                    <a href="order_result.aspx?order_id=<%# Eval("id") %>">查看</a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EmptyDataTemplate>
            抱歉，現在沒有開放的訂單。請洽管理員，或者自己去買唷 ^.&lt;
        </EmptyDataTemplate>
        <FooterStyle BackColor="Tan" />
        <HeaderStyle Font-Bold="True" CssClass="headerCSS" />
        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
        <RowStyle CssClass="row" />
        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        <SortedAscendingCellStyle BackColor="#FAFAE7" />
        <SortedAscendingHeaderStyle BackColor="#DAC09E" />
        <SortedDescendingCellStyle BackColor="#E1DB9C" />
        <SortedDescendingHeaderStyle BackColor="#C2A47B" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OrderSystemConnectionString %>" DeleteCommand="DELETE FROM [order_list] WHERE [id] = @id" InsertCommand="INSERT INTO [order_list] ([note]) VALUES (@note)" SelectCommand="SELECT order_list.id, order_list.start_time, order_list.valid, order_list.note, menu.name AS rest_id, users.fb_name AS chairman, order_list.max_cost, order_list.max_order, ISNULL(order_list.max_order - ISNULL(c.counts, 0), 0) AS counts, users.fb_id FROM order_list INNER JOIN menu ON order_list.rest_id = menu.sn INNER JOIN users ON order_list.chairman = users.fb_id LEFT OUTER JOIN (SELECT order_id, COUNT(1) AS counts FROM order_det WHERE (host_cost &gt; 0) GROUP BY order_id) AS c ON c.order_id = order_list.id WHERE (order_list.valid &lt; @valid)" UpdateCommand="UPDATE [order_list] SET [note] = @note WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="note" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter DefaultValue="2" Name="valid" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="note" Type="String" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>