<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="topdruk24_produkcja.Zlecenia.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>$("#Zlecenia").addClass("active")</script>
    <asp:SqlDataSource ID="SQLDataZlecenia" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Zlecenia]"></asp:SqlDataSource>
    <asp:FormView ID="FormView1" DefaultMode="ReadOnly" runat="server" AllowPaging="True" DataKeyNames="Id" DataSourceID="SQLDataZlecenia">
        <ItemTemplate>
            Id:
            <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
            <br />
            IdZleceniodawcy:
            <asp:Label ID="IdZleceniodawcyLabel" runat="server" Text='<%# Bind("IdZleceniodawcy") %>' />
            <br />
            NumerZlecenia:
            <asp:Label ID="NumerZleceniaLabel" runat="server" Text='<%# Bind("NumerZlecenia") %>' />
            <br />
            Nazwa:
            <asp:Label ID="NazwaLabel" runat="server" Text='<%# Bind("Nazwa") %>' />
            <br />
            TerminOddania:
            <asp:Label ID="TerminOddaniaLabel" runat="server" Text='<%# Bind("TerminOddania", "{0:d}") %>' />
            <br />
            Naklad:
            <asp:Label ID="NakladLabel" runat="server" Text='<%# Bind("Naklad") %>' />
            <br />
            Wymiar:
            <asp:Label ID="WymiarLabel" runat="server" Text='<%# Bind("Wymiar") %>' />
            <br />
            IloscKolorow:
            <asp:Label ID="IloscKolorowLabel" runat="server" Text='<%# Bind("IloscKolorow") %>' />
            <br />
            Notatki:
            <asp:Label ID="NotatkiLabel" runat="server" Text='<%# Bind("Notatki") %>' />
            <br />
        </ItemTemplate>
</asp:FormView>

</asp:Content>
