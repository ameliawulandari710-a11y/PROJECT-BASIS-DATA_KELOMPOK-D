-- VIEW

-- VIEW 1: v_reservasi_lengkap
-- Menampilkan ringkasan reservasi secara lengkap, berguna bagi
-- resepsionis untuk melihat seluruh data tamu, kamar, dan status.
CREATE VIEW v_reservasi_lengkap AS
SELECT
    r.id_reservasi,
    r.tanggal_pesan,
    r.check_in,
    r.check_out,
    DATEDIFF(r.check_out, r.check_in) AS lama_menginap,
    r.jumlah_tamu,
    r.status_reservasi,
    -- Info tamu
    tm.id_tamu,
    tm.nama_tamu,
    tm.no_hp AS hp_tamu,
    tm.email AS email_tamu,
    -- Info kamar
    k.nomor_kamar,
    k.lantai,
    t.nama_tipe,
    t.kapasitas,
    t.harga_dasar,
    -- Info pembayaran
    pb.id_pembayaran,
    pb.jumlah_bayar,
    pb.metode_bayar,
    pb.status_bayar,
    -- Kalkulasi total tagihan berdasar lama menginap × harga dasar
    (DATEDIFF(r.check_out, r.check_in) * t.harga_dasar) AS tagihan_normal
FROM reservasi r
JOIN tamu tm ON r.id_tamu = tm.id_tamu
JOIN kamar k ON r.id_kamar = k.id_kamar
JOIN tipe_kamar t ON k.id_tipe = t.id_tipe
LEFT JOIN pembayaran pb ON r.id_reservasi = pb.id_reservasi;
-- Contoh penggunaan:
-- SELECT * FROM v_reservasi_lengkap WHERE status_reservasi = 'Dipesan';

-- VIEW 2: v_statistik_kamar
-- Menampilkan statistik kinerja setiap tipe kamar: jumlah
-- reservasi, total pendapatan, dan rata-rata rating ulasan.
-- Berguna bagi manajemen untuk evaluasi performa kamar.
CREATE VIEW v_statistik_kamar AS
SELECT
    t.id_tipe,
    t.nama_tipe,
    t.kapasitas,
    t.harga_dasar,
    COUNT(DISTINCT r.id_reservasi) AS total_reservasi,
    SUM(pb.jumlah_bayar) AS total_pendapatan,
    ROUND(AVG(pb.jumlah_bayar), 0) AS rata_pendapatan_per_res, -- ROUND untuk membulatkan angka dari desimal ke int, misal 60000,75 menjadi 60001
    ROUND(AVG(u.rating), 2) AS rata_rating,
    COUNT(DISTINCT u.id_ulasan) AS jumlah_ulasan -- DISTINT untuk menghilangkan data yang duplikat sehingga hanya menampilkan nilai unik
FROM tipe_kamar t
LEFT JOIN kamar k ON t.id_tipe = k.id_tipe
LEFT JOIN reservasi r ON k.id_kamar = r.id_kamar
LEFT JOIN pembayaran pb ON r.id_reservasi = pb.id_reservasi
LEFT JOIN ulasan u ON r.id_reservasi = u.id_reservasi
GROUP BY t.id_tipe, t.nama_tipe, t.kapasitas, t.harga_dasar;
-- Contoh penggunaan:
-- SELECT * FROM v_statistik_kamar ORDER BY total_pendapatan DESC;