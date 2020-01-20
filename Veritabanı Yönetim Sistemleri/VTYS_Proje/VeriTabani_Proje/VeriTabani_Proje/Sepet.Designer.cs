namespace VeriTabani_Proje
{
    partial class Sepet
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
            this.Sepet_dataGridView = new System.Windows.Forms.DataGridView();
            this.UrunAdi = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.KitapUcret = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.TamamBtn = new System.Windows.Forms.Button();
            this.GeriDonBtn = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.Sepet_dataGridView)).BeginInit();
            this.SuspendLayout();
            // 
            // Sepet_dataGridView
            // 
            this.Sepet_dataGridView.AllowUserToAddRows = false;
            this.Sepet_dataGridView.AllowUserToDeleteRows = false;
            this.Sepet_dataGridView.BackgroundColor = System.Drawing.Color.Tan;
            this.Sepet_dataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.Sepet_dataGridView.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.UrunAdi,
            this.KitapUcret});
            this.Sepet_dataGridView.Location = new System.Drawing.Point(12, 12);
            this.Sepet_dataGridView.Name = "Sepet_dataGridView";
            this.Sepet_dataGridView.ReadOnly = true;
            this.Sepet_dataGridView.Size = new System.Drawing.Size(776, 370);
            this.Sepet_dataGridView.TabIndex = 0;
            // 
            // UrunAdi
            // 
            this.UrunAdi.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.UrunAdi.DataPropertyName = "Adi";
            this.UrunAdi.HeaderText = "Ürün Adi";
            this.UrunAdi.Name = "UrunAdi";
            this.UrunAdi.ReadOnly = true;
            // 
            // KitapUcret
            // 
            this.KitapUcret.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.KitapUcret.DataPropertyName = "Ucret";
            this.KitapUcret.HeaderText = "Ücret";
            this.KitapUcret.Name = "KitapUcret";
            this.KitapUcret.ReadOnly = true;
            // 
            // TamamBtn
            // 
            this.TamamBtn.BackColor = System.Drawing.Color.Tan;
            this.TamamBtn.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.TamamBtn.Location = new System.Drawing.Point(12, 388);
            this.TamamBtn.Name = "TamamBtn";
            this.TamamBtn.Size = new System.Drawing.Size(386, 50);
            this.TamamBtn.TabIndex = 1;
            this.TamamBtn.Text = "Alışverişi Tamamla";
            this.TamamBtn.UseVisualStyleBackColor = false;
            this.TamamBtn.Click += new System.EventHandler(this.TamamBtn_Click);
            // 
            // GeriDonBtn
            // 
            this.GeriDonBtn.BackColor = System.Drawing.Color.Tan;
            this.GeriDonBtn.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.GeriDonBtn.Location = new System.Drawing.Point(404, 388);
            this.GeriDonBtn.Name = "GeriDonBtn";
            this.GeriDonBtn.Size = new System.Drawing.Size(386, 50);
            this.GeriDonBtn.TabIndex = 2;
            this.GeriDonBtn.Text = "Geri Dön";
            this.GeriDonBtn.UseVisualStyleBackColor = false;
            this.GeriDonBtn.Click += new System.EventHandler(this.GeriDonBtn_Click);
            // 
            // Sepet
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.Tan;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.GeriDonBtn);
            this.Controls.Add(this.TamamBtn);
            this.Controls.Add(this.Sepet_dataGridView);
            this.Name = "Sepet";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Sepet";
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.Sepet_FormClosed);
            this.Load += new System.EventHandler(this.Sepet_Load);
            ((System.ComponentModel.ISupportInitialize)(this.Sepet_dataGridView)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView Sepet_dataGridView;
        private System.Windows.Forms.Button TamamBtn;
        private System.Windows.Forms.Button GeriDonBtn;
        private System.Windows.Forms.DataGridViewTextBoxColumn UrunAdi;
        private System.Windows.Forms.DataGridViewTextBoxColumn KitapUcret;
    }
}