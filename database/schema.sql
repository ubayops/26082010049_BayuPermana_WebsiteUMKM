CREATE DATABASE IF NOT EXISTS db_umkm;

USE db_umkm;

CREATE TABLE kategori (
    id_kategori INT AUTO_INCREMENT PRIMARY KEY,
    nama_kategori VARCHAR(100) NOT NULL,
    deskripsi VARCHAR(255)
);

CREATE TABLE umkm (
    id_umkm INT AUTO_INCREMENT PRIMARY KEY,
    id_kategori INT NOT NULL,
    nama_umkm VARCHAR(100) NOT NULL,
    pemilik VARCHAR(100) NOT NULL,
    alamat VARCHAR(255),
    FOREIGN KEY (id_kategori) REFERENCES kategori(id_kategori)
);

CREATE TABLE produk (
    id_produk INT AUTO_INCREMENT PRIMARY KEY,
    id_umkm INT NOT NULL,
    nama_produk VARCHAR(100) NOT NULL,
    harga DECIMAL(12,2) NOT NULL,
    stok INT NOT NULL,
    FOREIGN KEY (id_umkm) REFERENCES umkm(id_umkm)
);

INSERT INTO kategori (nama_kategori, deskripsi) VALUES
('Kuliner', 'Usaha makanan dan minuman'),
('Fashion', 'Usaha pakaian dan aksesoris'),
('Kerajinan', 'Produk kerajinan tangan'),
('Jasa', 'Usaha yang menyediakan layanan'),
('Pertanian', 'Produk hasil pertanian');

INSERT INTO umkm (id_kategori, nama_umkm, pemilik, alamat) VALUES
(1, 'Yatea', 'Andi', 'Gresik'),
(1, 'Bakso Nusantara', 'Budi', 'Surabaya'),
(2, 'Fashion Kita', 'Citra', 'Sidoarjo'),
(3, 'Kriya Indah', 'Deni', 'Malang'),
(4, 'Digital Service', 'Eka', 'Gresik');

INSERT INTO produk (id_umkm, nama_produk, harga, stok) VALUES
(1, 'Milk Tea', 10000, 50),
(1, 'Thai Tea', 12000, 40),
(2, 'Bakso Special', 15000, 30),
(3, 'Kaos Premium', 75000, 20),
(4, 'Tas Rajut', 50000, 15);