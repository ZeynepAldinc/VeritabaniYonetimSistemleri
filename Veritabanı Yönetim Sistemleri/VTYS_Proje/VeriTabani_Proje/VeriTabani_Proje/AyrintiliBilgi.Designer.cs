namespace VeriTabani_Proje
{
    partial class AyrintiliBilgi
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.AyrintiliBilgi_dataGridView = new System.Windows.Forms.DataGridView();
            this.UrunAdi = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Urun_KategoriID = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.UrunKitapTuru = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.UrunKapakTipi = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.UrunYayınEvi = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.UrunBasimTarihi = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.UrunDil = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.UrunBaskiSayisi = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.UrunStokMiktarı = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.UrunPuan = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.UrunUcret = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.GeriDonBtn = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.AyrintiliBilgi_dataGridView)).BeginInit();
            this.SuspendLayout();
            // 
            // AyrintiliBilgi_dataGridView
            // 
            this.AyrintiliBilgi_dataGridView.AllowUserToAddRows = false;
            this.AyrintiliBilgi_dataGridView.AllowUserToDeleteRows = false;
            this.AyrintiliBilgi_dataGridView.BackgroundColor = System.Drawing.Color.Tan;
            this.AyrintiliBilgi_dataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.AyrintiliBilgi_dataGridView.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.UrunAdi,
            this.Urun_KategoriID,
            this.UrunKitapTuru,
            this.UrunKapakTipi,
            this.UrunYayınEvi,
            this.UrunBasimTarihi,
            this.UrunDil,
            this.UrunBaskiSayisi,
            this.UrunStokMiktarı,
            this.UrunPuan,
            this.UrunUcret});
            this.AyrintiliBilgi_dataGridView.Location = new System.Drawing.Point(12, 12);
            this.AyrintiliBilgi_dataGridView.Name = "AyrintiliBilgi_dataGridView";
            this.AyrintiliBilgi_dataGridView.ReadOnly = true;
            this.AyrintiliBilgi_dataGridView.Size = new System.Drawing.Size(1190, 223);
            this.AyrintiliBilgi_dataGridView.TabIndex = 0;
            // 
            // UrunAdi
            // 
            this.UrunAdi.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.UrunAdi.DataPropertyName = "Adi";
            this.UrunAdi.HeaderText = "Ürün Adı";
            this.UrunAdi.Name = "UrunAdi";
            this.UrunAdi.ReadOnly = true;
            // 
            // Urun_KategoriID
            // 
            this.Urun_KategoriID.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.Urun_KategoriID.DataPropertyName = "KategoriID";
            this.Urun_KategoriID.HeaderText = "Kategorisi";
            this.Urun_KategoriID.Name = "Urun_KategoriID";
            this.Urun_KategoriID.ReadOnly = true;
            // 
            // UrunKitapTuru
            // 
            this.UrunKitapTuru.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.UrunKitapTuru.DataPropertyName = "KitapTuruID";
            this.UrunKitapTuru.HeaderText = "Türü";
            this.UrunKitapTuru.Name = "UrunKitapTuru";
            this.UrunKitapTuru.ReadOnly = true;
            // 
            // UrunKapakTipi
            // 
            this.UrunKapakTipi.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.UrunKapakTipi.DataPropertyName = "KapakTipiID";
            this.UrunKapakTipi.HeaderText = "Kapak Tipi";
            this.UrunKapakTipi.Name = "UrunKapakTipi";
            this.UrunKapakTipi.ReadOnly = true;
            // 
            // UrunYayınEvi
            // 
            this.UrunYayınEvi.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.UrunYayınEvi.DataPropertyName = "YayinEviID";
            this.UrunYayınEvi.HeaderText = "Yayın Evi";
            this.UrunYayınEvi.Name = "UrunYayınEvi";
            this.UrunYayınEvi.ReadOnly = true;
            // 
            // UrunBasimTarihi
            // 
            this.UrunBasimTarihi.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.UrunBasimTarihi.DataPropertyName = "BasimTarihi";
            this.UrunBasimTarihi.HeaderText = "Basım Tarihi";
            this.UrunBasimTarihi.Name = "UrunBasimTarihi";
            this.UrunBasimTarihi.ReadOnly = true;
            // 
            // UrunDil
            // 
            this.UrunDil.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.UrunDil.DataPropertyName = "DilID";
            this.UrunDil.HeaderText = "Dili";
            this.UrunDil.Name = "UrunDil";
            this.UrunDil.ReadOnly = true;
            // 
            // UrunBaskiSayisi
            // 
            this.UrunBaskiSayisi.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.UrunBaskiSayisi.DataPropertyName = "BaskiSayisi";
            this.UrunBaskiSayisi.HeaderText = "Baskı Sayısı";
            this.UrunBaskiSayisi.Name = "UrunBaskiSayisi";
            this.UrunBaskiSayisi.ReadOnly = true;
            // 
            // UrunStokMiktarı
            // 
            this.UrunStokMiktarı.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.UrunStokMiktarı.DataPropertyName = "StokMiktari";
            this.UrunStokMiktarı.HeaderText = "Stok Miktarı";
            this.UrunStokMiktarı.Name = "UrunStokMiktarı";
            this.UrunStokMiktarı.ReadOnly = true;
            // 
            // UrunPuan
            // 
            this.UrunPuan.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.UrunPuan.DataPropertyName = "Puan";
            this.UrunPuan.HeaderText = "Puan";
            this.UrunPuan.Name = "UrunPuan";
            this.UrunPuan.ReadOnly = true;
            // 
            // UrunUcret
            // 
            this.UrunUcret.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.UrunUcret.DataPropertyName = "Ucret";
            this.UrunUcret.HeaderText = "Ücret";
            this.UrunUcret.Name = "UrunUcret";
            this.UrunUcret.ReadOnly = true;
            // 
            // GeriDonBtn
            // 
            this.GeriDonBtn.BackColor = System.Drawing.Color.Tan;
            this.GeriDonBtn.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.GeriDonBtn.Location = new System.Drawing.Point(1046, 241);
            this.GeriDonBtn.Name = "GeriDonBtn";
            this.GeriDonBtn.Size = new System.Drawing.Size(156, 45);
            this.GeriDonBtn.TabIndex = 1;
            this.GeriDonBtn.Text = "Geri Dön";
            this.GeriDonBtn.UseVisualStyleBackColor = false;
            this.GeriDonBtn.Click += new System.EventHandler(this.GeriDonBtn_Click);
            // 
            // AyrintiliBilgi
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.Tan;
            this.ClientSize = new System.Drawing.Size(1214, 298);
            this.Controls.Add(this.GeriDonBtn);
            this.Controls.Add(this.AyrintiliBilgi_dataGridView);
            this.Name = "AyrintiliBilgi";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "AyrintiliBilgi";
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.AyrintiliBilgi_FormClosed);
            this.Load += new System.EventHandler(this.AyrintiliBilgi_Load);
            ((System.ComponentModel.ISupportInitialize)(this.AyrintiliBilgi_dataGridView)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView AyrintiliBilgi_dataGridView;
        private System.Windows.Forms.Button GeriDonBtn;
        private System.Windows.Forms.DataGridViewTextBoxColumn UrunAdi;
        private System.Windows.Forms.DataGridViewTextBoxColumn Urun_KategoriID;
        private System.Windows.Forms.DataGridViewTextBoxColumn UrunKitapTuru;
        private System.Windows.Forms.DataGridViewTextBoxColumn UrunKapakTipi;
        private System.Windows.Forms.DataGridViewTextBoxColumn UrunYayınEvi;
        private System.Windows.Forms.DataGridViewTextBoxColumn UrunBasimTarihi;
        private System.Windows.Forms.DataGridViewTextBoxColumn UrunDil;
        private System.Windows.Forms.DataGridViewTextBoxColumn UrunBaskiSayisi;
        private System.Windows.Forms.DataGridViewTextBoxColumn UrunStokMiktarı;
        private System.Windows.Forms.DataGridViewTextBoxColumn UrunPuan;
        private System.Windows.Forms.DataGridViewTextBoxColumn UrunUcret;
    }
}