<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="topdruk24_produkcja.ProcesyProdukcyjne.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>$("#Procesy").addClass("active")</script>
    <asp:SqlDataSource ID="SqlDataSource_ProcesyProdukcyjne" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [ProcesProdukcyjny]"></asp:SqlDataSource>
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
    </div>
    <label for="selectEtap" class="col-lg-2 control-label">Dodaj etap</label>
    <div class="col-lg-10">
        <select runat="server" class="form-control" id="selectEtap">
            <option>1</option>
            <option>2</option>
            <option>3</option>
        </select>
        <button runat="server" class="btn btn-primary">Dodaj</button>
    </div>
    <label runat="server" id="labelProcesProdukcyjny" for="TabelaProcesu" class="col-lg-2 control-label">Proces produkcyjny</label>
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
</asp:Content>
