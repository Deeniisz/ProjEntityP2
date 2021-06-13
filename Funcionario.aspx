<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Funcionario.aspx.cs" Inherits="ProjGaragem.Funcionario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <form id="form1" runat="server">
        <p>
            FUNCIONARIO</p>
        <p>
            ID<asp:TextBox ID="txtId" runat="server"></asp:TextBox>
        </p>
        <p>
            Nome<asp:TextBox ID="txtNome" runat="server"></asp:TextBox>
        </p>
        <p>
            Email<asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
        </p>
        <p>
            Telefone<asp:TextBox ID="txtTelefone" runat="server"></asp:TextBox>
        </p>
        <p>
            Endereco<asp:TextBox ID="txtEndereco" runat="server"></asp:TextBox>
        </p>
        <p>
            Salario<asp:TextBox ID="txtSalario" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="btnCadastrar" runat="server" OnClick="btnCadastrar_Click" Text="Cadastrar" />
        </p>
        <p>
            &nbsp;</p>
            <asp:GridView ID="GVFuncionario" runat="server" OnRowCommand="GVFuncionario_RowCommand" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" Width="645px" AutoGenerateColumns="False">
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
                    <asp:BoundField DataField="Nome" HeaderText="NOME" />
                    <asp:BoundField DataField="Email" HeaderText="EMAIL" />
                    <asp:BoundField DataField="Telefone" HeaderText="TELEFONE" />
                    <asp:BoundField DataField="Endereco" HeaderText="ENDERECO" />
                    <asp:BoundField DataField="Salario" HeaderText="SALARIO" />
                    <asp:TemplateField HeaderText="Ações">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnAlterarMidia" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="ALTERAR" CssClass="btn btn btn-info" Text="Alterar" />
                            <asp:LinkButton ID="btnExcluirMidia" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="EXCLUIR" CssClass="btn btn btn-primary" Text="Excluir" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
    </form>
</asp:Content>
