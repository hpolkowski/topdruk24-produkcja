<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DodajEtap.aspx.cs" Inherits="topdruk24_produkcja.ProcesyProdukcyjne.DodajEtap" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="SqlDataSource_Etapy" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [ProcesProdukcyjny_Etap]" DeleteCommand="DELETE FROM [ProcesProdukcyjny_Etap] WHERE [Id] = @Id" InsertCommand="INSERT INTO [ProcesProdukcyjny_Etap] ([Nazwa], [Opis]) VALUES (@Nazwa, @Opis)" UpdateCommand="UPDATE [ProcesProdukcyjny_Etap] SET [Nazwa] = @Nazwa, [Opis] = @Opis WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Nazwa" Type="String" />
            <asp:Parameter Name="Opis" Type="String" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <div class="form-horizontal">
        <fieldset>
            <legend>Nowy Etap</legend>
            <div class="form-group">
                <label for="inputNazwa" class="col-lg-2 control-label">Nazwa</label>
                <div class="col-lg-10">
                    <input type="text" class="form-control" id="inputNazwa" runat="server" placeholder="Nazwa">
                </div>
                <label for="inputOpis" class="col-lg-2 control-label">Opis działania</label>
                <div class="col-lg-10">
                    <textarea runat="server" class="form-control" rows="6" id="inputOpis"></textarea>
                    <br>
                    <button runat="server" causesvalidation="False" onserverclick="Cancel_Action" type="reset" class="btn btn-default">Anuluj</button>
                    <button runat="server" causesvalidation="True" onserverclick="Insert_Action" type="submit" class="btn btn-primary">Dodaj</button>
                </div>
            </div>
        </fieldset>
    </div>
</asp:Content>
