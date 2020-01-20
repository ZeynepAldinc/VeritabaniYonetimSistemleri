namespace VeriTabani_Proje
{
    partial class Yorum
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
            this.YorumYap_Btn = new System.Windows.Forms.Button();
            this.Yorum_TB = new System.Windows.Forms.TextBox();
            this.GeriDon_Btn = new System.Windows.Forms.Button();
            this.Yorum_dataGridView = new System.Windows.Forms.DataGridView();
            this.Adi_DGV = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Soyadi_DGV = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Yorum_DGV = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Yorum_LB = new System.Windows.Forms.Label();
            this.BenimYorumlarim_Btn = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.Yorum_dataGridView)).BeginInit();
            this.SuspendLayout();
            // 
            // YorumYap_Btn
            // 
            this.YorumYap_Btn.BackColor = System.Drawing.Color.Tan;
            this.YorumYap_Btn.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.YorumYap_Btn.ForeColor = System.Drawing.SystemColors.ControlText;
            this.YorumYap_Btn.Location = new System.Drawing.Point(915, 400);
            this.YorumYap_Btn.Margin = new System.Windows.Forms.Padding(4);
            this.YorumYap_Btn.Name = "YorumYap_Btn";
            this.YorumYap_Btn.Size = new System.Drawing.Size(136, 42);
            this.YorumYap_Btn.TabIndex = 0;
            this.YorumYap_Btn.Text = "Yorum Yap";
            this.YorumYap_Btn.UseVisualStyleBackColor = false;
            this.YorumYap_Btn.Click += new System.EventHandler(this.YorumYap_Btn_Click);
            // 
            // Yorum_TB
            // 
            this.Yorum_TB.BackColor = System.Drawing.Color.Linen;
            this.Yorum_TB.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.Yorum_TB.Location = new System.Drawing.Point(16, 400);
            this.Yorum_TB.Margin = new System.Windows.Forms.Padding(4);
            this.Yorum_TB.Multiline = true;
            this.Yorum_TB.Name = "Yorum_TB";
            this.Yorum_TB.Size = new System.Drawing.Size(889, 142);
            this.Yorum_TB.TabIndex = 1;
            // 
            // GeriDon_Btn
            // 
            this.GeriDon_Btn.BackColor = System.Drawing.Color.Tan;
            this.GeriDon_Btn.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.GeriDon_Btn.Location = new System.Drawing.Point(915, 500);
            this.GeriDon_Btn.Margin = new System.Windows.Forms.Padding(4);
            this.GeriDon_Btn.Name = "GeriDon_Btn";
            this.GeriDon_Btn.Size = new System.Drawing.Size(136, 42);
            this.GeriDon_Btn.TabIndex = 2;
            this.GeriDon_Btn.Text = "Geri Dön";
            this.GeriDon_Btn.UseVisualStyleBackColor = false;
            this.GeriDon_Btn.Click += new System.EventHandler(this.GeriDon_Btn_Click);
            // 
            // Yorum_dataGridView
            // 
            this.Yorum_dataGridView.AllowUserToAddRows = false;
            this.Yorum_dataGridView.AllowUserToDeleteRows = false;
            this.Yorum_dataGridView.BackgroundColor = System.Drawing.Color.Tan;
            this.Yorum_dataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.Yorum_dataGridView.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.Adi_DGV,
            this.Soyadi_DGV,
            this.Yorum_DGV});
            this.Yorum_dataGridView.Location = new System.Drawing.Point(16, 86);
            this.Yorum_dataGridView.Margin = new System.Windows.Forms.Padding(4);
            this.Yorum_dataGridView.Name = "Yorum_dataGridView";
            this.Yorum_dataGridView.ReadOnly = true;
            this.Yorum_dataGridView.Size = new System.Drawing.Size(1035, 306);
            this.Yorum_dataGridView.TabIndex = 3;
            // 
            // Adi_DGV
            // 
            this.Adi_DGV.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.Adi_DGV.DataPropertyName = "Isim";
            this.Adi_DGV.HeaderText = "Adı";
            this.Adi_DGV.Name = "Adi_DGV";
            this.Adi_DGV.ReadOnly = true;
            // 
            // Soyadi_DGV
            // 
            this.Soyadi_DGV.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.Soyadi_DGV.DataPropertyName = "Soyisim";
            this.Soyadi_DGV.HeaderText = "Soyadı";
            this.Soyadi_DGV.Name = "Soyadi_DGV";
            this.Soyadi_DGV.ReadOnly = true;
            // 
            // Yorum_DGV
            // 
            this.Yorum_DGV.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.Yorum_DGV.DataPropertyName = "Yorum";
            this.Yorum_DGV.HeaderText = "Yorumu";
            this.Yorum_DGV.Name = "Yorum_DGV";
            this.Yorum_DGV.ReadOnly = true;
            // 
            // Yorum_LB
            // 
            this.Yorum_LB.AutoSize = true;
            this.Yorum_LB.Font = new System.Drawing.Font("Microsoft Sans Serif", 20.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.Yorum_LB.ForeColor = System.Drawing.Color.SaddleBrown;
            this.Yorum_LB.Location = new System.Drawing.Point(364, 9);
            this.Yorum_LB.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.Yorum_LB.Name = "Yorum_LB";
            this.Yorum_LB.Size = new System.Drawing.Size(367, 31);
            this.Yorum_LB.TabIndex = 4;
            this.Yorum_LB.Text = "Yorumunuz Bizim İçin Önemli";
            // 
            // BenimYorumlarim_Btn
            // 
            this.BenimYorumlarim_Btn.BackColor = System.Drawing.Color.Tan;
            this.BenimYorumlarim_Btn.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.BenimYorumlarim_Btn.Location = new System.Drawing.Point(915, 450);
            this.BenimYorumlarim_Btn.Margin = new System.Windows.Forms.Padding(4);
            this.BenimYorumlarim_Btn.Name = "BenimYorumlarim_Btn";
            this.BenimYorumlarim_Btn.Size = new System.Drawing.Size(136, 42);
            this.BenimYorumlarim_Btn.TabIndex = 5;
            this.BenimYorumlarim_Btn.Text = "Benim Yorumlarım";
            this.BenimYorumlarim_Btn.UseVisualStyleBackColor = false;
            this.BenimYorumlarim_Btn.Click += new System.EventHandler(this.BenimYorumlarim_Btn_Click);
            // 
            // Yorum
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.Tan;
            this.ClientSize = new System.Drawing.Size(1067, 554);
            this.Controls.Add(this.BenimYorumlarim_Btn);
            this.Controls.Add(this.Yorum_LB);
            this.Controls.Add(this.Yorum_dataGridView);
            this.Controls.Add(this.GeriDon_Btn);
            this.Controls.Add(this.Yorum_TB);
            this.Controls.Add(this.YorumYap_Btn);
            this.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "Yorum";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Yorum";
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.Yorum_FormClosed);
            this.Load += new System.EventHandler(this.Yorum_Load);
            ((System.ComponentModel.ISupportInitialize)(this.Yorum_dataGridView)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button YorumYap_Btn;
        private System.Windows.Forms.TextBox Yorum_TB;
        private System.Windows.Forms.Button GeriDon_Btn;
        private System.Windows.Forms.DataGridView Yorum_dataGridView;
        private System.Windows.Forms.Label Yorum_LB;
        private System.Windows.Forms.DataGridViewTextBoxColumn Adi_DGV;
        private System.Windows.Forms.DataGridViewTextBoxColumn Soyadi_DGV;
        private System.Windows.Forms.DataGridViewTextBoxColumn Yorum_DGV;
        private System.Windows.Forms.Button BenimYorumlarim_Btn;
    }
}