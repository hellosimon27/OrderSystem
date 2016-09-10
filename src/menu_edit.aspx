<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="menu_edit.aspx.cs" Inherits="menu_edit" %>

<asp:content id="Content1" contentplaceholderid="head" runat="Server">
</asp:content>
<asp:content id="Content2" contentplaceholderid="ContentPlaceHolder1" runat="Server">
 <script src="js/JavaScript.js"></script>
    <script>

        function check_money(index)
        {              
            var total = parseInt( $(".l_money")[0].innerHTML);
     
            var c = $("#ContentPlaceHolder1_GridView1 tr")
            var max_cost = parseInt(c[index + 1].children[7].getElementsByTagName("input")[1].value);
            var max_order = parseInt(c[index + 1].children[7].getElementsByTagName("input")[2].value);
            
            if (isNaN(max_cost) || isNaN(max_order))
            {
                alert("金額或數量有誤!");
                return false;
            }

            if (total <= max_cost * max_order) {
                alert("沒那個屁股，就不要吃瀉藥!! 先存夠錢再來請客吧~~");
                return false;
            }
            else
                return confirm("確定要開團嗎?");
            

            
        }


        window.onload = function () {
            $(".amount").spinner({
                value: "",
                min: 0,
                max: 15,
                step: 1
            });
          
        };
    </script>
 
    <p>
        編輯菜單<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="None" Width="90%" DataKeyNames="SN" ShowFooter="True" OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound">
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="sn" HeaderText="SN" InsertVisible="False" ReadOnly="True" SortExpression="sn">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="名稱" SortExpression="name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="rest_name" runat="server"></asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="電話" SortExpression="tel">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("tel") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="tel" runat="server"></asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("tel") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="備註" SortExpression="note">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("note") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="note" runat="server"></asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("note") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False" HeaderText="編輯餐點">
                <FooterTemplate>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="送出" />
                </FooterTemplate>
                <ItemTemplate>

                   <a href="dish_edit.aspx?rest_id=<%#Eval("sn") %> ">編輯餐點
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="發起訂餐">
                 <ItemTemplate>
                <asp:Button runat="server" Text="發起訂單" CommandArgument='<%# Eval("sn")%>' OnClick="Unnamed1_Click" CommandName="start_order" OnClientClick='return confirm("確定要開團嗎?");' />
                      </ItemTemplate>
                 <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
           
            <asp:TemplateField HeaderText="我要請客" >
                <ItemTemplate>
                     <asp:Button runat="server" Text="請客" CommandArgument='<%# Eval("sn")%>' OnClick="Unnamed1_Click" CommandName="start_shout" ID="shout_buttom" />
                    單筆上限<asp:TextBox ID="max_cost" runat="server" Width ="50"> </asp:TextBox>
                    總數上限<asp:TextBox ID="max_order" runat="server" Width ="50"> </asp:TextBox>
                </ItemTemplate>
               
                <HeaderStyle Width="800px" />
                <ItemStyle Width="800px" />
                <FooterStyle Width ="800px" />
            </asp:TemplateField>
           
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OrderSystemConnectionString %>" DeleteCommand="DELETE FROM [menu] WHERE [sn] = @sn" InsertCommand="INSERT INTO [menu] ([name], [note], [tel]) VALUES (@name, @note, @tel)" SelectCommand="SELECT [name], [note], [tel], [sn] FROM [menu]" UpdateCommand="UPDATE [menu] SET [name] = @name, [note] = @note, [tel] = @tel WHERE [sn] = @sn">
        <DeleteParameters>
            <asp:Parameter Name="sn" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="note" Type="String" />
            <asp:Parameter Name="tel" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="note" Type="String" />
            <asp:Parameter Name="tel" Type="String" />
            <asp:Parameter Name="sn" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:OrderSystemConnectionString %>" DeleteCommand="DELETE FROM [order_list] WHERE [id] = @id" InsertCommand="INSERT INTO order_list(rest_id, chairman, max_cost, max_order) VALUES (@rest_id, @chairman, @max_cost, @max_order)" SelectCommand="SELECT * FROM [order_list]" UpdateCommand="UPDATE order_list SET rest_id = @rest_id, start_time = @start_time, end_time = @end_time, chairman = @chairman WHERE (id = @id)">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="rest_id" Type="Int32" />
                <asp:Parameter Name="chairman" Type="String" />
                <asp:Parameter Name="max_cost" />
                <asp:Parameter Name="max_order" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="rest_id" Type="Int32" />
                <asp:Parameter Name="start_time" Type="DateTime" />
                <asp:Parameter Name="end_time" Type="DateTime" />
                <asp:Parameter Name="chairman" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
</p>
</asp:content>