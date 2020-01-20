namespace VeriTabani_Proje
{
    partial class GirisYap
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
            this.KullaniciAdiLb = new System.Windows.Forms.Label();
            this.SifreLb = new System.Windows.Forms.Label();
            this.KullaniciAdiTxtb = new System.Windows.Forms.TextBox();
            this.SifreTxtb = new System.Windows.Forms.TextBox();
            this.GirisYapBtn = new System.Windows.Forms.Button();
            this.CikisBtn = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // KullaniciAdiLb
            // 
            this.KullaniciAdiLb.AutoSize = true;
            this.KullaniciAdiLb.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.KullaniciAdiLb.Location = new System.Drawing.Point(12, 11);
            this.KullaniciAdiLb.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.KullaniciAdiLb.Name = "KullaniciAdiLb";
            this.KullaniciAdiLb.Size = new System.Drawing.Size(161, 31);
            this.KullaniciAdiLb.TabIndex = 0;
            this.KullaniciAdiLb.Text = "Kullanici Adi";
            // 
            // SifreLb
            // 
            this.SifreLb.AutoSize = true;
            this.SifreLb.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.SifreLb.Location = new System.Drawing.Point(61, 55);
            this.SifreLb.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.SifreLb.Name = "SifreLb";
            this.SifreLb.Size = new System.Drawing.Size(70, 31);
            this.SifreLb.TabIndex = 1;
            this.SifreLb.Text = "Şifre";
            // 
            // KullaniciAdiTxtb
            // 
            this.KullaniciAdiTxtb.BackColor = System.Drawing.Color.Tan;
            this.KullaniciAdiTxtb.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.KullaniciAdiTxtb.Location = new System.Drawing.Point(216, 11);
            this.KullaniciAdiTxtb.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.KullaniciAdiTxtb.Name = "KullaniciAdiTxtb";
            this.KullaniciAdiTxtb.Size = new System.Drawing.Size(312, 37);
            this.KullaniciAdiTxtb.TabIndex = 2;
            // 
            // SifreTxtb
            // 
            this.SifreTxtb.BackColor = System.Drawing.Color.Tan;
            this.SifreTxtb.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.SifreTxtb.Location = new System.Drawing.Point(216, 57);
            this.SifreTxtb.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.SifreTxtb.Name = "SifreTxtb";
            this.SifreTxtb.Size = new System.Drawing.Size(312, 37);
            this.SifreTxtb.TabIndex = 3;
            this.SifreTxtb.UseSystemPasswordChar = true;
            // 
            // GirisYapBtn
            // 
            this.GirisYapBtn.BackColor = System.Drawing.Color.Tan;
            this.GirisYapBtn.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.GirisYapBtn.Location = new System.Drawing.Point(115, 128);
            this.GirisYapBtn.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.GirisYapBtn.Name = "GirisYapBtn";
            this.GirisYapBtn.Size = new System.Drawing.Size(161, 44);
            this.GirisYapBtn.TabIndex = 4;
            this.GirisYapBtn.Text = "Giriş Yap";
            this.GirisYapBtn.UseVisualStyleBackColor = false;
            this.GirisYapBtn.Click += new System.EventHandler(this.GirisYapBtn_Click);
            // 
            // CikisBtn
            // 
            this.CikisBtn.BackColor = System.Drawing.Color.Tan;
            this.CikisBtn.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.CikisBtn.Location = new System.Drawing.Point(320, 128);
            this.CikisBtn.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.CikisBtn.Name = "CikisBtn";
            this.CikisBtn.Size = new System.Drawing.Size(161, 44);
            this.CikisBtn.TabIndex = 5;
            this.CikisBtn.Text = "Çıkış";
            this.CikisBtn.UseVisualStyleBackColor = false;
            this.CikisBtn.Click += new System.EventHandler(this.CikisBtn_Click);
            // 
            // GirisYap
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.Tan;
            this.ClientSize = new System.Drawing.Size(596, 204);
            this.Controls.Add(this.CikisBtn);
            this.Controls.Add(this.GirisYapBtn);
            this.Controls.Add(this.SifreTxtb);
            this.Controls.Add(this.KullaniciAdiTxtb);
            this.Controls.Add(this.SifreLb);
            this.Controls.Add(this.KullaniciAdiLb);
            this.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.Name = "GirisYap";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "s";
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.GirisYap_FormClosed);
            this.Load += new System.EventHandler(this.GirisYap_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label KullaniciAdiLb;
        private System.Windows.Forms.Label SifreLb;
        private System.Windows.Forms.TextBox KullaniciAdiTxtb;
        private System.Windows.Forms.TextBox SifreTxtb;
        private System.Windows.Forms.Button GirisYapBtn;
        private System.Windows.Forms.Button CikisBtn;
    }
}