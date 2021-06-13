using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjGaragem
{
    public partial class Funcionario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CarregarDados();
        }

        private void CarregarDados()
        {
            string valor = Request.QueryString["idItem"];
            string idItem = "";
            TB_FUNCIONARIO cliente = new TB_FUNCIONARIO();
            GaragemDBEntities1 context = new GaragemDBEntities1();
            List<TB_FUNCIONARIO> lstFuncionario = context.TB_FUNCIONARIO.ToList<TB_FUNCIONARIO>();
            GVFuncionario.DataSource = lstFuncionario;
            GVFuncionario.DataBind();

            if (!String.IsNullOrEmpty(valor))
            {
                idItem = valor;
                cliente = context.TB_FUNCIONARIO.First(c => c.Id == idItem);

                txtNome.Text = cliente.Nome;
                txtEmail.Text = cliente.Email;
                txtTelefone.Text = cliente.Telefone;
                txtEndereco.Text = cliente.Endereco;
                txtSalario.Text = cliente.Salario;
            }
        }
        protected void GVFuncionario_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string idItem = e.CommandArgument.ToString();
            GaragemDBEntities1 contextFuncionario = new GaragemDBEntities1();
            TB_FUNCIONARIO funcionario = new TB_FUNCIONARIO();

            funcionario = contextFuncionario.TB_FUNCIONARIO.First(c => c.Id == idItem);

            if (e.CommandName == "ALTERAR")
            {
                Response.Redirect("Funcionario.aspx?idItem=" + idItem);
            }
            else if (e.CommandName == "EXCLUIR")
            {
                contextFuncionario.TB_FUNCIONARIO.Remove(funcionario);
                contextFuncionario.SaveChanges();
                CarregarDados();
            }
        }
        protected void btnCadastrar_Click(object sender, EventArgs e)
        {
            string Id = txtId.Text;
            string Nome = txtNome.Text;
            string Email = txtEmail.Text;
            string Telefone = txtTelefone.Text;
            string Endereco = txtEndereco.Text;
            string Salario = txtSalario.Text;
            TB_FUNCIONARIO v = new TB_FUNCIONARIO() { Id = Id, Nome = Nome, Email = Email, Telefone = Telefone, Endereco = Endereco, Salario = Salario };
            GaragemDBEntities1 context = new GaragemDBEntities1();
            string valor = Request.QueryString["idItem"];
            if (String.IsNullOrEmpty(valor))
            {
                context.TB_FUNCIONARIO.Add(v);
                CarregarDados();
            }
            else
            {
                string id = valor;
                TB_FUNCIONARIO funcionario = context.TB_FUNCIONARIO.First(c => c.Id == id);
                funcionario.Nome = v.Nome = txtNome.ToString();
                funcionario.Email = v.Email;
                funcionario.Telefone = v.Telefone;
                funcionario.Endereco = v.Endereco;
                funcionario.Salario = v.Salario;
            }
            context.SaveChanges();
            CarregarDados();
        }
    }
}
