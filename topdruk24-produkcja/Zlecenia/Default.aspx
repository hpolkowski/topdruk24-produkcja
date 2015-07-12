<%@ Page Title="Zlecenia" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="topdruk24_produkcja.Zlecenia.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>$("#Zlecenia").addClass("active")</script>
    <asp:SqlDataSource ID="SQLDataZlecenia" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Zlecenia]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataZleceniodawcy" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Zleceniodawcy]"></asp:SqlDataSource>

    <table class="table table-striped table-hover " runat="server" id="tabelaZlecenia">
        <thead>
            <tr>
                <th>Zleceniodawca</th>
                <th>Numer zlecenia</th>
                <th>Nazwa zlecenia</th>
                <th>Data Realizacji</th>
                <th>Format</th>
                <th>Kolor</th>
                <th>Notatki</th>
            </tr>
        </thead>
    </table>
</asp:Content>
