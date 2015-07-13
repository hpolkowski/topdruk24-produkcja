using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace topdruk24_produkcja.Klienci
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //tabelaZlecenia.Rows.Clear();
            DataView view = (DataView)SqlDataZleceniodawcy.Select(DataSourceSelectArguments.Empty);
            DataTable table = view.ToTable();
            DataSet ds = new DataSet();
            ds.Tables.Add(table);
            foreach (DataRow row in ds.Tables[0].Rows)
            {
                HtmlTableRow htmlrow = new HtmlTableRow();
                HtmlTableCell htmlcell = new HtmlTableCell();
                HtmlTableCell htmlcell2 = new HtmlTableCell();
                HtmlTableCell htmlcell3 = new HtmlTableCell();
                HtmlTableCell htmlcell4 = new HtmlTableCell();
                HtmlTableCell htmlcell5 = new HtmlTableCell();
                htmlcell.InnerText = row["Imie"].ToString() + " " + row["Nazwisko"].ToString();
                htmlrow.Cells.Add(htmlcell);
                htmlcell2.InnerText = row["NazwaFirmy"].ToString();
                htmlrow.Cells.Add(htmlcell2);
                htmlcell3.InnerText = row["email"].ToString();
                htmlrow.Cells.Add(htmlcell3);
                htmlcell4.InnerText = row["Telefon"].ToString();
                htmlrow.Cells.Add(htmlcell4);
                htmlcell5.InnerText = row["NIP"].ToString();
                htmlrow.Cells.Add(htmlcell5);
                tabelaZleceniodawcy.Rows.Add(htmlrow);
                tabelaZleceniodawcy.DataBind();
            }
        }
    }
}