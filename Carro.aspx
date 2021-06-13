<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Carro.aspx.cs" Inherits="ProjGaragem.Carro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <form id="form1" runat="server">
        <p>
            CARRO</p>
    <p>
        ID<asp:TextBox ID="c" runat="server"></asp:TextBox>
    </p>
    <p>
        MARCA<asp:TextBox ID="txtMarca" runat="server" style="height: 22px"></asp:TextBox>
    </p>
    <p>
        MODELO<asp:TextBox ID="txtModelo" runat="server"></asp:TextBox>
    </p>
    <p>
        ANO<asp:TextBox ID="txtAno" runat="server"></asp:TextBox>
    </p>
    <p>
        RENAVAM<asp:TextBox ID="txtRenavam" runat="server" Width="127px"></asp:TextBox>
    </p>
    <p>
        <asp:Button ID="btnSalvar" runat="server" Font-Size="16pt" Height="37px" OnClick="Button1_Click" Text="Cadastrar" Width="207px" />
    </p>
    <asp:GridView ID="GVCarro" runat="server" CellPadding="4" CssClass="table" ForeColor="Black" AutoGenerateColumns="False" OnRowCommand="GVCarro_RowCommand" DataKeyNames="Id" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellSpacing="2">
<FooterStyle BackColor="#CCCCCC" />
<HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
<PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
<RowStyle BackColor="White" />
<SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
<SortedAscendingCellStyle BackColor="#F1F1F1" />
<SortedAscendingHeaderStyle BackColor="#808080" />
<SortedDescendingCellStyle BackColor="#CAC9C9" />
<SortedDescendingHeaderStyle BackColor="#383838" />
<Columns>
<asp:BoundField DataField="Id" HeaderText="ID" />
<asp:BoundField DataField="Marca" HeaderText="MARCA" />
<asp:BoundField DataField="Modelo" HeaderText="MODELO" />
<asp:BoundField DataField="Ano" HeaderText="ANO" />
<asp:BoundField DataField="Renavam" HeaderText="RENAVAM" />
<asp:TemplateField HeaderText="Ações">
<ItemTemplate>
<asp:LinkButton runat="server" ID="btnAlterarMidia" CommandName="ALTERAR"
CommandArgument='<%# Eval("Id") %>' CssClass="btn btn btn-info" Text="Alterar" />
<asp:LinkButton runat="server" ID="btnExcluirMidia" CommandName="EXCLUIR"
CommandArgument='<%# Eval("Id") %>' CssClass="btn btn btn-primary" Text="Excluir" />
</ItemTemplate>
</asp:TemplateField>
</Columns>
</asp:GridView>

    </form>
</asp:Content>
