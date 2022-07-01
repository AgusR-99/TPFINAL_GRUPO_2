using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Entidades;

namespace Vistas
{
    public partial class ImagenesDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarImagenes();
            }

        }
        protected void CargarImagenes()
        {

            var tablaImagenes = NegocioImagen.ListarImagenes();
            GridViewImages.DataSource = tablaImagenes;
            GridViewImages.DataBind();
            DropDownList ddl = (DropDownList)GridViewImages.FooterRow.FindControl("ddlGVImagesIDJuego");
            ddl.DataSource = NegocioJuego.ListarJuegos();
            ddl.DataTextField = "Nombre";
            ddl.DataValueField = "IDJuego";
            ddl.DataBind();

            AdminDashboardMain masterPage = (AdminDashboardMain)this.Page.Master;
            masterPage.SetUpdatePanelControlVisibility(true);
            masterPage.GetStats();
            masterPage.UpdatePanelUpdate();
        }
        protected void GridViewImages_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DropDownList ddl = (DropDownList)e.Row.FindControl("ddlGVImagesIDJuego");
                if (ddl != null)
                {
                    ddl.DataSource = NegocioJuego.ListarJuegos();
                    ddl.DataTextField = "Nombre";
                    ddl.DataValueField = "IDJuego";
                    ddl.DataBind();
                }
            }

        }

        protected void GridViewImages_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewImages.EditIndex = e.NewEditIndex;
            CargarImagenes();
        }

        protected void GridViewImages_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewImages.EditIndex = -1;
            CargarImagenes();
        }

        protected void GridViewImages_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            var editedRow = GridViewImages.Rows[e.RowIndex];
            Imagenes imagen = new Imagenes(
                    Convert.ToInt32((((DropDownList)editedRow.FindControl("ddlGVImagesIDJuego")).SelectedValue)),
                    ((TextBox)editedRow.FindControl("txtGVImagesNombre")).Text,
                    Convert.ToInt32(((TextBox)editedRow.FindControl("txtGVImagesOrden"))),
                    ((CheckBox)editedRow.FindControl("chkGVImagesActivo")).Checked
                   );
            var erroresActualizar = NegocioImagen.ActualizarImagen(imagen);
            if (erroresActualizar.Any())
            {
                foreach (string msg in erroresActualizar)
                    lblMsg.Text += msg + "<br>";
                lblMsg.Visible = true;
            }
            else
            {
                GridViewImages.EditIndex = -1;
                CargarImagenes();
            }
        }

        protected void BtnInsert_Click(Object sender, EventArgs e)
        {
            Imagenes imagen = new Imagenes(
                Convert.ToInt32(((DropDownList)GridViewImages.FooterRow.FindControl("ddlGVImagesIDJuego")).Text),
                ((TextBox)GridViewImages.FooterRow.FindControl("txtGVImagesNombre")).Text,
                Convert.ToInt32(((TextBox)GridViewImages.FooterRow.FindControl("txtGVImagesOrden"))),
                ((CheckBox)GridViewImages.FooterRow.FindControl("chkGVImagesActivo")).Checked
                );

            var erroresAgregar = NegocioImagen.AgregarImagen(imagen);
            if (erroresAgregar.Any())
            {
                foreach (string msg in erroresAgregar)
                    lblMsg.Text += msg + "<div>";
                lblMsg.Visible = true;
            }
            else
            {
                lblMsg.Text = "Registro agregado con exito";
                lblMsg.Visible = true;
                /*txtSearchCategory.Text = "";*/
                GridViewImages.EditIndex = -1;
                CargarImagenes();
            }
        }

        protected void BtnSearch_Click(Object sender, EventArgs e)
        {
            ///
        }
    }
}


