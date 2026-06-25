-- TRIGGER
 
-- TRIGGER 1: trg_after_checkout_update_kamar
-- Fungsi  : Setelah baris baru masuk ke tabel check_out,
--           status kamar terkait otomatis diubah menjadi
--           'Tersedia', dan status reservasi diubah 'Selesai'.
--           Kejadian ini juga dicatat ke tabel audit_log.
 DELIMITER //
 
CREATE TRIGGER trg_after_checkout_update_kamar
AFTER INSERT ON check_out
FOR EACH ROW
BEGIN
    DECLARE v_id_kamar VARCHAR(5);
    DECLARE v_nama_tamu VARCHAR(100);
 
    -- Ambil id_kamar dari reservasi terkait
    SELECT r.id_kamar, tm.nama_tamu
    INTO   v_id_kamar, v_nama_tamu
    FROM   reservasi r
    JOIN   tamu tm ON r.id_tamu = tm.id_tamu
    WHERE  r.id_reservasi = NEW.id_reservasi;
 
    -- Update status kamar menjadi Tersedia
    UPDATE kamar
    SET    status_kamar = 'Tersedia'
    WHERE  id_kamar = v_id_kamar;
 
    -- Update status reservasi menjadi Selesai
    UPDATE reservasi
    SET    status_reservasi = 'Selesai'
    WHERE  id_reservasi = NEW.id_reservasi;
 
    -- Catat ke audit_log
    INSERT INTO audit_log (nama_tabel, operasi, id_record, keterangan)
    VALUES (
        'check_out',
        'INSERT',
        NEW.id_checkout,
        CONCAT(
            'Check-out ', NEW.id_checkout,
            ' | Reservasi: ', NEW.id_reservasi,
            ' | Tamu: ', v_nama_tamu,
            ' | Kamar ', v_id_kamar, ' -> Tersedia',
            ' | Waktu: ', NEW.waktu_checkout
        )
    );
END//
DELIMITER ;