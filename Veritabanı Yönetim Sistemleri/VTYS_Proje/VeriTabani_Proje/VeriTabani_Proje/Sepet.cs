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
    public partial class Sepet : Form
    {
        private NpgsqlConnection baglanti;
        private DataSet dataset;
        private DataTable dataTb;
        private NpgsqlCommand cmd;
        private NpgsqlDataAdapter add;
        private NpgsqlDataReader dr;
        private string SqlIfade;
        private string MusteriAdi;
        public Sepet(string MusteriAdi)
        {
            this.MusteriAdi = MusteriAdi;
            InitializeComponent();
        }

        private void Sepet_FormClosed(object sender, FormClosedEventArgs e)
        {
            Application.Exit();
        }

        private void GeriDonBtn_Click(object sender, EventArgs e)
        {
            this.Hide();
            new Musteri(MusteriAdi).Show();
        }

        private void TamamBtn_Click(object sender, EventArgs e)
        {
            try
            {
                baglanti.Open();
                SqlIfade = "DELETE FROM \"Sepet\"";
                cmd = new NpgsqlCommand(SqlIfade, baglanti);
                cmd.ExecuteReader();

            }
            catch (Exception ex)
            {
                MessageBox.Show("Hata: " + ex.Message, "Beklenmedik Bir Durum Oluştu", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                baglanti.Close();
            }

            this.Hide();
            new Musteri(MusteriAdi).Show();
        }

        private void Sepet_Load(object sender, EventArgs e)
        {
            baglanti = new NpgsqlConnection("Server=localhost; Port = 5432; UserID=postgres; password=zeyda122; Database=Yasayan_Kutuphane");
            dataset = new DataSet();
            try
            {
                baglanti.Open();
                SqlIfade = "SELECT * FROM \"Sepet\" INNER JOIN \"Urun\" ON \"Sepet\".\"UrunID\" = \"Urun\".\"UrunID\"";
                add = new NpgsqlDataAdapter(SqlIfade, baglanti);
                dataTb = new DataTable();
                add.Fill(dataTb);
                Sepet_dataGridView.AutoGenerateColumns = false;
                Sepet_dataGridView.DataSource = dataTb;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Hata: " + ex.Message, "Beklenmedik Bir Durum Oluştu", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                baglanti.Close();
            }
        }
    }
}
