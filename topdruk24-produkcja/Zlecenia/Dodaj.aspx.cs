using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace topdruk24_produkcja.Zlecenia
{
    public partial class Dodaj : System.Web.UI.Page
    {
        string selectedvalue = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            selectedvalue = selectZleceniodawca.Value;
            System.Diagnostics.Debug.WriteLine("Id=" + selectedvalue);
            DataView dview = (DataView)SqlDataSource_Zleceniodawcy.Select(DataSourceSelectArguments.Empty);
            //string value = (String)dview.Table.Rows[0]["YourColumnName"];
            selectZleceniodawca.Items.Clear();
            selectZleceniodawca.Items.Insert(0, new ListItem("Wybierz", string.Empty));
            foreach (DataRow row in dview.Table.Rows)
            {
                string id = row[0].ToString();
                string imie = row[1].ToString();
                string nazwisko = row[2].ToString();
                string nazwa = row[3].ToString();
                selectZleceniodawca.Items.Insert(selectZleceniodawca.Items.Count, new ListItem(nazwa+" "+imie+" "+nazwisko, id));
            }
        }

        public void Cancel_Action(object sender, EventArgs e)
        {
            selectZleceniodawca.SelectedIndex = 0;
            inputNumerZlecenia.Value = null;
            inputNazwa.Value = null;
            inputData.Value = null;
            inputNaklad.Value = null;
            inputWymiar.Value = null;
            inputIloscKolorow.Value = null;
            inputNotatki.Value = null;
            System.Diagnostics.Debug.WriteLine("Wyczyszczono");
        }

        public void Insert_Action(object sender, EventArgs e)
        {
            string numerZlecenia = inputNumerZlecenia.Value.Replace("  ", string.Empty);
            if (numerZlecenia == "")
            {
                Response.Write("<script>alert('Numer Zlecenia jest wymagany!');</script>");
                return;
            }
            SqlDataSource_Zlecenia.InsertParameters.Add("IdZleceniodawcy", selectedvalue);
            SqlDataSource_Zlecenia.InsertParameters.Add("NumerZlecenia", numerZlecenia);
            SqlDataSource_Zlecenia.InsertParameters.Add("Nazwa", inputNazwa.Value);
            SqlDataSource_Zlecenia.InsertParameters.Add("TerminOddania", inputData.Value);
            SqlDataSource_Zlecenia.InsertParameters.Add("Naklad", inputNaklad.Value);
            SqlDataSource_Zlecenia.InsertParameters.Add("Wymiar", inputWymiar.Value);
            SqlDataSource_Zlecenia.InsertParameters.Add("IloscKolorow", inputIloscKolorow.Value);
            SqlDataSource_Zlecenia.InsertParameters.Add("Notatki", inputNotatki.Value);
            SqlDataSource_Zlecenia.Insert();
            Cancel_Action(null, null);
        }
    }
}