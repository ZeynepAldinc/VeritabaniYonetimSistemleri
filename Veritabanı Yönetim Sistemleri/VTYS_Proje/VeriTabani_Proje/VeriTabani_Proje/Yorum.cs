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
    public partial class Yorum : Form
    {
        private NpgsqlConnection baglanti;
        private DataTable dataTb;
        private NpgsqlCommand cmd;
        private NpgsqlDataAdapter add;
        private string SqlIfade;
        private int YorumNo;
        private string MusteriAdi;
        private int MusteriID;
        private bool bayrak = false;
        public Yorum(int yorum_no, string MusteriAdi)
        {
            YorumNo = yorum_no;
            this.MusteriAdi = MusteriAdi;
            InitializeComponent();
        }

        private void Yorum_Load(object sender, EventArgs e)
        {
            baglanti = new NpgsqlConnection("Server=localhost; Port = 5432; UserID=postgres; password=zeyda122; Database=Yasayan_Kutuphane");
            try
            {
                baglanti.Open();
                SqlIfade = "SELECT * FROM \"Yorum\" INNER JOIN \"Urun\" ON \"Yorum\".\"UrunID\" = \"Urun\".\"UrunID\" INNER JOIN \"Kullanici\" ON \"Yorum\".\"YorumYapanID\" = \"Kullanici\".\"KullaniciID\" Where \"Yorum\".\"UrunID\" = " + YorumNo;
                add = new NpgsqlDataAdapter(SqlIfade, baglanti);
                dataTb = new DataTable();
                add.Fill(dataTb);
                Yorum_dataGridView.AutoGenerateColumns = false;
                Yorum_dataGridView.DataSource = dataTb;

                SqlIfade = @"SELECT* FROM id_dondur(:_username)";
                cmd = new NpgsqlCommand(SqlIfade, baglanti);
                cmd.Parameters.AddWithValue("_username", MusteriAdi);
                MusteriID = (int)cmd.ExecuteScalar();
                baglanti.Close();

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

        private void YorumYap_Btn_Click(object sender, EventArgs e)
        {
            try
            {
                baglanti.Open();
                SqlIfade = "SELECT * FROM \"YorumEkle\"(" + YorumNo + ", '" + Yorum_TB.Text + "', " + MusteriID + ")";
                cmd = new NpgsqlCommand(SqlIfade, baglanti);
                cmd.ExecuteReader();
                MessageBox.Show("Mesajı Kapatmak İçin Tamam Butonuna Basın", "Yorumunuz Başarıyla Eklendi", MessageBoxButtons.OK, MessageBoxIcon.Information);
                Yorum_TB.Clear();
                Yorum_LB.Text = "Yorum Yaptığınız İçin Teşekkür Ederiz";
            }
            catch (Exception ex)
            {
                MessageBox.Show("Hata: " + ex.Message, "Beklenmedik Bir Durum Oluştu", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                baglanti.Close();
            }
            Guncelle();
        }
        private void Guncelle()
        {
            try
            {
                baglanti.Open();
                SqlIfade = "SELECT * FROM \"Yorum\" INNER JOIN \"Urun\" ON \"Yorum\".\"UrunID\" = \"Urun\".\"UrunID\" INNER JOIN \"Kullanici\" ON \"Yorum\".\"YorumYapanID\" = \"Kullanici\".\"KullaniciID\" Where \"Yorum\".\"UrunID\" = " + YorumNo;
                add = new NpgsqlDataAdapter(SqlIfade, baglanti);
                dataTb = new DataTable();
                add.Fill(dataTb);
                Yorum_dataGridView.AutoGenerateColumns = false;
                Yorum_dataGridView.DataSource = dataTb;
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
        private void Yorum_FormClosed(object sender, FormClosedEventArgs e)
        {
            Application.Exit();
        }

        private void GeriDon_Btn_Click(object sender, EventArgs e)
        {
            this.Hide();
            new Musteri(MusteriAdi).Show();
        }

        private void BenimYorumlarim_Btn_Click(object sender, EventArgs e)
        {
            if (bayrak)
            {
                try
                {
                    baglanti.Open();
                    SqlIfade = "SELECT * FROM \"Yorum\" INNER JOIN \"Urun\" ON \"Yorum\".\"UrunID\" = \"Urun\".\"UrunID\" INNER JOIN \"Kullanici\" ON \"Yorum\".\"YorumYapanID\" = \"Kullanici\".\"KullaniciID\" Where \"Yorum\".\"UrunID\" = " + YorumNo;
                    add = new NpgsqlDataAdapter(SqlIfade, baglanti);
                    dataTb = new DataTable();
                    add.Fill(dataTb);
                    Yorum_dataGridView.AutoGenerateColumns = false;
                    Yorum_dataGridView.DataSource = dataTb;
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Hata: " + ex.Message, "Beklenmedik Bir Durum Oluştu", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                finally
                {
                    baglanti.Close();
                }
                bayrak = false;
                BenimYorumlarim_Btn.Text = "Benim Yorumlarım";
            }
            else
            {
                try
                {
                    baglanti.Open();
                    SqlIfade = "SELECT * FROM \"Yorum\" INNER JOIN \"Urun\" ON \"Yorum\".\"UrunID\" = \"Urun\".\"UrunID\" INNER JOIN \"Kullanici\" ON \"Yorum\".\"YorumYapanID\" = \"Kullanici\".\"KullaniciID\" Where \"Yorum\".\"UrunID\" = " + YorumNo + " AND \"Yorum\".\"YorumYapanID\" = " + MusteriID;
                    add = new NpgsqlDataAdapter(SqlIfade, baglanti);
                    dataTb = new DataTable();
                    add.Fill(dataTb);
                    Yorum_dataGridView.AutoGenerateColumns = false;
                    Yorum_dataGridView.DataSource = dataTb;
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Hata: " + ex.Message, "Beklenmedik Bir Durum Oluştu", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                finally
                {
                    baglanti.Close();
                }
                bayrak = true;
                BenimYorumlarim_Btn.Text = "Tüm Yorumlar";
            }
        }
    }
}
