-- Query SELECT

-- QUERY 1 (Sederhana) - Daftar semua kamar beserta tipe kamarnya
SELECT
    k.id_kamar,
    k.nomor_kamar,
    k.lantai,
    k.status_kamar,
    t.nama_tipe,
    t.harga_dasar
FROM kamar k
JOIN tipe_kamar t ON k.id_tipe = t.id_tipe
ORDER BY k.lantai, k.nomor_kamar;

-- QUERY 2 (Sederhana) - Daftar tamu yang pernah menginap
SELECT
    tm.id_tamu,
    tm.nama_tamu,
    tm.alamat,
    tm.no_hp,
    tm.email
FROM tamu tm
ORDER BY tm.nama_tamu;

-- QUERY 3 (Sederhana) - Pembayaran yang menggunakan metode Transfer
SELECT
    p.id_pembayaran,
    p.tanggal_bayar,
    p.jumlah_bayar,
    p.metode_bayar,
    p.status_bayar,
    p.id_reservasi
FROM pembayaran p
WHERE p.metode_bayar = 'Transfer'
ORDER BY p.tanggal_bayar DESC;

-- QUERY 4 (JOIN ≥ 3 tabel) - Detail lengkap reservasi tamu
-- Gabung: reservasi + tamu + kamar + tipe_kamar
SELECT
    r.id_reservasi,
    tm.nama_tamu,
    tm.no_hp,
    k.nomor_kamar,
    t.nama_tipe,
    r.check_in,
    r.check_out,
    DATEDIFF(r.check_out, r.check_in) AS lama_menginap, -- DATEDIFF untuk menghitung selisih waktu checkout dan checkin
    r.jumlah_tamu,
    r.status_reservasi
FROM reservasi r
JOIN tamu       tm ON r.id_tamu   = tm.id_tamu
JOIN kamar      k  ON r.id_kamar  = k.id_kamar
JOIN tipe_kamar t  ON k.id_tipe   = t.id_tipe
ORDER BY r.tanggal_pesan;

-- QUERY 5 (JOIN ≥ 3 tabel) - Riwayat pembayaran lengkap dengan info tamu
-- Gabung: pembayaran + reservasi + tamu + kamar
SELECT
    pb.id_pembayaran,
    tm.nama_tamu,
    k.nomor_kamar,
    r.check_in,
    r.check_out,
    pb.jumlah_bayar,
    pb.metode_bayar,
    pb.status_bayar,
    pb.tanggal_bayar
FROM pembayaran pb
JOIN reservasi  r  ON pb.id_reservasi = r.id_reservasi
JOIN tamu       tm ON r.id_tamu       = tm.id_tamu
JOIN kamar      k  ON r.id_kamar      = k.id_kamar
ORDER BY pb.tanggal_bayar;

-- QUERY 6 (JOIN ≥ 3 tabel) - Detail check-in beserta pegawai & tamu
-- Gabung: check_in + reservasi + tamu + pegawai
SELECT
    ci.id_checkin,
    ci.waktu_checkin,
    tm.nama_tamu,
    k.nomor_kamar,
    t.nama_tipe,
    pg.nama_pegawai AS petugas_checkin,
    pg.jabatan
FROM check_in   ci
JOIN reservasi  r  ON ci.id_reservasi = r.id_reservasi
JOIN tamu       tm ON r.id_tamu       = tm.id_tamu
JOIN kamar      k  ON r.id_kamar      = k.id_kamar
JOIN tipe_kamar t  ON k.id_tipe       = t.id_tipe
JOIN pegawai    pg ON ci.id_pegawai   = pg.id_pegawai
ORDER BY ci.waktu_checkin;

-- QUERY 7 (JOIN ≥ 3 tabel) - Ulasan tamu beserta detail kamar
-- Gabung: ulasan + reservasi + tamu + kamar + tipe_kamar
SELECT
    u.id_ulasan,
    tm.nama_tamu,
    k.nomor_kamar,
    t.nama_tipe,
    u.rating,
    u.komentar,
    u.tanggal_ulasan
FROM ulasan     u
JOIN reservasi  r  ON u.id_reservasi = r.id_reservasi
JOIN tamu       tm ON r.id_tamu      = tm.id_tamu
JOIN kamar      k  ON r.id_kamar     = k.id_kamar
JOIN tipe_kamar t  ON k.id_tipe      = t.id_tipe
ORDER BY u.rating DESC, u.tanggal_ulasan;

-- QUERY 8 (Subquery) - Tamu yang total pembayarannya
-- melebihi rata-rata pembayaran seluruh tamu
SELECT
    tm.nama_tamu,
    tm.email,
    SUM(pb.jumlah_bayar) AS total_pembayaran
FROM tamu       tm
JOIN reservasi  r  ON tm.id_tamu      = r.id_tamu
JOIN pembayaran pb ON r.id_reservasi  = pb.id_reservasi
GROUP BY tm.id_tamu, tm.nama_tamu, tm.email -- Mengelompokkan data berdasarkan tamu
HAVING SUM(pb.jumlah_bayar) > ( -- Memfilter hasil setelah agregasi, dan menampilkan data dengan total pembayaran > rata-rata
    SELECT AVG(sub.total)
    FROM (
        SELECT SUM(pb2.jumlah_bayar) AS total
        FROM pembayaran pb2
        JOIN reservasi r2 ON pb2.id_reservasi = r2.id_reservasi
        GROUP BY r2.id_tamu
    ) sub
)
ORDER BY total_pembayaran DESC;

-- QUERY 9 (CTE) - Ranking tipe kamar berdasarkan jumlah reservasi
-- menggunakan Common Table Expression (CTE)
WITH reservasi_per_tipe AS ( -- WITH digunakan untuk membuat tabel sementara, tabel tsb hanya akan ada selama query dijalankan
    SELECT
        t.id_tipe,
        t.nama_tipe,
        t.harga_dasar,
        COUNT(r.id_reservasi) AS jumlah_reservasi,
        SUM(pb.jumlah_bayar)  AS total_pendapatan
    FROM tipe_kamar t
    JOIN kamar      k  ON t.id_tipe      = k.id_tipe
    JOIN reservasi  r  ON k.id_kamar     = r.id_kamar
    JOIN pembayaran pb ON r.id_reservasi = pb.id_reservasi
    GROUP BY t.id_tipe, t.nama_tipe, t.harga_dasar
)
SELECT
    nama_tipe,
    harga_dasar,
    jumlah_reservasi,
    total_pendapatan,
    RANK() OVER (ORDER BY jumlah_reservasi DESC) AS ranking_populer
FROM reservasi_per_tipe
ORDER BY ranking_populer;

-- QUERY 10 (Agregat + GROUP BY + HAVING) - Pegawai yang menangani
-- lebih dari 3 proses check-in, beserta total transaksi
SELECT
    pg.id_pegawai,
    pg.nama_pegawai,
    pg.jabatan,
    COUNT(ci.id_checkin) AS jumlah_checkin,
    COUNT(co.id_checkout) AS jumlah_checkout,
    COUNT(ci.id_checkin) + COUNT(co.id_checkout) AS total_transaksi
FROM pegawai pg
LEFT JOIN check_in  ci ON pg.id_pegawai = ci.id_pegawai
LEFT JOIN check_out co ON pg.id_pegawai = co.id_pegawai
GROUP BY pg.id_pegawai, pg.nama_pegawai, pg.jabatan
HAVING COUNT(ci.id_checkin) > 3
ORDER BY total_transaksi DESC;