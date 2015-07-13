<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dodaj.aspx.cs" Inherits="topdruk24_produkcja.Klienci.Dodaj" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>$("#Klienci").addClass("active")</script>

    <asp:SqlDataSource ID="SqlDataSource_Zleceniodawcy" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Zleceniodawcy]" DeleteCommand="DELETE FROM [Zleceniodawcy] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Zleceniodawcy] ([Imie], [Nazwisko], [NazwaFirmy], [email], [Telefon], [NIP]) VALUES (@Imie, @Nazwisko, @NazwaFirmy, @email, @Telefon, @NIP)" UpdateCommand="UPDATE [Zleceniodawcy] SET [Imie] = @Imie, [Nazwisko] = @Nazwisko, [NazwaFirmy] = @NazwaFirmy, [email] = @email, [Telefon] = @Telefon, [NIP] = @NIP WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Imie" Type="String" />
            <asp:Parameter Name="Nazwisko" Type="String" />
            <asp:Parameter Name="NazwaFirmy" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="Telefon" Type="String" />
            <asp:Parameter Name="NIP" Type="String" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <div class="form-horizontal">
        <fieldset>
            <legend>Nowy klient</legend>
            <div class="form-group">
                <label for="inputImie" class="col-lg-2 control-label">Imie</label>
                <div class="col-lg-10">
                    <input type="text" class="form-control" id="inputImie" runat="server" placeholder="Imie">
                </div>

                <label for="inputNazwisko" class="col-lg-2 control-label">Nazwisko</label>
                <div class="col-lg-10">
                    <input type="text" class="form-control" id="inputNazwisko" runat="server" placeholder="Nazwisko">
                </div>

                <label for="inputNazwaFirmy" class="col-lg-2 control-label">Nazwa Firmy</label>
                <div class="col-lg-10">
                    <input type="text" class="form-control" id="inputNazwaFirmy" runat="server" placeholder="Nazwa Firmy">
                </div>

                <label for="inputEmail" class="col-lg-2 control-label">E-mail</label>
                <div class="col-lg-10">
                    <input type="email" class="form-control" id="inputEmail" runat="server" placeholder="E-mail">
                </div>

                <label for="inputTelefon" class="col-lg-2 control-label">Numer telefonu</label>
                <div class="col-lg-10">
                    <input type="tel" class="form-control" id="inputTelefon" runat="server" placeholder="Numer telefonu">
                </div>

                <label for="inputNIP" class="col-lg-2 control-label">NIP</label>
                <div class="col-lg-10">
                    <input type="text" class="form-control" id="inputNIP" runat="server" placeholder="NIP">
                    <br>
                    <button runat="server" causesvalidation="False" onserverclick="Cancel_Action" type="reset" class="btn btn-default">Anuluj</button>
                    <button runat="server" causesvalidation="True" onserverclick="Insert_Action" type="submit" class="btn btn-primary">Dodaj</button>
                </div>
            </div>
        </fieldset>
    </div>
</asp:Content>
