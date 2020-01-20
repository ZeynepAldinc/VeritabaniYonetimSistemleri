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
    public partial class Musteri : Form
    {
        private NpgsqlConnection baglanti;
        private DataSet dataset;
        private DataTable dataTb;
        private NpgsqlCommand cmd;
        private NpgsqlDataReader dr;
        private string SqlIfade;
        private string MusteriAdi;
        private int serial = 8;
        public Musteri(string MusteriAdi)
        {
            this.MusteriAdi = MusteriAdi;
            InitializeComponent();
        }

        private void Musteri_Load(object sender, EventArgs e)
        {
            MusteriAdiLb.Text = MusteriAdi;
            baglanti = new NpgsqlConnection("Server=localhost; Port = 5432; UserID=postgres; password=zeyda122; Database=Yasayan_Kutuphane");
            dataset = new DataSet();
            try
            {
                baglanti.Open();
                SqlIfade = "SELECT * FROM \"Sepet\"";
                cmd = new NpgsqlCommand(SqlIfade, baglanti);
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    SepetLb.Text = (int.Parse(SepetLb.Text) + 1).ToString();
                }
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

        private void Musteri_FormClosed(object sender, FormClosedEventArgs e)
        {
            Application.Exit();
        }

        private void SepetBtn_Click(object sender, EventArgs e)
        {
            this.Hide();
            new Sepet(MusteriAdi).Show();
        }

        private void SepeteEkleBtn1_Click(object sender, EventArgs e)
        {

            SepetLb.Text = (int.Parse(SepetLb.Text) + 1).ToString();
            try
            {
                baglanti.Open();
                SqlIfade = "INSERT INTO \"Sepet\" (\"UrunID\") VALUES(\'1\')";
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
        }

        private void SepeteEkleBtn2_Click(object sender, EventArgs e)
        {
            SepetLb.Text = (int.Parse(SepetLb.Text) + 1).ToString();
            try
            {
                baglanti.Open();
                SqlIfade = "INSERT INTO \"Sepet\" (\"UrunID\") VALUES(\'2\')";
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
        }

        private void SepeteEkleBtn3_Click(object sender, EventArgs e)
        {
            SepetLb.Text = (int.Parse(SepetLb.Text) + 1).ToString();
            try
            {
                baglanti.Open();
                SqlIfade = "INSERT INTO \"Sepet\" (\"UrunID\") VALUES(\'3\')";
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
        }

        private void AyrintiliBilgiBtn1_Click(object sender, EventArgs e)
        {
            this.Hide();
            new AyrintiliBilgi(MusteriAdi, 1).Show();
        }

        private void AyrintiliBilgiBtn2_Click(object sender, EventArgs e)
        {

            this.Hide();
            new AyrintiliBilgi(MusteriAdi, 2).Show();
        }

        private void AyrintiliBilgiBtn3_Click(object sender, EventArgs e)
        {

            this.Hide();
            new AyrintiliBilgi(MusteriAdi, 3).Show();
        }

        private void CikisYapBtn_Click(object sender, EventArgs e)
        {
            this.Hide();
            new GirisYap().Show();
        }

        private void YorumEkleBtn1_Click(object sender, EventArgs e)
        {
            this.Hide();
            new Yorum(1, MusteriAdi).Show();
            //try
            //{
            //    baglanti.Open();
            //    SqlIfade = "SELECT * FROM \"YorumGir\"(1)";
            //    cmd = new NpgsqlCommand(SqlIfade, baglanti);
            //    cmd.ExecuteReader();
            //}
            //catch (Exception ex)
            //{
            //    MessageBox.Show("Hata: " + ex.Message, "Beklenmedik Bir Durum Oluştu", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //}
            //finally
            //{
            //    baglanti.Close();
            //}
            
        }

        private void YorumEkleBtn2_Click(object sender, EventArgs e)
        {
            this.Hide();
            new Yorum(2, MusteriAdi).Show();
            //try
            //{
            //    baglanti.Open();
            //    SqlIfade = "SELECT * FROM \"YorumGir\"(2)";
            //    cmd = new NpgsqlCommand(SqlIfade, baglanti);
            //    cmd.ExecuteReader();
            //}
            //catch (Exception ex)
            //{
            //    MessageBox.Show("Hata: " + ex.Message, "Beklenmedik Bir Durum Oluştu", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //}
            //finally
            //{
            //    baglanti.Close();
            //}
        }

        private void YorumEkleBtn3_Click(object sender, EventArgs e)
        {
            this.Hide();
            new Yorum(3, MusteriAdi).Show();
            //try
            //{
            //    baglanti.Open();
            //    SqlIfade = "SELECT * FROM \"YorumGir\"(3)";
            //    cmd = new NpgsqlCommand(SqlIfade, baglanti);
            //    cmd.ExecuteReader();
            //}
            //catch (Exception ex)
            //{
            //    MessageBox.Show("Hata: " + ex.Message, "Beklenmedik Bir Durum Oluştu", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //}
            //finally
            //{
            //    baglanti.Close();
            //}
        }
    }
}
