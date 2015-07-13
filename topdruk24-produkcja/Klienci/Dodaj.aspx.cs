using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace topdruk24_produkcja.Klienci
{
    public partial class Dodaj : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void Cancel_Action(object sender, EventArgs e)
        {
            
            inputEmail.Value = null;
            inputImie.Value = null;
            inputNazwaFirmy.Value = null;
            inputNazwisko.Value = null;
            inputNIP.Value = null;
            inputTelefon.Value = null;
            System.Diagnostics.Debug.WriteLine("Wyczyszczono");
        }

        public void Insert_Action(object sender, EventArgs e)
        {
            SqlDataSource_Zleceniodawcy.InsertParameters.Add("Imie", inputImie.Value);
            SqlDataSource_Zleceniodawcy.InsertParameters.Add("Nazwisko", inputNazwisko.Value);
            SqlDataSource_Zleceniodawcy.InsertParameters.Add("NazwaFirmy", inputNazwaFirmy.Value);
            SqlDataSource_Zleceniodawcy.InsertParameters.Add("email", inputEmail.Value);
            SqlDataSource_Zleceniodawcy.InsertParameters.Add("Telefon", inputTelefon.Value);
            SqlDataSource_Zleceniodawcy.InsertParameters.Add("NIP", inputNIP.Value);
            SqlDataSource_Zleceniodawcy.Insert();
            Response.Write("<script>alert('Pomyślnie dodano klienta.');</script>");
            Cancel_Action(null, null);
        }
    }
}