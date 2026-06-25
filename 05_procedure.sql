-- STORED PROCEDURE

USE hotel_reservasi;

DELIMITER //

-- PROCEDURE: sp_buat_reservasi
-- Fungsi  : Membuat reservasi baru dan mengubah status kamar menjadi 'Dipesan'.
-- Parameter:
--   p_id_reservasi - ID reservasi baru (mis: 'R021')
--   p_id_tamu      - ID tamu yang memesan
--   p_id_kamar     - ID kamar yang dipesan
--   p_check_in     - Tanggal check-in
--   p_check_out    - Tanggal check-out
--   p_jumlah_tamu  - Jumlah tamu

CREATE PROCEDURE sp_buat_reservasi(
    IN p_id_reservasi VARCHAR(5),
    IN p_id_tamu VARCHAR(7),
    IN p_id_kamar VARCHAR(5),
    IN p_check_in DATE,
    IN p_check_out DATE,
    IN p_jumlah_tamu TINYINT
)
BEGIN
    -- Insert reservasi baru
    INSERT INTO reservasi
        (id_reservasi, tanggal_pesan, check_in, check_out,
         jumlah_tamu, status_reservasi, id_tamu, id_kamar)
    VALUES
        (p_id_reservasi, CURDATE(), p_check_in, p_check_out,
         p_jumlah_tamu, 'Dipesan', p_id_tamu, p_id_kamar);

    -- Update status kamar menjadi Dipesan
    UPDATE kamar -- Mengupdate tabel
    SET status_kamar = 'Dipesan' -- Mengubah status kamar setelah ada yang reservasi
    WHERE id_kamar = p_id_kamar; -- Hanya kamar yang dipilih

    SELECT CONCAT('Reservasi ', p_id_reservasi, ' berhasil dibuat.') AS hasil; -- CONCAT untuk menggabungkan teks (Reservasi R021 berhasil dibuat)
END //

DELIMITER ;
CALL sp_buat_reservasi('R021','TM003','K045','2026-09-01','2026-09-04',2);
-- Contoh pemanggilan:
-- CALL sp_buat_reservasi('R021','TM003','K045','2026-09-01','2026-09-04',2);