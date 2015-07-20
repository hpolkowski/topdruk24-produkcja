using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace topdruk24_produkcja.ProcesyProdukcyjne
{
    public partial class Default : System.Web.UI.Page
    {
        string selectedProcesValue = null;
        string selectedEtapValue = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            selectedProcesValue = selectProces.Value;
            selectedEtapValue = selectEtap.Value;
            int index = selectProces.SelectedIndex;
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
            dview = (DataView)SqlDataSource_Etapy.Select(DataSourceSelectArguments.Empty);
            selectEtap.Items.Clear();
            selectEtap.Items.Insert(0, new ListItem("Wybierz", string.Empty));
            foreach (DataRow row in dview.Table.Rows)
            {
                string id = row[0].ToString();
                string nazwa = row[1].ToString();
                string opis = row[2].ToString();
                selectEtap.Items.Insert(selectEtap.Items.Count, new ListItem(nazwa + " - " + opis, id));
            }
            if (selectedProcesValue.Equals("1"))
                labelProcesProdukcyjny.Visible = false;
                selectProces.SelectedIndex = index;
        }

        public void Proces_Changed(object sender, EventArgs e)
        {
            if (selectedProcesValue == "")
                return;
            labelProcesProdukcyjny.Visible = true;

            DataRow proces = getProcesById(int.Parse(selectedProcesValue));
            int i = 1;
            string id = proces["Etap" + i].ToString();
            while(id != ""){
                HtmlTableRow htmlrow = new HtmlTableRow();
                HtmlTableCell htmlcell = new HtmlTableCell();
                DataRow etap = getEtapById(int.Parse(proces["Etap" + i].ToString()));
                htmlcell.InnerHtml =
                    "\n       <div class=\"list-group-item\">\n" +
                    //style=\"width: 500px\"
                    "           <h4 class=\"list-group-item-heading\">\n" +
                    //"           <input type=\"button\" value=\"↓\" style=\"float: right\" />\n" +
                                    //header
                    "              " + etap["Nazwa"].ToString() +
                    "\n           </h4>\n" +
                    "           <input type=\"button\" value=\"↓\" style=\"float: right\" />\n" +
                    "           <button onclick=\"__doPostBack('ctl00$MainContent$Etap" + i + "','')\" style=\"float: right\" id=\"MainContent_Etap" + i + "\">X</button>\n" +
                    "           <input type=\"button\" value=\"↑\" style=\"float: right\" />\n" +
                    "           <p class=\"list-group-item-text\">\n" +
                                    //footer
                    "              " + etap["Opis"].ToString() +
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

        public void Usun_Etap(Object sender, EventArgs e)
        {
            Response.Write("<script>alert('Usuwanie!');</script>");
            HtmlButton b = (HtmlButton)sender;
            System.Diagnostics.Debug.WriteLine("B Id=" + b.ID.ToString());
            int n = int.Parse(b.ID.ToString().Replace("Etap", ""));
            labelProcesProdukcyjny.Visible = true;
            DataRow proces = getProcesById(int.Parse(selectedProcesValue));
            SqlDataSource_ProcesyProdukcyjne.UpdateParameters.Add("original_Id", proces["Id"].ToString());
            SqlDataSource_ProcesyProdukcyjne.UpdateParameters.Add("Nazwa", proces["Nazwa"].ToString());
            SqlDataSource_ProcesyProdukcyjne.UpdateParameters.Add("Opis", proces["Opis"].ToString());
            int i = 1;
            while ((i != n) && (i < 20))
            {
                SqlDataSource_ProcesyProdukcyjne.UpdateParameters.RemoveAt(0);
                SqlDataSource_ProcesyProdukcyjne.UpdateParameters.Add("Etap" + i, proces["Etap" + i].ToString());
                i++;
            }
            while ((proces["Etap" + i].ToString() != "") && (i < 20))
            {
                SqlDataSource_ProcesyProdukcyjne.UpdateParameters.RemoveAt(0);
                SqlDataSource_ProcesyProdukcyjne.UpdateParameters.Add("Etap" + i, proces["Etap" + (i+1)].ToString());
                i++;
            }
            SqlDataSource_ProcesyProdukcyjne.Update();
            Proces_Changed(null, null);
        }

        public void Dodaj_Etap(object sender, EventArgs e)
        {
            if (selectedEtapValue == "")
                return;
            labelProcesProdukcyjny.Visible = true;
            DataRow proces = getProcesById(int.Parse(selectedProcesValue));
            SqlDataSource_ProcesyProdukcyjne.UpdateParameters.Add("original_Id", proces["Id"].ToString());
            SqlDataSource_ProcesyProdukcyjne.UpdateParameters.Add("Nazwa", proces["Nazwa"].ToString());
            SqlDataSource_ProcesyProdukcyjne.UpdateParameters.Add("Opis", proces["Opis"].ToString());
            int i = 1;
            while ((proces["Etap" + i].ToString() != "") && (i < 20))
            {
                SqlDataSource_ProcesyProdukcyjne.UpdateParameters.RemoveAt(0);
                SqlDataSource_ProcesyProdukcyjne.UpdateParameters.Add("Etap" + i, proces["Etap" + i].ToString());
                i++;
            }
            SqlDataSource_ProcesyProdukcyjne.UpdateParameters.RemoveAt(0);
            SqlDataSource_ProcesyProdukcyjne.UpdateParameters.Add("Etap" + i, selectedEtapValue);
            SqlDataSource_ProcesyProdukcyjne.Update();
            Proces_Changed(null, null);
        }

        public DataRow getProcesById(int id)
        {

            DataView dviewProcesy = (DataView)SqlDataSource_ProcesyProdukcyjne.Select(DataSourceSelectArguments.Empty);
            DataTable tableProcesy = dviewProcesy.ToTable();
            DataSet ds = new DataSet();
            ds.Tables.Add(tableProcesy);
            foreach (DataRow row in ds.Tables[0].Rows)
            {
                if (int.Parse(row[0].ToString()) == id)
                    return row;
            }
                return null;
        }

        public DataRow getEtapById(int id)
        {
            /*
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
            */
            DataView dview = (DataView)SqlDataSource_Etapy.Select(DataSourceSelectArguments.Empty);
            DataTable table = dview.ToTable();
            DataSet ds = new DataSet();
            ds.Tables.Add(table);
            foreach (DataRow row in ds.Tables[0].Rows)
            {
                if (int.Parse(row[0].ToString()) == id)
                    return row;
            }
            return null;
        }
    }
}