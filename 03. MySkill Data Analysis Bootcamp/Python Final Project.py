import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from pandas.tseries.offsets import BDay

# Menjalankan SQL di Colab
from sqlite3 import connect
conn = connect(':memory:')

# Sumber data yang digunakan
path_od = "https://raw.githubusercontent.com/dataskillsboost/FinalProjectDA11/main/order_detail.csv"
path_pd = "https://raw.githubusercontent.com/dataskillsboost/FinalProjectDA11/main/payment_detail.csv"
path_cd = "https://raw.githubusercontent.com/dataskillsboost/FinalProjectDA11/main/customer_detail.csv"
path_sd = "https://raw.githubusercontent.com/dataskillsboost/FinalProjectDA11/main/sku_detail.csv"

df_od = pd.read_csv(path_od)
df_pd = pd.read_csv(path_pd)
df_cd = pd.read_csv(path_cd)
df_sd = pd.read_csv(path_sd)

df_od.to_sql('order_detail', conn, index=False, if_exists='replace')
df_pd.to_sql('payment_detail', conn, index=False, if_exists='replace')
df_sd.to_sql('sku_detail', conn, index=False, if_exists='replace')
df_cd.to_sql('customer_detail', conn, index=False, if_exists='replace')

# Query SQL untuk menggabungkan data
df = pd.read_sql("""
SELECT 
    order_detail.*,
    payment_detail.payment_method,
    sku_detail.sku_name,
    sku_detail.base_price,
    sku_detail.cogs,
    sku_detail.category,
    customer_detail.registered_date
FROM order_detail
LEFT JOIN payment_detail
    ON payment_detail.id = order_detail.payment_id
LEFT JOIN sku_detail
    ON sku_detail.id = order_detail.sku_id
LEFT JOIN customer_detail
    ON customer_detail.id = order_detail.customer_id
""", conn)

# Mengubah tipe data agar mudah dilakukan pengolahan data
df = df.astype({"before_discount":'int', "discount_amount":'int',
                "after_discount":'int',"base_price":'int'})
df.dtypes

# Mengubah tipe kolom Date menjadi Datetime
df['order_date'] = pd.to_datetime(df['order_date'])
df['registered_date'] = pd.to_datetime(df['registered_date'])
df.dtypes


# ==============================================================================
# CASE 1: TOP 5 Produk Kategori Mobiles & Tablets Tahun 2022
# ==============================================================================

# 1. Memfilter data dengan valid = 1, Category = 'Mobiles & Tablets', dan Tahun = 2022
df_filtered = df[(df['is_valid'] == 1) & 
                 (df['category'] == 'Mobiles & Tablets') & 
                 (df['order_date'].dt.year == 2022)]

# 2. Gunakan groupby berdasarkan sku_name dan jumlahkan kuantitasnya (qty_ordered)
top_products = df_filtered.groupby('sku_name')['qty_ordered'].sum().reset_index()

# 3. Gunakan sort_values untuk mengurutkan data dari yang tertinggi
top_products_sorted = top_products.sort_values(by='qty_ordered', ascending=False)

# 4. Gunakan head untuk menampilkan top 5 produk
top_5_mobiles_tablets = top_products_sorted.head(5)

top_5_mobiles_tablets


# ==============================================================================
# CASE 2.1: TOP 15 Perbandingan Penjualan Category Tahun 2021 vs 2022
# ==============================================================================

# 1. Memfilter data dengan is_valid = 1
df_valid = df[df['is_valid'] == 1]

# 2. Memfilter data transaksi selama 2021 dan groupby per kategori
df_2021 = df_valid[df_valid['order_date'].dt.year == 2021]
qty_2021 = df_2021.groupby('category')['qty_ordered'].sum().reset_index(name='qty_2021')

# 3. Memfilter data transaksi selama 2022 dan groupby per kategori
df_2022 = df_valid[df_valid['order_date'].dt.year == 2022]
qty_2022 = df_2022.groupby('category')['qty_ordered'].sum().reset_index(name='qty_2022')

# 4. Menggabungkan kedua data dengan merge
df_category_compare = pd.merge(qty_2021, qty_2022, on='category', how='outer').fillna(0)

# 5. Lakukan pengurangan kolom qty 2022 dengan qty 2021 untuk melihat selisih (growth/penurunan)
df_category_compare['qty_diff'] = df_category_compare['qty_2022'] - df_category_compare['qty_2021']

# Menampilkan data ke-15 kategori diurutkan dari penurunan tertinggi (paling minus)
display(df_category_compare.sort_values(by='qty_diff', ascending=True))


# ==============================================================================
# CASE 2.2: TOP 20 Perbandingan Penjualan Produk Kategori Others Tahun 2021 vs 2022
# ==============================================================================

# 1. Filter data: valid = 1 dan kategori = 'Others'
df_others = df_valid[df_valid['category'] == 'Others']

# 2. Hitung kuantitas terjual per produk di tahun 2021
df_others_2021 = df_others[df_others['order_date'].dt.year == 2021]
prod_2021 = df_others_2021.groupby('sku_name')['qty_ordered'].sum().reset_index(name='qty_2021')

# 3. Hitung kuantitas terjual per produk di tahun 2022
df_others_2022 = df_others[df_others['order_date'].dt.year == 2022]
prod_2022 = df_others_2022.groupby('sku_name')['qty_ordered'].sum().reset_index(name='qty_2022')

# 4. Gabungkan data produk 2021 dan 2022
df_prod_compare = pd.merge(prod_2021, prod_2022, on='sku_name', how='outer').fillna(0)

# 5. Hitung selisih penurunan (2022 - 2021)
df_prod_compare['qty_diff'] = df_prod_compare['qty_2022'] - df_prod_compare['qty_2021']

# 6. Urutkan dari yang paling minus (penurunan tertinggi) dan ambil TOP 20
top_20_decline_others = df_prod_compare.sort_values(by='qty_diff', ascending=True).head(20)

display(top_20_decline_others)


# ==============================================================================
# CASE 3: Retargeting Warm Leads (Audience List 2022)
# ==============================================================================

# 1. Memfilter data sesuai kriteria Tim Digital Marketing
# is_gross = 1, is_valid = 0, is_net = 0, dan Tahun Transaksi = 2022
df_marketing_target = df[
    (df['is_gross'] == 1) &
    (df['is_valid'] == 0) &
    (df['is_net'] == 0) &
    (df['order_date'].dt.year == 2022)
]

# 2. Mengambil kolom customer_id dan registered_date, lalu menghapus data duplikat
audience_list = df_marketing_target[['customer_id', 'registered_date']].drop_duplicates()

# Menampilkan hasil data
display(audience_list)


# ==============================================================================
# CASE 4: Perbandingan Rata-Rata Penjualan Harian (Weekday vs Weekend) Okt-Des 2022
# ==============================================================================


# 1. Buat kolom baru untuk day_name, month_name, dan month_num
df['day'] = df['order_date'].dt.day_name()
df['month'] = df['order_date'].dt.month_name()
df['month_num'] = df['order_date'].dt.month

# Langkah 2: Memfilter data dengan valid = 1
df_valid = df[df['is_valid'] == 1]

# Langkah 3: Memfilter data pada transaksi selama 2022 bulan Oktober sampai dengan Des
# (Bulan 10 = Oktober, 11 = November, 12 = Desember)
df_campaign = df_valid[
    (df_valid['order_date'].dt.year == 2022) &
    (df_valid['month_num'].isin([10, 11, 12]))
]

# Langkah 4: Memfilter data dengan day termasuk 'Saturday', 'Sunday' (isin) -> simpan di 'weekends'
df_weekends = df_campaign[df_campaign['day'].isin(['Saturday', 'Sunday'])]

# Langkah 5: Memfilter data dengan day termasuk hari kerja (isin) -> simpan di 'weekday'
df_weekday = df_campaign[df_campaign['day'].isin(['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'])]

# Langkah 7: Gunakan groupby berdasarkan masing-masing variabel (harian dulu agar adil, lalu per bulan)
# Hitung total penjualan harian untuk weekends
daily_weekends = df_weekends.groupby(['month_num', 'month', 'order_date'])['before_discount'].sum().reset_index()
# Hitung rata-rata harian per bulan untuk weekends
avg_weekends = daily_weekends.groupby(['month_num', 'month'])['before_discount'].mean().reset_index(name='avg_weekend')

# Hitung total penjualan harian untuk weekday
daily_weekday = df_weekday.groupby(['month_num', 'month', 'order_date'])['before_discount'].sum().reset_index()
# Hitung rata-rata harian per bulan untuk weekday
avg_weekday = daily_weekday.groupby(['month_num', 'month'])['before_discount'].mean().reset_index(name='avg_weekday')

# Langkah 8: Menggabungkan kedua data dengan merge dan hitung selisih
monthly_compare = pd.merge(avg_weekday, avg_weekends, on=['month_num', 'month'])
monthly_compare['Peningkatan_IDR'] = monthly_compare['avg_weekend'] - monthly_compare['avg_weekday']

# Tampilkan tabel perbandingan secara ringkas
print(monthly_compare)
print("\n" + "="*100 + "\n")

# Langkah 8: Tampilkan grafik batang perbedaan per bulan (langsung pakai monthly_avg)
plt.figure(figsize=(10, 6))
plt.ticklabel_format(style='plain', axis='y')
sns.barplot(x='month', y='avg_sales', hue='day_type', data=monthly_avg, palette='Set1')
plt.title('Perbandingan Rata-rata Penjualan Harian Weekdays vs Weekends per Bulan\n(Oktober - Desember 2022)')
plt.xlabel('Bulan')
plt.ylabel('Rata-rata Penjualan (IDR)')
plt.grid(axis='y', linestyle='--', alpha=0.7)
plt.show()
