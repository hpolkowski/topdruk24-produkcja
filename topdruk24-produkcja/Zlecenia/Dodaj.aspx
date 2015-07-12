<%@ Page Title="Dodaj zlecenie" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dodaj.aspx.cs" Inherits="topdruk24_produkcja.Zlecenia.Dodaj" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>$("#Zlecenia").addClass("active")</script>
    <asp:SqlDataSource ID="SqlDataSource_Zlecenia" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Zlecenia] WHERE [Id] = @original_Id AND (([IdZleceniodawcy] = @original_IdZleceniodawcy) OR ([IdZleceniodawcy] IS NULL AND @original_IdZleceniodawcy IS NULL)) AND (([NumerZlecenia] = @original_NumerZlecenia) OR ([NumerZlecenia] IS NULL AND @original_NumerZlecenia IS NULL)) AND (([Nazwa] = @original_Nazwa) OR ([Nazwa] IS NULL AND @original_Nazwa IS NULL)) AND (([TerminOddania] = @original_TerminOddania) OR ([TerminOddania] IS NULL AND @original_TerminOddania IS NULL)) AND (([Naklad] = @original_Naklad) OR ([Naklad] IS NULL AND @original_Naklad IS NULL)) AND (([Wymiar] = @original_Wymiar) OR ([Wymiar] IS NULL AND @original_Wymiar IS NULL)) AND (([IloscKolorow] = @original_IloscKolorow) OR ([IloscKolorow] IS NULL AND @original_IloscKolorow IS NULL)) AND (([Notatki] = @original_Notatki) OR ([Notatki] IS NULL AND @original_Notatki IS NULL))" InsertCommand="INSERT INTO [Zlecenia] ([IdZleceniodawcy], [NumerZlecenia], [Nazwa], [TerminOddania], [Naklad], [Wymiar], [IloscKolorow], [Notatki]) VALUES (@IdZleceniodawcy, @NumerZlecenia, @Nazwa, @TerminOddania, @Naklad, @Wymiar, @IloscKolorow, @Notatki)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Zlecenia]" UpdateCommand="UPDATE [Zlecenia] SET [IdZleceniodawcy] = @IdZleceniodawcy, [NumerZlecenia] = @NumerZlecenia, [Nazwa] = @Nazwa, [TerminOddania] = @TerminOddania, [Naklad] = @Naklad, [Wymiar] = @Wymiar, [IloscKolorow] = @IloscKolorow, [Notatki] = @Notatki WHERE [Id] = @original_Id AND (([IdZleceniodawcy] = @original_IdZleceniodawcy) OR ([IdZleceniodawcy] IS NULL AND @original_IdZleceniodawcy IS NULL)) AND (([NumerZlecenia] = @original_NumerZlecenia) OR ([NumerZlecenia] IS NULL AND @original_NumerZlecenia IS NULL)) AND (([Nazwa] = @original_Nazwa) OR ([Nazwa] IS NULL AND @original_Nazwa IS NULL)) AND (([TerminOddania] = @original_TerminOddania) OR ([TerminOddania] IS NULL AND @original_TerminOddania IS NULL)) AND (([Naklad] = @original_Naklad) OR ([Naklad] IS NULL AND @original_Naklad IS NULL)) AND (([Wymiar] = @original_Wymiar) OR ([Wymiar] IS NULL AND @original_Wymiar IS NULL)) AND (([IloscKolorow] = @original_IloscKolorow) OR ([IloscKolorow] IS NULL AND @original_IloscKolorow IS NULL)) AND (([Notatki] = @original_Notatki) OR ([Notatki] IS NULL AND @original_Notatki IS NULL))">
        <InsertParameters>
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource_Zleceniodawcy" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id], [Imie], [Nazwisko], [NazwaFirmy] FROM [Zleceniodawcy]"></asp:SqlDataSource>
    <div class="form-horizontal">
        <fieldset>
            <legend>Nowe zlecenie</legend>
            <div class="form-group">
                <label for="select" class="col-lg-2 control-label">Zleceniodawca</label>
                <div class="col-lg-10">
                    <select runat="server" class="form-control" id="selectZleceniodawca">
                    </select>
                </div>

                <label for="inputNumerZlecenia" class="col-lg-2 control-label">Numer zlecenia</label>
                <div class="col-lg-10">
                    <input type="text" class="form-control" id="inputNumerZlecenia" runat="server" placeholder="Numer zlecenia">
                </div>

                <label for="inputNazwa" class="col-lg-2 control-label">Nazwa</label>
                <div class="col-lg-10">
                    <input type="text" class="form-control" id="inputNazwa" runat="server" placeholder="Nazwa">
                </div>

                <label for="inputData" class="col-lg-2 control-label">Termin oddania</label>
                <div class="col-lg-10">
                    <input type="date" class="form-control" id="inputData" runat="server">
                </div>

                <label for="inputNaklad" class="col-lg-2 control-label">Nakład</label>
                <div class="col-lg-10">
                    <input type="number" class="form-control" id="inputNaklad" runat="server">
                </div>

                <label for="inputWymiar" class="col-lg-2 control-label">Wymiar</label>
                <div class="col-lg-10">
                    <input type="text" class="form-control" id="inputWymiar" runat="server" placeholder="Wymiar">
                </div>

                <label for="inputIloscKolorow" class="col-lg-2 control-label">Ilość kolorów</label>
                <div class="col-lg-10">
                    <input type="text" class="form-control" id="inputIloscKolorow" runat="server" placeholder="Ilosc kolorów">
                </div>

                <label for="inputNotatki" class="col-lg-2 control-label">Notatki</label>
                <div class="col-lg-10">
                    <textarea runat="server" class="form-control" rows="6" id="inputNotatki"></textarea>
                    <br>
                    <button runat="server" causesvalidation="False" onserverclick="Cancel_Action" type="reset" class="btn btn-default">Anuluj</button>
                    <button runat="server" causesvalidation="True" onserverclick="Insert_Action" type="submit" class="btn btn-primary">Dodaj</button>
                </div>
            </div>
        </fieldset>
    </div>

</asp:Content>
