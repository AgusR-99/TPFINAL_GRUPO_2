using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Negocio;
using Entidades;

namespace Vistas
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        public bool LoggedIn { get; private set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            LoggedIn = NegocioUsuario.IsLoggedIn(Session);
            if (!IsPostBack)
            {
                CargarArticulo();
            }
        }
        protected void CargarArticulo()
        {
            string id = Request.QueryString["id"];
            CargarDatosJuego(id);
        }
        private void CargarDatosJuego(string id)
        {
            var list = NegocioJuego.ObtenerJuegosComoLista();
            // Seleccionar el item donde coincida su ID con la ID pasada por query
            foreach (var item in from item in list
                                 where item.getID().ToString() == id
                                 select new { item })
            {
                // Cargar nombre en label
                lblNombreJuego.Text = item.item.getNombre();
                lblNombreJuegoOpinion.Text = item.item.getNombre();

                // Predeterminar DOM, suponiendo que se puede agregar una opinion
                lblHeadingOpinion.Text = "Escriba una opinion para el juego ";

                // Cargar cantidad de opiniones y promedio calificacion
                var Opiniones = item.item.GetOpiniones();
                float sum = 0;
                DataTable dt = new DataTable();
                AgregarColumnas(dt);
                int cantidadPositivas = 0, cantidadVariadas = 0, cantidadNegativas = 0;
                Session["IsUpdate"] = false;
                CargarValoresRatings();
                foreach (var opinion in Opiniones)
                {
                    var calificacion = opinion.getCalificacion();
                    sum += calificacion;
                    if (calificacion >= 4) cantidadPositivas++;
                    else if (calificacion == 3) cantidadVariadas++;
                    else cantidadNegativas++;
                    // Cargar opiniones
                    var username = opinion.getUsername();
                    var comentario = opinion.getComentario();
                    dt.Rows.Add(calificacion, username, comentario);
                    // Si el usuario obtenido es el mismo que el usuario logueado, modificar DOM para mostrar un UPDATE
                    // de opinion en vez de AGREGAR una opinion
                    try
                    {
                        if (username == ((Usuario)Session["LoggedUser"]).getUsername())
                        {
                            lblHeadingOpinion.Text = "Modificar opinion para el juego ";
                            txtUserReview.Text = comentario.ToString();
                            ddlUserRating.SelectedIndex = calificacion - 1;
                            ddlUserRating.DataBind();
                            Session["IsUpdate"] = true;
                        }
                    }
                    catch (Exception){}
                }
                float opinionesCantidad = Opiniones.Count();
                float prom = sum / opinionesCantidad;
                prom = (float)Math.Round(prom, 1);
                if (double.IsNaN(prom))
                {
                    lblRatingJuego.Text = "NR";
                }
                else lblRatingJuego.Text = prom.ToString();
                lblOpinionesPrefix.Text = "Basado en ";
                lblOpinionesCantidad.Text = opinionesCantidad.ToString() + " criticas";
                
                var value = Convert.ToDouble(prom);
                string rating = "";
                for (int i = 1; i <= 5; i++) if (value >= i && value <= i + 1) rating = $"bg-rating-{i}";
                lblRatingJuego.Attributes.Add("class", $"articulo-score-left {rating}");
                lblReviewPositivas.Text = cantidadPositivas.ToString();
                lblReviewVariadas.Text = cantidadVariadas.ToString();
                lblReviewNegativas.Text = cantidadNegativas.ToString();
                
                repReviews.DataSource = dt;
                repReviews.DataBind();

                // Cargar desarrollador en label
                var dev = item.item.GetDesarrollador();
                lblDesarrollador.Text = dev.getNombre();

                // Cargar fecha de lanzamiento en label
                try
                {
                    DateTime fecha = (DateTime)item.item.getFecha();
                    lblFechaLanzamiento.Text = fecha.ToShortDateString();
                }
                catch (Exception)
                {
                    lblFechaLanzamiento.Text = "Desconocida";
                }

                // Cargar lista de categorias en label
                var listaCategoria = item.item.GetCategorias();
                CargarListaEnLabel(listaCategoria, lblCategoria);

                // Cargar lista de plataformas en label
                var listaPlataforma = item.item.GetPlataformas();
                CargarListaEnLabel(listaPlataforma, lblPlataforma);

                // Cargar SitioWeb en label
                linkSitioWeb.NavigateUrl = linkSitioWeb.Text = dev.getURL_web();

                // Cargar precio
                var precio = item.item.getPrecio();
                if (precio == null) lblPrecio.Text = "Desconocido";
                else lblPrecio.Text = "$" + precio.ToString();

                var Tiendas = item.item.GetJuegosXTiendas();

                foreach (var tienda in Tiendas)
                {
                    listTiendas.Items.Add(new ListItem(ObtenerNombreTienda(
                        tienda.getID_Tienda(), item.item.GetTiendas()),
                        tienda.getURL()));
                }
                if (Tiendas.Count() == 0) { 
                    listTiendas.Items.Add(new ListItem("Sin datos"));
                    listTiendas.DisplayMode = 0;
                }
                // Cargar descripcion del juego
                lblDescripcion.Text = item.item.getDescripcion();
            }
        }

        private static void AgregarColumnas(DataTable dt)
        {
            dt.Columns.Add("Calificacion", typeof(string));
            dt.Columns.Add("Username", typeof(string));
            dt.Columns.Add("Comentario", typeof(string));
        }

        private void CargarListaEnLabel<T>(List<T> list, Label label)
        {
            if(list.Count == 0) label.Text = "Desconocido";
            else
            {
                var last = list.Last();
                foreach(object item in list)
                {
                    if (item.Equals(last)) label.Text += item.ToString();
                    else
                    {
                        label.Text += item.ToString();
                        label.Text += ", ";
                    }
                }
            }
        }


        protected void btnSend_Click(object sender, EventArgs e)
        {
            int id;
            try
            {
                id = Convert.ToInt32(Request.QueryString["id"]);
            }
            catch (Exception)
            {
                lblMsg.Text = "Error: ID de articulo en formato invalido";
                return;
            }
            // Llenar el obj opinion con ID de articulo, puntuaje elegido por el usuario y su opinion escrita
            Opinion opinion = new Opinion(
                id,
                ((Usuario)Session["LoggedUser"]).getUsername(),
                Convert.ToByte(ddlUserRating.Text),
                txtUserReview.Text,
                true
            );

            //Verificar si la accion es create o update
            string estado;
            if (Session["IsUpdate"].Equals(true))
            {
                estado = NegocioOpinion.ActualizarOpinion(opinion);
            }
            else estado = NegocioOpinion.AgregarOpinion(opinion);

            // Si no hay errores, hacer postback
            lblMsg.Text = estado;
            if (!estado.Contains("Error"))
            {
                Response.Redirect($"Articulo.aspx?id={id}");
            }
        }

        // Controlar colores de calificaciones
        protected void repReviews_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var calificacion = (Label)e.Item.FindControl("lblCalificacion");
                var value = Convert.ToInt32(calificacion.Text);
                string rating = "bg-rating-";
                for (int i = 1; i <= 5; i++) if (value == i) rating += i.ToString();
                calificacion.Attributes.Add("class", $"articulo-rating {rating}");
            }
        }

        private string ObtenerNombreTienda(int id, List<Tienda> Tiendas)
        {
            foreach (var tienda in Tiendas)
            {
                if (id == tienda.getID_Tienda()) return tienda.getNombre();
            }
            return null;
        }
        // Cargar ratings del 1 al 5 en dropdownlist
        private void CargarValoresRatings()
        {
            for (int i = 1; i <= 5; i++)
            {
                ddlUserRating.Items.Add(new ListItem($"{i}", $"{i}"));
            }
        }
    }
}