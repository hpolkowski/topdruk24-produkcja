<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="topdruk24_produkcja.Klienci.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>$("#Klienci").addClass("active")</script>
    <asp:SqlDataSource ID="SqlDataZleceniodawcy" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Zleceniodawcy]"></asp:SqlDataSource>

    <table class="table table-striped table-hover " runat="server" id="tabelaZleceniodawcy">
        <thead>
            <tr>
                <th>Imie i nazwisko</th>
                <th>Firma</th>
                <th>e-mail</th>
                <th>Telefon kontaktowy</th>
                <th>NIP</th>
            </tr>
        </thead>
    </table>
</asp:Content>
