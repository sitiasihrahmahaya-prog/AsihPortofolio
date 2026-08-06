# MySkill Data Analysis Bootcamp Portfolio: Final Projects & Task Compilation

This page showcases my end-to-end data analytics projects completed during the **MySkill Fullstack Data Analysis Intensive Bootcamp**, covering SQL, Python, and Business Intelligence case studies using real-world e-commerce datasets. Throughout the bootcamp, I completed multiple business analytics projects involving data cleaning, SQL querying, exploratory data analysis (EDA), dashboard development, and business insight generation.

**Achievement**
- **Best Final Project Award** – MySkill Data Analysis Bootcamp Batch 28
- **Final Project Score:** **94/100 (Distinction)**
- Successfully completed the **MySkill Fullstack Data Analysis Intensive Bootcamp**

## Certificates

- [Certificate of Best Final Project](./Certificate%20Best%20Final%20Project.pdf)
- [Certificate of Final Project Report (Distinction – 94/100)](./Certificate%20Final%20Project%20Report.pdf)
- [Certificate of Completion – MySkill Data Analysis Bootcamp](./Certificate%20of%20Completion%20MySkill.pdf)

---

## 1. Project 1: SQL Final Project

Proyek ini mengevaluasi kinerja bisnis e-commerce **Tokopaedi** menggunakan SQL untuk menganalisis tren penjualan, kategori produk, saluran penjualan, efisiensi pemasaran, dan perilaku pelanggan.

### Case Studies & Key Insights
* **1. Trend Penjualan Bulanan (2024):** 
  * **Objective:** Mengetahui pola tren revenue bulanan tahun 2024.
  * **Key Insight:** Penjualan tertinggi terjadi di **Desember (Rp4,11 Miliar)** & **Mei (Rp2,72 Miliar)**. Penjualan terendah ada di **Juli (Rp1,10 Miliar)** & **Maret (Rp1,20 Miliar)**.

* **2. Kuantitas Terjual per Kategori (2020–2024):** 
  * **Objective:** Mengevaluasi volume unit barang terjual per kategori.
  * **Key Insight:** *Food & Beverage* dan *Fashion & Footwear* mendominasi unit terjual. Kategori *Fashion* melonjak drastis ke **5.143 unit** di 2024 (~85% naik), sementara *Toys & Games* terus menurun tiap tahun.

* **3. Performa Channel & YoY Growth:** 
  * **Objective:** Membandingkan performa transaksi dan revenue antar saluran penjualan.
  * **Key Insight:** *Offline Store* menghasilkan revenue terbesar (puncak Desember 2024 **Rp1,54 Miliar**) dengan rata-rata nilai transaksi (*AOV*) lebih tinggi (**~Rp5,68 juta**) dibanding kanal digital (**~Rp4 juta**).

* **4. Funnel Analysis & Conversion Rate:** 
  * **Objective:** Mengukur trafik dan rasio konversi untuk aktivitas berjenis "Organic".
  * **Key Insight:** *Website* mendatangkan trafik paling banyak (28.930 events), tetapi *Conversion Rate* tertinggi dipegang oleh *Mobile App* (**Play Store 2,22%** & **App Store 2,21%**).

* **5. Cohort Registrasi & Kecepatan Pembelian:** 
  * **Objective:** Mengukur rata-rata durasi (hari) dari pendaftaran akun hingga transaksi pertama.
  * **Key Insight:** *Mobile App* menggaet pengguna baru terbanyak, tetapi jeda transaksi pertamanya paling lambat (**~107,5 hari**). Pendaftar via *Website* terkonversi jauh lebih cepat (**~75 hari**).

### File Reference
* **Laporan Presentasi PDF:** [Lihat SQL Final Project PDF](./SQL%20Final%20Project%20-%202A%20Team.pdf)
* **Script SQL:** [Lihat Script Query SQL (.sql)](./SQL%20Query%20Final%20Project.sql)

---

## 2. Project 2: Python Data Analysis

Proyek ini berfokus pada analisis data transaksi *e-commerce* menggunakan **Python** untuk pembersihan data, penggabungan tabel, evaluasi penurunan penjualan, dan segmentasi *unpaid leads*.

### Dataset & Setup
* **Dataset**: `order_detail`, `sku_detail`, `customer_detail`, `payment_detail`.
* **Pipeline**: Import CSV via GitHub $\rightarrow$ Penggabungan (*LEFT JOIN*) via `sqlite3` in-memory database $\rightarrow$ Pembersihan & konversi tipe data (`datetime`, `int`) via `pandas`.

### Case Studies & Insights
* **Case 1: TOP 5 Produk 'Mobiles & Tablets' (2022)**
  * **Goal:** Menentukan produk hadiah kompetisi Festival Akhir Tahun.
  * **Result:** Menampilkan 5 produk teratas berdasarkan total unit ter-order (`qty_ordered`) pada kategori *Mobiles & Tablets* selama tahun 2022.

* **Case 2: Penurunan Penjualan Kategori 'Others' (2021 vs 2022)**
  * **Goal:** Mengevaluasi masalah penumpukan stok barang di gudang.
  * **Key Insight:** Kategori **Others** mengalami penurunan terbanyak (-155 unit), yang didorong utama oleh produk **`RB_Dettol Germ Busting Kit-bf`** (-155 unit).
  * **Action:** Evaluasi stok/expired date produk Dettol & buat program *clearance sale* untuk 19 produk berkinerja rendah lainnya.

* **Case 3: Retargeting Unpaid Orders (Warm Leads 2022)**
  * **Goal:** Mendapatkan daftar pelanggan yang sudah *checkout* tapi belum membayar (`is_gross == 1`, `is_valid == 0`).
  * **Key Insight:** Ditemukan **820 pelanggan unik (*warm leads*)**.
  * **Action:** Tim Marketing melakukan kampanye *retargeting* (diskon kilat/gratis ongkir) & Tim IT memeriksa kendala teknis pada *payment gateway*.

* **Case 4: Penjualan Harian Weekday vs Weekend (Q4 2022)**
  * **Goal:** Menilai efektivitas promosi akhir pekan (Oktober–Desember 2022).
  * **Key Insight:** Rata-rata penjualan **Weekday (Rp 7,52 Juta/hari)** lebih tinggi dibanding **Weekend (Rp 5,26 Juta/hari)**, dengan drop terbesar di bulan Desember (selisih Rp 4,43 Juta/hari di weekend).
  * **Action:** Dialihkannya sebagian budget promo ke hari kerja (*Weekday*) dan merancang ulang strategi kampanye weekend.

### 🛠 Tools & Tech
* **Language**: Python 3.14.6
* **Libraries**: Pandas, NumPy, Matplotlib, Seaborn, SQLite3
* **Platform**: Google Colab, Jupyter Notebook, Visual Studio Code

### File Reference
* **Laporan Presentasi PDF:** [Lihat Python Final Project PDF](./Python%20Final%20Project%20-%202A%20Team.pdf)
* **Script Python:** [Lihat Script Python (.py)](./Python%20Final%20Project.py)

---

## 3. Project 3: Data Visualization (Looker Studio)

Dashboard interaktif Looker Studio untuk pemantauan tren *campaign* bulanan serta evaluasi preferensi metode pembayaran pelanggan.

### Halaman 1: Campaign Trend 2022
* **Objective:** Memantau tren bulanan dan hubungan antara **Value Sales**, **Net Profit**, dan **Average Order Value (AOV)**.
* **Calculated Fields:**
  * `net_profit` = `after_discount - (cogs * qty_ordered)`.
  * `aov` = `SUM(before_discount) / COUNT_DISTINCT(id)`
* **Key Insights:**
  * Lonjakan tajam pada **Value Sales (Rp559 Juta)** dan **AOV (Rp7,66 Juta)** terjadi di **September 2022**.
  * Didominasi oleh **satu transaksi tunggal** (Order ID: `ODR4269164386x`) produk `"IDROID_BALRX7-Gold"` sebanyak 1.000 unit senilai **Rp518.752.000** (~93% dari total sales bulan tersebut).

### Halaman 2: Deep Dive Kategori (Mobiles & Tablets)
* **Objective:** Mengukur performa detail kategori `Mobiles & Tablets` serta memverifikasi transaksi metode pembayaran `jazzwallet` sepanjang 2022.
* **Summary Metrics (Valid Orders):**
  * **Before Discount:** Rp 2.251.552.286 | **After Discount:** Rp 2.248.577.473
  * **Net Profit:** Rp 340.487.557 | **AOV:** Rp 10.006.899,05
  * **Total Qty:** 2.413 unit | **Unique Customers:** 177 pelanggan
* **Key Insights:**
  * **Mobiles & Tablets** merupakan penopang utama omzet dengan nilai AOV sangat tinggi (~Rp10 Juta/order)
  * **Temuan Metode Pembayaran:** **TIDAK ADA transaksi valid** di tahun 2022 untuk kategori ini yang menggunakan `jazzwallet`. Hilangnya opsi ini di filter murni karena fakta data bernilai 0 (pelanggan lebih condong memakai *Payaxis*, *COD*, atau *Easypay*).

### File Reference
* **Laporan Presentasi PDF:** [Lihat Data Visualization Final Project PDF](./Data%20Visualization%20Final%20Project%20-%202A%20Team.pdf)
* **Live Dashboard Access:** [Looker Studio Dashboard - Final Project](https://datastudio.google.com/u/0/reporting/0a1bb4d5-6383-433a-bbb7-76280b56402b/page/p_rdgj8ktp5d)

---

## 4. Project 4: Bootcamp Task Compilation

Kumpulan tugas-tugas latihan bootcamp menggunakan Sheets/Excel, SQL, Python dan Google Data Studio.

### File Reference
* **Dokumen Portofolio Tugas (PDF):** [Lihat PDF Bootcamp Tasks Portfolio](./Bootcamp%20Tasks%20Portfolio_Siti%20Asih%20Rahmahaya.pdf)
* **Alternative Drive Access:** Jika file PDF di atas tidak dapat dibuka, akses via Google Drive: [Buka Portofolio Tugas di Google Drive](https://drive.google.com/file/d/18gLCIj2vC291LWsdOhyje_P2SeFOl9ED/view?usp=sharing)

### Task & Dashboard Direct Links
Seluruh detail latihan dan live link yang dicantumkan dalam tasks portofolio di atas dapat diakses langsung melalui link berikut:

* **Task 1: Basic Statistics**
  * Latihan analisis statistik dasar (Mean, Standard Deviation, Variance, Z-Score, Percentile)
  *  [Buka Spreadsheet Task 1](https://docs.google.com/spreadsheets/d/1GgakGZO51tqHBU9-y_JU4SikLxT_q_03/edit?usp=sharing&ouid=111599441588594077359&rtpof=true&sd=true)

* **Task 2: Superstore Data Cleaning & Validation**
  * Latihan Data Formatting, Data Cleansing, Data Validation.
  *  [Buka Spreadsheet Task 5](https://docs.google.com/spreadsheets/d/1uI5t-pknz2vD1sET7_gbmYK9_xJCnsVBWYsR57NOd70/edit?usp=sharing)

* **Task 12: Interactive Campaign & Sales Dashboard (Looker Studio)**
  * Dashboard interaktif untuk pemantauan performa *campaign* dan kategori produk `Mobiles & Tablets`
  *  [Buka Looker Studio Dashboard](https://datastudio.google.com/u/0/reporting/e263a6c5-fb27-40e2-9099-0363ce081341/page/wM43F)
