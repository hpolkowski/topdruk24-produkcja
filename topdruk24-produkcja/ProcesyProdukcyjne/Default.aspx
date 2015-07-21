<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="topdruk24_produkcja.ProcesyProdukcyjne.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>$("#Procesy").addClass("active")</script>
    <asp:SqlDataSource ID="SqlDataSource_ProcesyProdukcyjne" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [ProcesProdukcyjny]" DeleteCommand="DELETE FROM [ProcesProdukcyjny] WHERE [Id] = @original_Id" InsertCommand="INSERT INTO [ProcesProdukcyjny] ([Nazwa], [Opis], [Etap1], [Etap2], [Etap3], [Etap4], [Etap5], [Etap6], [Etap7], [Etap8], [Etap9], [Etap10], [Etap11], [Etap12], [Etap13], [Etap14], [Etap15], [Etap16], [Etap17], [Etap18], [Etap19], [Etap20]) VALUES (@Nazwa, @Opis, @Etap1, @Etap2, @Etap3, @Etap4, @Etap5, @Etap6, @Etap7, @Etap8, @Etap9, @Etap10, @Etap11, @Etap12, @Etap13, @Etap14, @Etap15, @Etap16, @Etap17, @Etap18, @Etap19, @Etap20)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [ProcesProdukcyjny] SET [Nazwa] = @Nazwa, [Opis] = @Opis, [Etap1] = @Etap1, [Etap2] = @Etap2, [Etap3] = @Etap3, [Etap4] = @Etap4, [Etap5] = @Etap5, [Etap6] = @Etap6, [Etap7] = @Etap7, [Etap8] = @Etap8, [Etap9] = @Etap9, [Etap10] = @Etap10, [Etap11] = @Etap11, [Etap12] = @Etap12, [Etap13] = @Etap13, [Etap14] = @Etap14, [Etap15] = @Etap15, [Etap16] = @Etap16, [Etap17] = @Etap17, [Etap18] = @Etap18, [Etap19] = @Etap19, [Etap20] = @Etap20 WHERE [Id] = @original_Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Nazwa" Type="String" />
            <asp:Parameter Name="Opis" Type="String" />
            <asp:Parameter Name="Etap1" Type="Int32" />
            <asp:Parameter Name="Etap2" Type="Int32" />
            <asp:Parameter Name="Etap3" Type="Int32" />
            <asp:Parameter Name="Etap4" Type="Int32" />
            <asp:Parameter Name="Etap5" Type="Int32" />
            <asp:Parameter Name="Etap6" Type="Int32" />
            <asp:Parameter Name="Etap7" Type="Int32" />
            <asp:Parameter Name="Etap8" Type="Int32" />
            <asp:Parameter Name="Etap9" Type="Int32" />
            <asp:Parameter Name="Etap10" Type="Int32" />
            <asp:Parameter Name="Etap11" Type="Int32" />
            <asp:Parameter Name="Etap12" Type="Int32" />
            <asp:Parameter Name="Etap13" Type="Int32" />
            <asp:Parameter Name="Etap14" Type="Int32" />
            <asp:Parameter Name="Etap15" Type="Int32" />
            <asp:Parameter Name="Etap16" Type="Int32" />
            <asp:Parameter Name="Etap17" Type="Int32" />
            <asp:Parameter Name="Etap18" Type="Int32" />
            <asp:Parameter Name="Etap19" Type="Int32" />
            <asp:Parameter Name="Etap20" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Etap1" Type="Int32" />
            <asp:Parameter Name="Etap2" Type="Int32" />
            <asp:Parameter Name="Etap3" Type="Int32" />
            <asp:Parameter Name="Etap4" Type="Int32" />
            <asp:Parameter Name="Etap5" Type="Int32" />
            <asp:Parameter Name="Etap6" Type="Int32" />
            <asp:Parameter Name="Etap7" Type="Int32" />
            <asp:Parameter Name="Etap8" Type="Int32" />
            <asp:Parameter Name="Etap9" Type="Int32" />
            <asp:Parameter Name="Etap10" Type="Int32" />
            <asp:Parameter Name="Etap11" Type="Int32" />
            <asp:Parameter Name="Etap12" Type="Int32" />
            <asp:Parameter Name="Etap13" Type="Int32" />
            <asp:Parameter Name="Etap14" Type="Int32" />
            <asp:Parameter Name="Etap15" Type="Int32" />
            <asp:Parameter Name="Etap16" Type="Int32" />
            <asp:Parameter Name="Etap17" Type="Int32" />
            <asp:Parameter Name="Etap18" Type="Int32" />
            <asp:Parameter Name="Etap19" Type="Int32" />
            <asp:Parameter Name="Etap20" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource_Etapy" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [ProcesProdukcyjny_Etap]"></asp:SqlDataSource>
    <%--
        Dodawanie kolumny
        ALTER TABLE [dbo].[ProcesProdukcyjny]
    ADD [<Nazwa>] NCHAR (10) NULL;
    --%>
    <label for="selectProces" class="col-lg-2 control-label">Wybierz proces</label>
    <div class="col-lg-10">
        <select runat="server" class="form-control" id="selectProces">
            <option>1</option>
            <option>2</option>
            <option>3</option>
        </select>
        <button runat="server" onserverclick="Proces_Changed" class="btn btn-primary">Wybierz</button>
        <input type="button" class="btn btn-primary" value="Nowy" onclick="window.location.href = 'Dodaj'">
    </div>
    <div runat="server" id="labelProcesProdukcyjny">
        <label for="selectEtap" class="col-lg-2 control-label">Dodaj etap</label>
        <div class="col-lg-10">
            <select runat="server" class="form-control" id="selectEtap">
                <option>1</option>
                <option>2</option>
                <option>3</option>
            </select>
            <button runat="server" onserverclick="Dodaj_Etap" class="btn btn-primary">Dodaj</button>
            <input type="button" class="btn btn-primary" value="Nowy" onclick="window.location.href = 'DodajEtap'">
            <div style="display: none">
                <button runat="server" onserverclick="Usun_Etap" id="Etap1">UsunEtap</button>
                <button runat="server" onserverclick="Usun_Etap" id="Etap2">UsunEtap</button>
                <button runat="server" onserverclick="Usun_Etap" id="Etap3">UsunEtap</button>
                <button runat="server" onserverclick="Usun_Etap" id="Etap4">UsunEtap</button>
                <button runat="server" onserverclick="Usun_Etap" id="Etap5">UsunEtap</button>
                <button runat="server" onserverclick="Usun_Etap" id="Etap6">UsunEtap</button>
                <button runat="server" onserverclick="Usun_Etap" id="Etap7">UsunEtap</button>
                <button runat="server" onserverclick="Usun_Etap" id="Etap8">UsunEtap</button>
                <button runat="server" onserverclick="Usun_Etap" id="Etap9">UsunEtap</button>
                <button runat="server" onserverclick="Usun_Etap" id="Etap10">UsunEtap</button>
                <button runat="server" onserverclick="Usun_Etap" id="Etap11">UsunEtap</button>
                <button runat="server" onserverclick="Usun_Etap" id="Etap12">UsunEtap</button>
                <button runat="server" onserverclick="Usun_Etap" id="Etap13">UsunEtap</button>
                <button runat="server" onserverclick="Usun_Etap" id="Etap14">UsunEtap</button>
                <button runat="server" onserverclick="Usun_Etap" id="Etap15">UsunEtap</button>
                <button runat="server" onserverclick="Usun_Etap" id="Etap16">UsunEtap</button>
                <button runat="server" onserverclick="Usun_Etap" id="Etap17">UsunEtap</button>
                <button runat="server" onserverclick="Usun_Etap" id="Etap18">UsunEtap</button>
                <button runat="server" onserverclick="Usun_Etap" id="Etap19">UsunEtap</button>
                <button runat="server" onserverclick="Usun_Etap" id="Etap20">UsunEtap</button>
            </div>
        </div>
        <label runat="server" for="TabelaProcesu" class="col-lg-2 control-label">Proces produkcyjny</label>
        <div class="col-lg-10">
            <div class="list-group">
                <%--
        <a href="#" class="list-group-item">
            <h4 class="list-group-item-heading">Nazwa etapu</h4>
            <input type="button" value="↓" style="float: right" />
            <input type="button" value="↑" style="float: right" />
            <p class="list-group-item-text">
                Opis czynności wykonywanych w tym etapie.
            </p>
            
        </a>
        <a href="#" class="list-group-item">
            <h4 class="list-group-item-heading">Nazwa etapu</h4>
            <input type="button" value="↓" style="float: right" />
            <input type="button" value="↑" style="float: right" />
            <p class="list-group-item-text">
                Opis czynności wykonywanych w tym etapie.
            </p>
        </a>
                --%>
                <table runat="server" id="TabelaProcesu">
                    <%--
                <tr>
                    <td>
                        <div class="list-group-item">
                            <h4 class="list-group-item-heading">Nazwa etapu</h4>
                            <input type="button" value="↓" style="float: right" />
                            <input type="button" value="↑" style="float: right" />
                            <p class="list-group-item-text">
                                Opis czynności wykonywanych w tym etapie.
                            </p>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="list-group-item">
                            <h4 class="list-group-item-heading">Nazwa etapu</h4>
                            <input type="button" value="↓" style="float: right" />
                            <input type="button" value="↑" style="float: right" />
                            <p class="list-group-item-text">
                                Opis czynności wykonywanych w tym etapie.
                            </p>
                        </div>
                    </td>
                </tr>
                    --%>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
