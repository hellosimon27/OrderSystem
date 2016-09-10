<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="dish_edit.aspx.cs" Inherits="dish_edit" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    編輯餐點&nbsp;&nbsp;&nbsp; <a href ="requirement_edit.aspx">編輯選項</a>  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataKeyNames="id" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="None" OnDataBound="GridView1_DataBound" Width="80%" OnLoad="GridView1_Load" ShowFooter="True">
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="送出" />
                </FooterTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="名稱" SortExpression="name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="name" runat="server"></asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="金額" SortExpression="cost">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("cost") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="cost" runat="server"></asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("cost") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="選項A" SortExpression="requirement1">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource3" DataTextField="option_group" DataValueField="option_group" SelectedValue='<%# bind("requirement1") %>'>
                        <asp:ListItem>無</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:DropDownList ID="requirement1" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource3" DataTextField="option_group" DataValueField="option_group">
                        <asp:ListItem>無</asp:ListItem>
                    </asp:DropDownList>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("requirement1") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="選項B" SortExpression="requirement2">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource3" DataTextField="option_group" DataValueField="option_group" SelectedValue='<%# bind("requirement2") %>'>
                        <asp:ListItem>無</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:DropDownList ID="requirement2" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource3" DataTextField="option_group" DataValueField="option_group">
                        <asp:ListItem>無</asp:ListItem>
                    </asp:DropDownList>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("requirement2") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="選項C" SortExpression="requirement3">
                <EditItemTemplate>
                    <asp:DropDownList ID="requirement3" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource3" DataTextField="option_group" DataValueField="option_group" SelectedValue='<%# bind("requirement3") %>'>
                        <asp:ListItem>無</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:DropDownList ID="requirement3" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource3" DataTextField="option_group" DataValueField="option_group">
                        <asp:ListItem>無</asp:ListItem>
                    </asp:DropDownList>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("requirement3") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
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
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OrderSystemConnectionString %>" DeleteCommand="DELETE FROM [dish] WHERE [id] = @id" InsertCommand="INSERT INTO [dish] ([rest], [name], [cost], [requirement1], [requirement2], [requirement3]) VALUES (@rest, @name, @cost, @requirement1, @requirement2, @requirement3)" SelectCommand="SELECT * FROM [dish] WHERE ([rest] = @rest)" UpdateCommand="UPDATE [dish] SET  [name] = @name, [cost] = @cost, [requirement1] = @requirement1, [requirement2] = @requirement2, [requirement3] = @requirement3 WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="rest" Type="Int32" />
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="cost" Type="Int32" />
            <asp:Parameter Name="requirement1" Type="String" />
            <asp:Parameter Name="requirement2" Type="String" />
            <asp:Parameter Name="requirement3" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="rest" QueryStringField="rest_id" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="cost" Type="Int32" />
            <asp:Parameter Name="requirement1" Type="String" />
            <asp:Parameter Name="requirement2" Type="String" />
            <asp:Parameter Name="requirement3" Type="String" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:OrderSystemConnectionString %>" SelectCommand="SELECT DISTINCT [option_group] FROM [requirement]"></asp:SqlDataSource>
</asp:Content>

