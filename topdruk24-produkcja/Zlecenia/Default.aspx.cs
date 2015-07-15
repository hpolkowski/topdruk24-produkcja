using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace topdruk24_produkcja.Zlecenia
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //tabelaZlecenia.Rows.Clear();
            DataView view = (DataView)SQLDataZlecenia.Select(DataSourceSelectArguments.Empty);
            DataTable table = view.ToTable();
            DataSet ds = new DataSet();
            ds.Tables.Add(table);
            foreach (DataRow row in ds.Tables[0].Rows)
            {
                //System.Diagnostics.Debug.WriteLine(row[0].ToString());
                //Console.WriteLine(row["FieldName"].ToString());

                HtmlTableRow htmlrow = new HtmlTableRow();
                HtmlTableCell htmlcell = new HtmlTableCell();
                HtmlTableCell htmlcell2 = new HtmlTableCell();
                HtmlTableCell htmlcell3 = new HtmlTableCell();
                HtmlTableCell htmlcell4 = new HtmlTableCell();
                HtmlTableCell htmlcell5 = new HtmlTableCell();
                HtmlTableCell htmlcell6 = new HtmlTableCell();
                HtmlTableCell htmlcell7 = new HtmlTableCell();
                htmlcell.InnerText = getZleceniodawcyById(int.Parse(row["IdZleceniodawcy"].ToString()));
                htmlrow.Cells.Add(htmlcell);
                htmlcell2.InnerText = row["NumerZlecenia"].ToString();
                htmlrow.Cells.Add(htmlcell2);
                htmlcell3.InnerText = row["Nazwa"].ToString();
                htmlrow.Cells.Add(htmlcell3);
                htmlcell4.InnerText = row["TerminOddania"].ToString().Replace("00:00:00", "");
                htmlrow.Cells.Add(htmlcell4);
                htmlcell5.InnerText = row["Wymiar"].ToString();
                htmlrow.Cells.Add(htmlcell5);
                htmlcell6.InnerText = row["IloscKolorow"].ToString();
                htmlrow.Cells.Add(htmlcell6);
                htmlcell7.InnerText = row["Notatki"].ToString();
                htmlrow.Cells.Add(htmlcell7);
                tabelaZlecenia.Rows.Add(htmlrow);

            }
            /*
                <th>Zleceniodawca</th>
                <th>Numer zlecenia</th>
                <th>Nazwa zlecenia</th>
                <th>Data Realizacji</th>
                <th>Format</th>
                <th>Kolor</th>
                <th>Notatki</th>
             */
            tabelaZlecenia.DataBind();
        }

        public string getZleceniodawcyById(int id)
        {
            string nazwaFirmy, imie, nazwisko;
            nazwaFirmy = imie = nazwisko = null;
            DataView view = (DataView)SqlDataZleceniodawcy.Select(DataSourceSelectArguments.Empty);
            DataTable table = view.ToTable();
            DataSet ds = new DataSet();
            ds.Tables.Add(table); 
            foreach (DataRow row in ds.Tables[0].Rows)
            {
                if(int.Parse(row["Id"].ToString())==id)
                {
                    nazwaFirmy = row["NazwaFirmy"].ToString();
                    imie = row["Imie"].ToString();
                    nazwisko = row["Nazwisko"].ToString();
                }
            }
            return nazwaFirmy + " " + imie + " " + nazwisko;
        }
    }
}