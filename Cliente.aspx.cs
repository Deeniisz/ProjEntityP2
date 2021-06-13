using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjGaragem
{
    public partial class Cliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CarregarDados();
        }

        private void CarregarDados()
        {
            string valor = Request.QueryString["idItem"];
            string idItem = "";
            TB_CLIENTE cliente = new TB_CLIENTE();
            GaragemDBEntities1 context = new GaragemDBEntities1();
            List<TB_CLIENTE> lstCliente = context.TB_CLIENTE.ToList<TB_CLIENTE>();
            GVCliente.DataSource = lstCliente;
            GVCliente.DataBind();

            if (!String.IsNullOrEmpty(valor))
            {
                idItem = valor;
                cliente = context.TB_CLIENTE.First(c => c.Id == idItem);

                txtNome.Text = cliente.Nome;
                txtEmail.Text = cliente.Email;
                txtTelefone.Text = cliente.Telefone;
                txtEndereco.Text = cliente.Endereco;
            }
        }
        protected void GVCliente_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string idItem = e.CommandArgument.ToString();
            GaragemDBEntities1 contextCliente = new GaragemDBEntities1();
            TB_CLIENTE cliente = new TB_CLIENTE();

            cliente = contextCliente.TB_CLIENTE.First(c => c.Id == idItem);

            if (e.CommandName == "ALTERAR")
            {
                Response.Redirect("Cliente.aspx?idItem=" + idItem);
            }
            else if (e.CommandName == "EXCLUIR")
            {
                contextCliente.TB_CLIENTE.Remove(cliente);
                contextCliente.SaveChanges();
                CarregarDados();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String Id = c.Text;
            string Nome= txtNome.Text;
            string Email = txtEmail.Text;
            string Telefone = txtTelefone.Text;
            string Endereco = txtEndereco.Text;
            TB_CLIENTE v = new TB_CLIENTE() {Id = Id, Nome = Nome, Email = Email, Telefone = Telefone, Endereco = Endereco };
            GaragemDBEntities1 context = new GaragemDBEntities1();
            string valor = Request.QueryString["idItem"];
            if (String.IsNullOrEmpty(valor))
            {
                context.TB_CLIENTE.Add(v);
                CarregarDados();
            }
            context.SaveChanges();
        }
    }
}