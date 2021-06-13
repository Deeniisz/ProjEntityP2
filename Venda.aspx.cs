using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjGaragem
{
    public partial class Venda : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CarregarDados();
        }

        private void CarregarDados()
        {
            string valor = Request.QueryString["idItem"];
            string idItem = "";
            TB_Venda venda = new TB_Venda();
            GaragemDBEntities1 context = new GaragemDBEntities1();
            List<TB_Venda> lstCliente = context.TB_Venda.ToList<TB_Venda>();
            GVVenda.DataSource = lstCliente;
            GVVenda.DataBind();

            if (!String.IsNullOrEmpty(valor))
            {
                idItem = valor;
                venda = context.TB_Venda.First(c => c.Id == idItem);

                DropDownList1.SelectedValue = venda.Carro;
                DropDownList2.SelectedValue = venda.Cliente;
                DropDownList3.SelectedValue = venda.Funcionario;
                txtDescricao.Text = venda.Descricao;
            }
        }
        protected void GVVenda_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string idItem = e.CommandArgument.ToString();
            GaragemDBEntities1 contextVenda = new GaragemDBEntities1();
            TB_Venda venda = new TB_Venda();

            venda = contextVenda.TB_Venda.First(c => c.Id == idItem);

            if (e.CommandName == "ALTERAR")
            {
                Response.Redirect("Venda.aspx?idItem=" + idItem);
            }
            else if (e.CommandName == "EXCLUIR")
            {
                contextVenda.TB_Venda.Remove(venda);
                contextVenda.SaveChanges();
                CarregarDados();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String Id = c.Text;
            string Carro = DropDownList1.SelectedValue;
            string Cliente = DropDownList2.SelectedValue;
            string Funcionario = DropDownList3.SelectedValue;
            string Descricao = txtDescricao.Text;
            TB_Venda v = new TB_Venda() { Id = Id, Carro = Carro, Cliente = Cliente, Funcionario = Funcionario, Descricao = Descricao };
            GaragemDBEntities1 context = new GaragemDBEntities1();
            string valor = Request.QueryString["idItem"];
            if (String.IsNullOrEmpty(valor))
            {
                context.TB_Venda.Add(v);
            }
            context.SaveChanges();
        }
    }
}
