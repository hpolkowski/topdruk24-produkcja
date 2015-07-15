using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace topdruk24_produkcja.ProcesyProdukcyjne
{
    public partial class Default : System.Web.UI.Page
    {
        string selectedProcesValue = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            selectedProcesValue = selectProces.Value;
            System.Diagnostics.Debug.WriteLine("Id=" + selectedProcesValue);
            DataView dview = (DataView)SqlDataSource_ProcesyProdukcyjne.Select(DataSourceSelectArguments.Empty);
            //string value = (String)dview.Table.Rows[0]["YourColumnName"];
            selectProces.Items.Clear();
            selectProces.Items.Insert(0, new ListItem("Wybierz", string.Empty));
            foreach (DataRow row in dview.Table.Rows)
            {
                string id = row[0].ToString();
                string nazwa = row[1].ToString();
                selectProces.Items.Insert(selectProces.Items.Count, new ListItem(nazwa, id));
            }
            labelProcesProdukcyjny.Visible = false;
        }

        public void Proces_Changed(object sender, EventArgs e)
        {
            if (selectedProcesValue == "")
                return;
            labelProcesProdukcyjny.Visible = true;
            DataView dviewProcesy = (DataView)SqlDataSource_ProcesyProdukcyjne.Select(DataSourceSelectArguments.Empty);
            DataTable tableProcesy = dviewProcesy.ToTable();
            DataSet dsProcesy = new DataSet();
            dsProcesy.Tables.Add(tableProcesy);

            DataRow proces = getProcesById(dsProcesy, int.Parse(selectedProcesValue));
            int i = 1;
            string id = proces["Etap" + i].ToString();
            while(id != ""){
                HtmlTableRow htmlrow = new HtmlTableRow();
                HtmlTableCell htmlcell = new HtmlTableCell();
                htmlcell.InnerHtml =
                    "\n       <div class=\"list-group-item\">\n" +
                    //style=\"width: 500px\"
                    "           <h4 class=\"list-group-item-heading\">\n" +
                    //"           <input type=\"button\" value=\"↓\" style=\"float: right\" />\n" +
                                    //header
                    "              " + getEtapById(int.Parse(proces["Etap" + i].ToString()), true) +
                    "\n           </h4>\n" +
                    "           <input type=\"button\" value=\"↓\" style=\"float: right\" />\n" +
                    "           <input type=\"button\" value=\"X\" style=\"float: right\" />\n" +
                    "           <input type=\"button\" value=\"↑\" style=\"float: right\" />\n" +
                    "           <p class=\"list-group-item-text\">\n" +
                                    //footer
                    "              " + getEtapById(int.Parse(proces["Etap" + i].ToString()), false) +
                    "\n           </p>\n"+
                    "       </div>\n";
                htmlrow.Cells.Add(htmlcell);
                TabelaProcesu.Rows.Add(htmlrow);
                System.Diagnostics.Debug.WriteLine("Etap "+i+":"+proces["Etap" + i].ToString());
                i++;
                id = proces["Etap" + i].ToString();
            }
            /*
            foreach (DataRow row in ds.Tables[1].Rows)
            {
                //System.Diagnostics.Debug.WriteLine(row[0].ToString());
                //Console.WriteLine(row["FieldName"].ToString());

                HtmlTableRow htmlrow = new HtmlTableRow();
                HtmlTableCell htmlcell = new HtmlTableCell();
                htmlcell.InnerText = row["NumerZlecenia"].ToString();
                htmlrow.Cells.Add(htmlcell);
                TabelaProcesu.Rows.Add(htmlrow);
            }
             */
        }

        public DataRow getProcesById(DataSet ds, int id)
        {
            foreach (DataRow row in ds.Tables[0].Rows)
            {
                if (int.Parse(row[0].ToString()) == id)
                    return row;
            }
                return null;
        }

        public string getEtapById(int id, bool getNazwa)
        {
            string nazwa, opis;
            nazwa = opis = null;
            DataView view = (DataView)SqlDataSource_Etapy.Select(DataSourceSelectArguments.Empty);
            DataTable table = view.ToTable();
            DataSet ds = new DataSet();
            ds.Tables.Add(table);
            foreach (DataRow row in ds.Tables[0].Rows)
            {
                if (int.Parse(row["Id"].ToString()) == id)
                {
                    nazwa = row["Nazwa"].ToString();
                    opis = row["Opis"].ToString();
                }
            }
            if (getNazwa)
                return nazwa;
            else
                return opis;
        }
    }
}