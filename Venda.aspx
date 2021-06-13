<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Venda.aspx.cs" Inherits="ProjGaragem.Venda" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <form id="form1" runat="server">
        <p>
            VENDA</p>
    <p>
        ID<asp:TextBox ID="c" runat="server"></asp:TextBox>
    </p>
    <p>
        Carro<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Id" DataValueField="Id">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GaragemDBConnectionString2 %>" SelectCommand="SELECT [Id] FROM [TB_CARRO]"></asp:SqlDataSource>
    </p>
    <p>
        Cliente<asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="Id" DataValueField="Id">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:GaragemDBConnectionString3 %>" SelectCommand="SELECT [Id] FROM [TB_CLIENTE]"></asp:SqlDataSource>
    </p>
    <p>
        Funcionario<asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource3" DataTextField="Id" DataValueField="Id">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:GaragemDBConnectionString4 %>" SelectCommand="SELECT [Id] FROM [TB_FUNCIONARIO]"></asp:SqlDataSource>
    </p>
    <p>
        Descricao<asp:TextBox ID="txtDescricao" runat="server" Width="127px"></asp:TextBox>
    </p>
    <p>
        <asp:Button ID="Button1" runat="server" Font-Size="16pt" Height="37px" OnClick="Button1_Click" Text="Cadastrar" Width="207px" />
    </p>
    <asp:GridView ID="GVVenda" runat="server" CellPadding="4" CssClass="table" ForeColor="Black" AutoGenerateColumns="False" OnRowCommand="GVVenda_RowCommand" DataKeyNames="Id" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellSpacing="2">
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
<asp:BoundField DataField="Carro" HeaderText="CARRO" />
<asp:BoundField DataField="Cliente" HeaderText="CLIENTE" />
<asp:BoundField DataField="Funcionario" HeaderText="FUNCIONARIO" />
<asp:BoundField DataField="Descricao" HeaderText="DESCRICAO" />
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
