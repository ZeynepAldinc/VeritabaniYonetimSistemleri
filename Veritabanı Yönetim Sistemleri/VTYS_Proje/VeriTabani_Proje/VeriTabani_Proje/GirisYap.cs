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
    public partial class GirisYap : Form
    {
        private NpgsqlConnection baglanti;
        private DataSet dataset;
        private NpgsqlDataAdapter add;
        private NpgsqlCommand cmd;
        private string SqlIfade;
        public GirisYap()
        {
            InitializeComponent();
        }

        private void CikisBtn_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void GirisYapBtn_Click(object sender, EventArgs e)
        {
            try
            {
                baglanti.Open();
                SqlIfade = @"SELECT * FROM login(:_username, :_password)";
                cmd = new NpgsqlCommand(SqlIfade, baglanti);
                cmd.Parameters.AddWithValue("_username", KullaniciAdiTxtb.Text);
                cmd.Parameters.AddWithValue("_password", SifreTxtb.Text);
                int sonuc = (int)cmd.ExecuteScalar();
                SqlIfade = @"SELECT * FROM yetkiDondur(:_username)";
                cmd = new NpgsqlCommand(SqlIfade, baglanti);
                cmd.Parameters.AddWithValue("_username", KullaniciAdiTxtb.Text);
                int yetki = (int)cmd.ExecuteScalar();
                baglanti.Close();

                if (sonuc == 1)
                {
                    this.Hide();
                    if (yetki == 1)
                    {
                        new Admin(KullaniciAdiTxtb.Text).Show();
                    }
                    else
                    {
                        new Musteri(KullaniciAdiTxtb.Text).Show();
                    }
                }
                else
                {
                    MessageBox.Show("Lütfen Kulanici Adi ve Şifreyi Doğru Giriniz", "Şifre veya Kullanici Adi Hatali", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Hata: " + ex.Message, "Beklenilmeye Durum Oluştu", MessageBoxButtons.OK, MessageBoxIcon.Error);
                baglanti.Close();
            }
        }

        private void GirisYap_Load(object sender, EventArgs e)
        {
            baglanti = new NpgsqlConnection("Server=localhost; Port = 5432; UserID=postgres; password=zeyda122; Database=Yasayan_Kutuphane");
            dataset = new DataSet();
        }

        private void GirisYap_FormClosed(object sender, FormClosedEventArgs e)
        {
            Application.Exit();
        }
    }
}
