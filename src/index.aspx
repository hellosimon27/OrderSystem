<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    首頁 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:OrderSystemConnectionString %>" DeleteCommand="DELETE FROM [users] WHERE [fb_id] = @fb_id" InsertCommand="INSERT INTO [users] ([fb_id], [fb_name]) VALUES (@fb_id, @fb_name)" SelectCommand="SELECT * FROM [users] WHERE ([fb_id] = @fb_id)" UpdateCommand="UPDATE [users] SET [fb_name] = @fb_name, [money] = @money WHERE [fb_id] = @fb_id">
        <DeleteParameters>
            <asp:Parameter Name="fb_id" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="fb_id" Type="String" />
            <asp:Parameter Name="fb_name" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter DefaultValue="0" Name="fb_id" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="fb_name" Type="String" />
            <asp:Parameter Name="money" Type="Int32" />
            <asp:Parameter Name="fb_id" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

    
</asp:Content>

