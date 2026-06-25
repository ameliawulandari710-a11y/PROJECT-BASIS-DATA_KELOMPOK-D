-- FUNCTION

-- FUNCTION : fn_hitung_total_tagihan
-- Fungsi  : Menghitung total tagihan sebuah reservasi berdasarkan
--           lama menginap (selisih check_out - check_in) dikalikan
--           harga dasar tipe kamar yang dipesan, lalu ditambah
--           biaya fasilitas tambahan yang dipilih tamu.
-- Parameter:
--   p_id_reservasi - ID reservasi yang ingin dihitung
-- Return   : DECIMAL(12,2) - Total tagihan dalam Rupiah

DELIMITER //

CREATE FUNCTION fn_hitung_total_tagihan(p_id_reservasi VARCHAR(5))
RETURNS DECIMAL(12,2)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE v_harga_dasar DECIMAL(12,2);
    DECLARE v_lama INT;
    DECLARE v_total DECIMAL(12,2);

    SELECT
        t.harga_dasar,
        DATEDIFF(r.check_out, r.check_in)
    INTO v_harga_dasar, v_lama
    FROM reservasi r
    JOIN kamar k ON r.id_kamar = k.id_kamar
    JOIN tipe_kamar t ON k.id_tipe = t.id_tipe
    WHERE r.id_reservasi = p_id_reservasi;

    SET v_total = v_lama * v_harga_dasar;

    RETURN v_total;
END//

DELIMITER ;
SELECT fn_hitung_total_tagihan('R001') AS total_tagihan;