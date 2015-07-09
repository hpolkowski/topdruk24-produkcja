<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dodaj.aspx.cs" Inherits="topdruk24_produkcja.Zlecenia.Dodaj" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>$("#Zlecenia").addClass("active")</script>
    <asp:SqlDataSource ID="SQLDataZlecenia" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Zlecenia]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Zlecenia] WHERE [Id] = @original_Id AND (([IdZleceniodawcy] = @original_IdZleceniodawcy) OR ([IdZleceniodawcy] IS NULL AND @original_IdZleceniodawcy IS NULL)) AND (([NumerZlecenia] = @original_NumerZlecenia) OR ([NumerZlecenia] IS NULL AND @original_NumerZlecenia IS NULL)) AND (([Nazwa] = @original_Nazwa) OR ([Nazwa] IS NULL AND @original_Nazwa IS NULL)) AND (([TerminOddania] = @original_TerminOddania) OR ([TerminOddania] IS NULL AND @original_TerminOddania IS NULL)) AND (([Naklad] = @original_Naklad) OR ([Naklad] IS NULL AND @original_Naklad IS NULL)) AND (([Wymiar] = @original_Wymiar) OR ([Wymiar] IS NULL AND @original_Wymiar IS NULL)) AND (([IloscKolorow] = @original_IloscKolorow) OR ([IloscKolorow] IS NULL AND @original_IloscKolorow IS NULL)) AND (([Notatki] = @original_Notatki) OR ([Notatki] IS NULL AND @original_Notatki IS NULL))" InsertCommand="INSERT INTO [Zlecenia] ([Id], [IdZleceniodawcy], [NumerZlecenia], [Nazwa], [TerminOddania], [Naklad], [Wymiar], [IloscKolorow], [Notatki]) VALUES (@Id, @IdZleceniodawcy, @NumerZlecenia, @Nazwa, @TerminOddania, @Naklad, @Wymiar, @IloscKolorow, @Notatki)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Zlecenia] SET [IdZleceniodawcy] = @IdZleceniodawcy, [NumerZlecenia] = @NumerZlecenia, [Nazwa] = @Nazwa, [TerminOddania] = @TerminOddania, [Naklad] = @Naklad, [Wymiar] = @Wymiar, [IloscKolorow] = @IloscKolorow, [Notatki] = @Notatki WHERE [Id] = @original_Id AND (([IdZleceniodawcy] = @original_IdZleceniodawcy) OR ([IdZleceniodawcy] IS NULL AND @original_IdZleceniodawcy IS NULL)) AND (([NumerZlecenia] = @original_NumerZlecenia) OR ([NumerZlecenia] IS NULL AND @original_NumerZlecenia IS NULL)) AND (([Nazwa] = @original_Nazwa) OR ([Nazwa] IS NULL AND @original_Nazwa IS NULL)) AND (([TerminOddania] = @original_TerminOddania) OR ([TerminOddania] IS NULL AND @original_TerminOddania IS NULL)) AND (([Naklad] = @original_Naklad) OR ([Naklad] IS NULL AND @original_Naklad IS NULL)) AND (([Wymiar] = @original_Wymiar) OR ([Wymiar] IS NULL AND @original_Wymiar IS NULL)) AND (([IloscKolorow] = @original_IloscKolorow) OR ([IloscKolorow] IS NULL AND @original_IloscKolorow IS NULL)) AND (([Notatki] = @original_Notatki) OR ([Notatki] IS NULL AND @original_Notatki IS NULL))">
        <InsertParameters>
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="IdZleceniodawcy" Type="Int32" />
            <asp:Parameter Name="NumerZlecenia" Type="String" />
            <asp:Parameter Name="Nazwa" Type="String" />
            <asp:Parameter DbType="Date" Name="TerminOddania" />
            <asp:Parameter Name="Naklad" Type="Int32" />
            <asp:Parameter Name="Wymiar" Type="String" />
            <asp:Parameter Name="IloscKolorow" Type="String" />
            <asp:Parameter Name="Notatki" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:FormView ID="FormView1" DefaultMode="Insert" runat="server" DataKeyNames="Id" DataSourceID="SQLDataZlecenia">
        <InsertItemTemplate>
            Id:
            <asp:TextBox ID="IdTextBox" runat="server" Text='<%# Bind("Id") %>' />
            <br />
            IdZleceniodawcy:
            <asp:TextBox ID="IdZleceniodawcyTextBox" runat="server" Text='<%# Bind("IdZleceniodawcy") %>' />
            <br />
            NumerZlecenia:
            <asp:TextBox ID="NumerZleceniaTextBox" runat="server" Text='<%# Bind("NumerZlecenia") %>' />
            <br />
            Nazwa:
            <asp:TextBox ID="NazwaTextBox" runat="server" Text='<%# Bind("Nazwa") %>' />
            <br />
            TerminOddania:
            <asp:TextBox ID="TerminOddaniaTextBox" runat="server" Text='<%# Bind("TerminOddania") %>' />
            <br />
            Naklad:
            <asp:TextBox ID="NakladTextBox" runat="server" Text='<%# Bind("Naklad") %>' />
            <br />
            Wymiar:
            <asp:TextBox ID="WymiarTextBox" runat="server" Text='<%# Bind("Wymiar") %>' />
            <br />
            IloscKolorow:
            <asp:TextBox ID="IloscKolorowTextBox" runat="server" Text='<%# Bind("IloscKolorow") %>' />
            <br />
            Notatki:
            <asp:TextBox ID="NotatkiTextBox" runat="server" Text='<%# Bind("Notatki") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            <button runat="server" CausesValidation="False" CommandName="Cancel" type="reset" class="btn btn-default">Anuluj</button>
            <button runat="server" CausesValidation="True" CommandName="Insert" type="submit" class="btn btn-primary">Dodaj</button>
        </InsertItemTemplate>
    </asp:FormView>
</asp:Content>
