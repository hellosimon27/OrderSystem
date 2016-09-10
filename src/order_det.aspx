<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="order_det.aspx.cs" Inherits="order_det" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    點餐
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script src="js/JavaScript.js"></script>
    <script>

        function check_money()
        {            
            var c = $("<%#GridView1.ClientID%> tr");

            var sum = 0;

            for (i = 0 ; i < c.length;i++){
                var cost = parseInt(c[i].children[1].innerHTML);
                if (isNaN(cost))
                    continue;
                var amount = parseInt(c[i].children[8].getElementsByTagName("input")[0].value);
                if (isNaN(amount))
                    continue;

                try
                {
                    var r1 = $("#ContentPlaceHolder1_GridView1 tr")[i].children[3].getElementsByTagName("select")[0];
                    var value_r1 = parseInt(r1.options[r1.selectedIndex].innerHTML);
                    if (isNaN(value_r1))
                        value_r1 = 0;
                }
                catch (e)
                {
                    value_r1 = 0;
                }

                try{
                    var r2 = $("#ContentPlaceHolder1_GridView1 tr")[i].children[5].getElementsByTagName("select")[0];
                    var value_r2 = parseInt(r2.options[r2.selectedIndex].innerHTML);
                    if (isNaN(value_r2))
                        value_r2 = 0;
                }
                catch(e)
                {
                    value_r2 = 0;
                }
                try
                {
                    var r3 = $("#ContentPlaceHolder1_GridView1 tr")[i].children[7].getElementsByTagName("select")[0];
                    var value_r3 = parseInt(r3.options[r3.selectedIndex].innerHTML);
                    if (isNaN(value_r3))
                        value_r3 = 0;
                }
                catch (e)
                {
                    value_r3 = 0;
                }

                sum += (cost+value_r1 + value_r2 + value_r3) * amount;               
            }
            
            var total = parseInt( $(".l_money")[0].innerHTML);

            if (total - sum < -10) {
                alert("錢不夠了唷，快點找Simon儲值 !!!");
                return false;
            }
            else
                return true;
            

            
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
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataKeyNames="id" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="None" Width="100%" OnRowDataBound="GridView1_RowDataBound">
        <AlternatingRowStyle CssClass="alterrow" />
        <Columns>
            <asp:TemplateField HeaderText="品項" SortExpression="name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                    <asp:HiddenField ID="item_id" runat="server" Value = '<%# Bind("id") %>' />
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:BoundField DataField="cost" HeaderText="金額" SortExpression="cost" >
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="requirement1" HeaderText="選項">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="選擇">
                <ItemTemplate>
                    <asp:DropDownList ID="requirement1" runat="server">
                    </asp:DropDownList>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:BoundField DataField="requirement2" HeaderText="選項">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="選澤" SortExpression="requirement2">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("requirement2") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="requirement2" runat="server">
                    </asp:DropDownList>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:BoundField DataField="requirement3" HeaderText="選項">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="選澤" SortExpression="requirement3">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("requirement3") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="requirement3" runat="server">
                    </asp:DropDownList>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="數量">
                <ItemTemplate>
                    <asp:TextBox ID="amount" runat="server" CssClass="amount" Width="60px"></asp:TextBox>                    
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="備註" Visible="False">
                <ItemTemplate>
                    <asp:TextBox ID="note" runat="server"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="counts" HeaderText="已點" NullDisplayText="0" SortExpression="counts" />
            <asp:BoundField DataField="h_rate" DataFormatString="{0:P}" HeaderText="歷史購買率" SortExpression="h_rate" />
        </Columns>
        <EditRowStyle CssClass="row" />
        <FooterStyle BackColor="Tan" />
        <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
        <RowStyle CssClass="row" />
        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        <SortedAscendingCellStyle BackColor="#FAFAE7" />
        <SortedAscendingHeaderStyle BackColor="#DAC09E" />
        <SortedDescendingCellStyle BackColor="#E1DB9C" />
        <SortedDescendingHeaderStyle BackColor="#C2A47B" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OrderSystemConnectionString %>" SelectCommand="get_order_det" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="order_id" QueryStringField="order_id" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br>
    <asp:Button ID="Button1" runat="server" Text="送出" OnClick="Button1_Click" OnClientClick="return check_money();" />
    <br>
    <br>
</asp:Content>

