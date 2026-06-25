-- DML

-- TIPE KAMAR (5 baris)
INSERT INTO tipe_kamar (id_tipe, nama_tipe, kapasitas, deskripsi_tipe, harga_dasar) VALUES
('T001', 'Standard', 2,  'Kamar standar dengan fasilitas dasar', 350000),
('T002', 'Deluxe',   2,  'Kamar deluxe dengan pemandangan kota', 550000),
('T003', 'Superior', 3,  'Kamar superior luas untuk 3 tamu',    700000),
('T004', 'Family',   4,  'Kamar keluarga dengan 2 tempat tidur', 950000),
('T005', 'Suite',    4,  'Kamar suite mewah dengan ruang tamu', 1500000);

-- KAMAR (20 baris)
INSERT INTO kamar (id_kamar, nomor_kamar, lantai, status_kamar, id_tipe) VALUES
('K001', '101', 1, 'Terisi',   'T001'),
('K002', '102', 1, 'Terisi',   'T001'),
('K003', '103', 1, 'Dipesan',  'T001'),
('K004', '201', 2, 'Terisi',   'T002'),
('K005', '202', 2, 'Terisi',   'T002'),
('K006', '203', 2, 'Dipesan',  'T002'),
('K007', '301', 3, 'Terisi',   'T003'),
('K008', '302', 3, 'Dipesan',  'T003'),
('K009', '401', 4, 'Terisi',   'T004'),
('K010', '501', 5, 'Dipesan',  'T005'),
('K017', '509', 5, 'Terisi',   'T005'),
('K024', '123', 1, 'Terisi',   'T001'),
('K031', '456', 4, 'Terisi',   'T004'),
('K038', '222', 2, 'Terisi',   'T002'),
('K045', '104', 1, 'Terisi',   'T001'),
('K052', '105', 1, 'Terisi',   'T001'),
('K059', '106', 1, 'Dipesan',  'T001'),
('K066', '306', 3, 'Dipesan',  'T003'),
('K073', '506', 5, 'Dipesan',  'T005'),
('K080', '408', 4, 'Dipesan',  'T004');

-- TAMU (20 baris)
INSERT INTO tamu (id_tamu, nama_tamu, alamat, no_hp, email, jenis_identitas, no_identitas) VALUES
('TM001', 'Budi Santoso',    'Jakarta',      '081234567801', 'budi@gmail.com',    'KTP', '3171111111111110'),
('TM002', 'Siti Aminah',     'Bandung',      '081234567802', 'siti@gmail.com',    'KTP', '3272222222222220'),
('TM003', 'Andi Wijaya',     'Semarang',     '081234567803', 'andi@gmail.com',    'KTP', '3373333333333330'),
('TM004', 'Rina Putri',      'Yogyakarta',   '081234567804', 'rina@gmail.com',    'KTP', '3474444444444440'),
('TM005', 'Dimas Pratama',   'Surabaya',     '081234567805', 'dimas@gmail.com',   'KTP', '3575555555555550'),
('TM006', 'Dewi Lestari',    'Solo',         '081234567806', 'dewi@gmail.com',    'KTP', '3376666666666660'),
('TM007', 'Fajar Nugroho',   'Malang',       '081234567807', 'fajar@gmail.com',   'KTP', '3577777777777770'),
('TM008', 'Maya Sari',       'Bogor',        '081234567808', 'maya@gmail.com',    'KTP', '3278888888888880'),
('TM009', 'Rizki Akbar',     'Bekasi',       '081234567809', 'rizki@gmail.com',   'KTP', '3179999999999990'),
('TM010', 'Nanda Putri',     'Purwokerto',   '081234567810', 'nanda@gmail.com',   'KTP', '3300000000000000'),
('TM011', 'Hendra Kusuma',   'Medan',        '081234567811', 'hendra@gmail.com',  'KTP', '1271111111111110'),
('TM012', 'Laila Fitriani',  'Palembang',    '081234567812', 'laila@gmail.com',   'KTP', '1672222222222220'),
('TM013', 'Yusuf Maulana',   'Makassar',     '081234567813', 'yusuf@gmail.com',   'KTP', '7373333333333330'),
('TM014', 'Putri Ayu',       'Denpasar',     '081234567814', 'putri@gmail.com',   'KTP', '5174444444444440'),
('TM015', 'Galih Saputra',   'Pekanbaru',    '081234567815', 'galih@gmail.com',   'KTP', '1475555555555550'),
('TM016', 'Anisa Rahma',     'Padang',       '081234567816', 'anisa@gmail.com',   'KTP', '1376666666666660'),
('TM017', 'Reza Pratama',    'Balikpapan',   '081234567817', 'reza@gmail.com',    'SIM', '6477777777777770'),
('TM018', 'Cindy Oktavia',   'Banjarmasin',  '081234567818', 'cindy@gmail.com',   'KTP', '6378888888888880'),
('TM019', 'Farhan Akbar',    'Manado',       '081234567819', 'farhan@gmail.com',  'KTP', '7179999999999990'),
('TM020', 'Salsabila Putri', 'Pontianak',    '081234567820', 'salsa@gmail.com',   'KTP', '6100000000000000');

-- PEGAWAI (4 baris)
INSERT INTO pegawai (id_pegawai, nama_pegawai, jabatan, no_hp) VALUES
('P001', 'Ahmad Fauzi',   'Resepsionis', '081300000001'),
('P002', 'Yuni Astuti',   'Resepsionis', '081300000002'),
('P003', 'Dedi Saputra',  'Supervisor',  '081300000003'),
('P004', 'Rika Maharani', 'Front Office','081300000004');

-- FASILITAS (5 baris)
INSERT INTO fasilitas (id_fasilitas, nama_fasilitas, kategori, deskripsi_fasilitas, biaya) VALUES
('F001', 'WiFi',         'Internet',  'Akses internet gratis',        0),
('F002', 'Breakfast',    'Makanan',   'Sarapan pagi prasmanan',   50000),
('F003', 'Kolam Renang', 'Rekreasi',  'Akses kolam renang outdoor',   0),
('F004', 'Gym',          'Olahraga',  'Akses pusat kebugaran',        0),
('F005', 'Laundry',      'Layanan',   'Jasa cuci & setrika baju', 30000);

-- RESERVASI (20 baris)
INSERT INTO reservasi (id_reservasi, tanggal_pesan, check_in, check_out, jumlah_tamu, status_reservasi, id_tamu, id_kamar) VALUES
('R001', '2026-06-01', '2026-06-05', '2026-06-07', 2, 'Selesai',  'TM001', 'K001'),
('R002', '2026-06-02', '2026-06-06', '2026-06-08', 2, 'Selesai',  'TM002', 'K004'),
('R003', '2026-06-03', '2026-06-10', '2026-06-12', 3, 'Selesai',  'TM003', 'K007'),
('R004', '2026-06-04', '2026-06-11', '2026-06-13', 2, 'Selesai',  'TM004', 'K002'),
('R005', '2026-06-05', '2026-06-15', '2026-06-17', 4, 'Selesai',  'TM005', 'K009'),
('R006', '2026-06-06', '2026-06-20', '2026-06-22', 2, 'Selesai',  'TM006', 'K005'),
('R007', '2026-06-07', '2026-06-25', '2026-06-27', 2, 'Dipesan',  'TM007', 'K006'),
('R008', '2026-06-08', '2026-06-28', '2026-06-30', 3, 'Dipesan',  'TM008', 'K008'),
('R009', '2026-06-09', '2026-07-01', '2026-07-03', 2, 'Dipesan',  'TM009', 'K003'),
('R010', '2026-06-10', '2026-07-05', '2026-07-07', 4, 'Dipesan',  'TM010', 'K010'),
('R011', '2026-06-11', '2026-07-08', '2026-07-10', 2, 'Selesai',  'TM001', 'K017'),
('R012', '2026-06-12', '2026-07-11', '2026-07-13', 2, 'Selesai',  'TM002', 'K024'),
('R013', '2026-06-13', '2026-07-14', '2026-07-16', 3, 'Selesai',  'TM003', 'K031'),
('R014', '2026-06-14', '2026-07-17', '2026-07-19', 2, 'Selesai',  'TM004', 'K038'),
('R015', '2026-06-15', '2026-07-20', '2026-07-22', 4, 'Selesai',  'TM005', 'K045'),
('R016', '2026-06-16', '2026-07-23', '2026-07-25', 2, 'Selesai',  'TM006', 'K052'),
('R017', '2026-06-17', '2026-07-26', '2026-07-28', 2, 'Dipesan',  'TM007', 'K059'),
('R018', '2026-06-18', '2026-07-29', '2026-07-31', 3, 'Dipesan',  'TM008', 'K066'),
('R019', '2026-06-19', '2026-08-01', '2026-08-03', 2, 'Dipesan',  'TM009', 'K073'),
('R020', '2026-06-20', '2026-08-05', '2026-08-07', 4, 'Selesai',  'TM010', 'K080');

-- PEMBAYARAN (20 baris)
INSERT INTO pembayaran (id_pembayaran, tanggal_bayar, jumlah_bayar, metode_bayar, status_bayar, referensi, id_reservasi) VALUES
('PB001', '2026-06-01',  700000, 'Transfer', 'Lunas', 'TRF001',  'R001'),
('PB002', '2026-06-02', 1100000, 'QRIS',     'Lunas', 'QR001',   'R002'),
('PB003', '2026-06-03', 1400000, 'Transfer', 'Lunas', 'TRF003',  'R003'),
('PB004', '2026-06-04',  700000, 'Cash',     'Lunas', 'CASH004', 'R004'),
('PB005', '2026-06-05', 1900000, 'Transfer', 'Lunas', 'TRF005',  'R005'),
('PB006', '2026-06-06', 1100000, 'QRIS',     'Lunas', 'QR006',   'R006'),
('PB007', '2026-06-07',  550000, 'Transfer', 'Lunas', 'TRF007',  'R007'),
('PB008', '2026-06-08',  700000, 'Transfer', 'Lunas', 'TRF008',  'R008'),
('PB009', '2026-06-09',  350000, 'Cash',     'Lunas', 'CASH009', 'R009'),
('PB010', '2026-06-10', 1500000, 'Transfer', 'Lunas', 'TRF010',  'R010'),
('PB011', '2026-06-11',  700000, 'Transfer', 'Lunas', 'TRF011',  'R011'),
('PB012', '2026-06-12', 1100000, 'QRIS',     'Lunas', 'QR012',   'R012'),
('PB013', '2026-06-13', 1400000, 'Transfer', 'Lunas', 'TRF013',  'R013'),
('PB014', '2026-06-14',  700000, 'Cash',     'Lunas', 'CASH014', 'R014'),
('PB015', '2026-06-15', 1900000, 'Transfer', 'Lunas', 'TRF015',  'R015'),
('PB016', '2026-06-16', 1100000, 'QRIS',     'Lunas', 'QR016',   'R016'),
('PB017', '2026-06-17', 1100000, 'Transfer', 'Lunas', 'TRF017',  'R017'),
('PB018', '2026-06-18', 1400000, 'Transfer', 'Lunas', 'TRF018',  'R018'),
('PB019', '2026-06-19',  700000, 'Cash',     'Lunas', 'CASH019', 'R019'),
('PB020', '2026-06-20', 3000000, 'Transfer', 'Lunas', 'TRF020',  'R020');

-- CHECK_IN (20 baris)
INSERT INTO check_in (id_checkin, waktu_checkin, id_reservasi, id_pegawai) VALUES
('CI001', '2026-06-05 13:00:00', 'R001', 'P001'),
('CI002', '2026-06-06 14:00:00', 'R002', 'P002'),
('CI003', '2026-06-10 13:15:00', 'R003', 'P001'),
('CI004', '2026-06-11 14:20:00', 'R004', 'P003'),
('CI005', '2026-06-15 13:30:00', 'R005', 'P004'),
('CI006', '2026-06-20 14:00:00', 'R006', 'P002'),
('CI007', '2026-06-25 14:30:00', 'R007', 'P001'),
('CI008', '2026-06-28 15:00:00', 'R008', 'P002'),
('CI009', '2026-07-01 15:30:00', 'R009', 'P001'),
('CI010', '2026-07-05 16:00:00', 'R010', 'P003'),
('CI011', '2026-07-08 16:30:00', 'R011', 'P004'),
('CI012', '2026-07-11 17:00:00', 'R012', 'P002'),
('CI013', '2026-07-14 17:30:00', 'R013', 'P001'),
('CI014', '2026-07-17 18:00:00', 'R014', 'P002'),
('CI015', '2026-07-20 18:30:00', 'R015', 'P001'),
('CI016', '2026-07-23 19:00:00', 'R016', 'P003'),
('CI017', '2026-07-26 19:30:00', 'R017', 'P004'),
('CI018', '2026-07-29 20:00:00', 'R018', 'P002'),
('CI019', '2026-08-01 20:30:00', 'R019', 'P001'),
('CI020', '2026-08-05 21:00:00', 'R020', 'P002');

-- CHECK_OUT (20 baris)
INSERT INTO check_out (id_checkout, waktu_checkout, id_reservasi, id_pegawai) VALUES
('CO001', '2026-06-07 11:00:00', 'R001', 'P001'),
('CO002', '2026-06-08 11:30:00', 'R002', 'P002'),
('CO003', '2026-06-12 11:00:00', 'R003', 'P001'),
('CO004', '2026-06-13 11:15:00', 'R004', 'P003'),
('CO005', '2026-06-17 11:00:00', 'R005', 'P004'),
('CO006', '2026-06-22 11:00:00', 'R006', 'P002'),
('CO007', '2026-06-27 11:00:00', 'R007', 'P001'),
('CO008', '2026-06-30 11:00:00', 'R008', 'P002'),
('CO009', '2026-07-03 11:00:00', 'R009', 'P001'),
('CO010', '2026-07-07 11:00:00', 'R010', 'P003'),
('CO011', '2026-07-10 11:00:00', 'R011', 'P004'),
('CO012', '2026-07-13 11:00:00', 'R012', 'P002'),
('CO013', '2026-07-16 11:00:00', 'R013', 'P001'),
('CO014', '2026-07-19 11:00:00', 'R014', 'P002'),
('CO015', '2026-07-22 11:00:00', 'R015', 'P001'),
('CO016', '2026-07-25 11:00:00', 'R016', 'P003'),
('CO017', '2026-07-28 11:00:00', 'R017', 'P004'),
('CO018', '2026-07-31 11:00:00', 'R018', 'P002'),
('CO019', '2026-08-03 11:00:00', 'R019', 'P001'),
('CO020', '2026-08-07 11:00:00', 'R020', 'P002');

-- ULASAN (20 baris)
INSERT INTO ulasan (id_ulasan, tanggal_ulasan, rating, komentar, id_reservasi) VALUES
('U001', '2026-06-07', 5, 'Sangat puas, kamar bersih dan nyaman',    'R001'),
('U002', '2026-06-08', 4, 'Kamar nyaman, pelayanan ramah',           'R002'),
('U003', '2026-06-12', 5, 'Fasilitas lengkap, pasti balik lagi',     'R003'),
('U004', '2026-06-13', 4, 'Pelayanan baik, lokasi strategis',        'R004'),
('U005', '2026-06-17', 5, 'Cocok untuk keluarga, anak-anak senang',  'R005'),
('U006', '2026-06-22', 4, 'Bersih dan rapi, sarapan enak',          'R006'),
('U007', '2026-06-27', 4, 'Sangat puas dengan fasilitas gym',        'R007'),
('U008', '2026-06-30', 5, 'Kamar nyaman dan luas',                   'R008'),
('U009', '2026-07-03', 4, 'Fasilitas lengkap, WiFi kencang',         'R009'),
('U010', '2026-07-07', 5, 'Pelayanan terbaik, kamar mewah',          'R010'),
('U011', '2026-07-10', 4, 'Cocok untuk keluarga, kolam renang bagus','R011'),
('U012', '2026-07-13', 4, 'Bersih dan rapi, harga terjangkau',      'R012'),
('U013', '2026-07-16', 5, 'Sangat puas, akan merekomendasikan',      'R013'),
('U014', '2026-07-19', 4, 'Kamar nyaman, dekat pusat kota',          'R014'),
('U015', '2026-07-22', 5, 'Fasilitas lengkap dan modern',            'R015'),
('U016', '2026-07-25', 4, 'Pelayanan baik dan profesional',          'R016'),
('U017', '2026-07-28', 3, 'Cukup hemat untuk budget traveler',       'R017'),
('U018', '2026-07-31', 3, 'Harga murah, fasilitas standar',          'R018'),
('U019', '2026-08-03', 4, 'Bagus dan nyaman untuk pasangan',         'R019'),
('U020', '2026-08-07', 5, 'Sangat rapi, layanan prima',              'R020');