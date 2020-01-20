using Npgsql;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace VeriTabani_Proje
{
    public partial class AyrintiliBilgi : Form
    {
        private NpgsqlConnection baglanti;
        private DataSet dataset;
        private DataTable dataTb;
        private NpgsqlCommand cmd;
        private NpgsqlDataAdapter add;
        private NpgsqlDataReader dr;
        private string SqlIfade;
        private string MusteriAdi;
        private int UrunID;
        public AyrintiliBilgi(string MusteriAdi, int ID)
        {
            this.MusteriAdi = MusteriAdi;
            UrunID = ID;
            InitializeComponent();
        }

        private void AyrintiliBilgi_Load(object sender, EventArgs e)
        {
            baglanti = new NpgsqlConnection("Server=localhost; Port = 5432; UserID=postgres; password=zeyda122; Database=Yasayan_Kutuphane");
            dataset = new DataSet();

            try
            {
                baglanti.Open();
                SqlIfade = "SELECT * FROM \"Kitap\" INNER JOIN \"Urun\" ON \"Kitap\".\"UrunID\" = \"Urun\".\"UrunID\" Where \"Urun\".\"UrunID\" = \'" + UrunID.ToString() + "\'";
                add = new NpgsqlDataAdapter(SqlIfade, baglanti);
                dataTb = new DataTable();
                add.Fill(dataTb);
                AyrintiliBilgi_dataGridView.AutoGenerateColumns = false;
                AyrintiliBilgi_dataGridView.DataSource = dataTb;
            }
            catch (Exception ex)
            {

                MessageBox.Show("Hata: " + ex.Message, "Beklenilmeye Durum Oluştu", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                baglanti.Close();
            }
        }

        private void GeriDonBtn_Click(object sender, EventArgs e)
        {
            this.Hide();
            new Musteri(MusteriAdi).Show();
        }

        private void AyrintiliBilgi_FormClosed(object sender, FormClosedEventArgs e)
        {
            Application.Exit();
        }
    }
}
