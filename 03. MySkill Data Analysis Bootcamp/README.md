# 🚀 Data Analytics Portfolio — Final Projects & Task Compilation

Selamat datang di repositori portofolio Data Analytics! Repositori ini berisi rangkaian proyek analisis data *end-to-end* yang mencakup penggunaan **SQL**, **Python**, **Looker Studio**, dan **Spreadsheet/Excel**.

---

## 🗂 Table of Contents
1. [Project 1: SQL Analytics (Tokopaedi E-Commerce)](#1-project-1-sql-final-project)
2. [Project 2: Python Data Analysis](#2-project-2-python-data-analysis)
3. [Project 3: Data Visualization (Looker Studio Dashboard)](#3-project-3-data-visualization-looker-studio)
4. [Project 4: Bootcamp Task Compilation](#4-project-4-bootcamp-task-compilation)

---

## 1. Project 1: SQL Final Project

Proyek ini mengevaluasi kinerja bisnis e-commerce **Tokopaedi** menggunakan SQL untuk menganalisis tren penjualan, kategori produk, saluran penjualan, efisiensi pemasaran, dan perilaku pelanggan.

### 🎯 Case Studies & Key Insights
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

### 📁 File Reference
* **Laporan Presentasi PDF:** [Lihat SQL Final Project PDF](./SQL%20Final%20Project%20-%202A%20Team.pdf)
* **Script SQL:** [Lihat Script Query SQL (.sql)](./tokopaedi_analytics_query.sql)

---

## 2. Project 2: Python Data Analysis

Proyek ini berfokus pada analisis data transaksi *e-commerce* menggunakan **Python** untuk pembersihan data, penggabungan tabel, evaluasi penurunan penjualan, dan segmentasi *unpaid leads*.

### 📁 Dataset & Setup
* **Dataset**: `order_detail`, `sku_detail`, `customer_detail`, `payment_detail`.
* **Pipeline**: Import CSV via GitHub $\rightarrow$ Penggabungan (*LEFT JOIN*) via `sqlite3` in-memory database $\rightarrow$ Pembersihan & konversi tipe data (`datetime`, `int`) via `pandas`.

### 🎯 Case Studies & Insights
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
* **Language**: Python 3.x
* **Libraries**: Pandas, NumPy, Matplotlib, Seaborn, SQLite3
* **Platform**: Google Colab / Jupyter Notebook

---

## 3. Project 3: Data Visualization (Looker Studio)

Dashboard interaktif Looker Studio untuk pemantauan tren *campaign* bulanan serta evaluasi preferensi metode pembayaran pelanggan[cite: 2].

### 📈 Halaman 1: Campaign Trend 2022
* **Objective:** Memantau tren bulanan dan hubungan antara **Value Sales**, **Net Profit**, dan **Average Order Value (AOV)**[cite: 2].
* **Calculated Fields:**
  * `net_profit` = `after_discount - (cogs * qty_ordered)`[cite: 2]
  * `aov` = `SUM(before_discount) / COUNT_DISTINCT(id)`[cite: 2]
* **Key Insights:**
  * Lonjakan tajam pada **Value Sales (Rp559 Juta)** dan **AOV (Rp7,66 Juta)** terjadi di **September 2022**[cite: 2].
  * Didominasi oleh **satu transaksi tunggal** (Order ID: `ODR4269164386x`) produk `"IDROID_BALRX7-Gold"` sebanyak 1.000 unit senilai **Rp518.752.000** (~93% dari total sales bulan tersebut)[cite: 2].

### 📱 Halaman 2: Deep Dive Kategori (Mobiles & Tablets)
* **Objective:** Mengukur performa detail kategori `Mobiles & Tablets` serta memverifikasi transaksi metode pembayaran `jazzwallet` sepanjang 2022[cite: 2].
* **Summary Metrics (Valid Orders):**
  * **Before Discount:** Rp 2.251.552.286 | **After Discount:** Rp 2.248.577.473[cite: 2]
  * **Net Profit:** Rp 340.487.557 | **AOV:** Rp 10.006.899,05[cite: 2]
  * **Total Qty:** 2.413 unit | **Unique Customers:** 177 pelanggan[cite: 2]
* **Key Insights:**
  * **Mobiles & Tablets** merupakan penopang utama omzet dengan nilai AOV sangat tinggi (~Rp10 Juta/order)[cite: 2].
  * **Temuan Metode Pembayaran:** **TIDAK ADA transaksi valid** di tahun 2022 untuk kategori ini yang menggunakan `jazzwallet`[cite: 2]. Hilangnya opsi ini di filter murni karena fakta data bernilai 0 (pelanggan lebih condong memakai *Payaxis*, *COD*, atau *Easypay*)[cite: 2].

### 🔗 Live Dashboard Access
👉 **[Looker Studio Dashboard - Final Project](LINK_LOOKER_STUDIO_KAMU_DISINI)**

---

## 4. Project 4: Bootcamp Task Compilation

Kumpulan tugas-tugas latihan (*short tasks*) berbasis spreadsheet yang mencakup analisis statistik dasar dan validasi data ritel[cite: 2].

### 🔗 Deliverables & Task Links
* **Task 3: Basic Statistics & Sample Evaluation (Excel)**
  * Latihan analisis statistik dasar (Mean, Standard Deviation, Variance) pada sampel data[cite: 2].
  * 📊 [Buka Spreadsheet Task 3](https://docs.google.com/spreadsheets/d/1GgakGZO51tqHBU9-y_JU4SikLxT_q_03/edit?usp=sharing&ouid=111599441588594077359&rtpof=true&sd=true)[cite: 2]
* **Task 5: Superstore Data Cleaning & Validation (Excel)**
  * Latihan pembersihan data, format struktur, dan aturan validasi data ritel Superstore[cite: 2].
  * 📊 [Buka Spreadsheet Task 5](https://docs.google.com/spreadsheets/d/1uI5t-pknz2vD1sET7_gbmYK9_xJCnsVBWYsR57NOd70/edit?usp=sharing)[cite: 2]
* **Dokumen Portofolio Tugas:** [Lihat PDF Bootcamp Tasks Portfolio](./Bootcamp%20Tasks%20Portfolio_Siti%20Asih%20Rahmah.pdf)
