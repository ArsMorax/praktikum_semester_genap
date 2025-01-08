create database WongIrengJem;


create table karyawan(
    id_karyawan int primary key,
    nama varchar(100),
    tanggal_lahir date,
    jenis_kelamin enum("L", "P"),
    id_jabatan int,
    FOREIGN KEY (id_jabatan) REFERENCES jabatan(id_jabatan)
)

create table jabatan(
    id_jabatan int primary key,
    nama_jabatan varchar(50),
    gaji_pokok decimal(10,2)
)

create table gaji(
    id_gaji int primary key,
    id_karyawan int,
    FOREIGN KEY (id_karyawan) REFERENCES karyawan(id_karyawan),
    bulan int,
    tahun year,
    jumlah_absensi int,
    tunjangan decimal(10,2),
    total_gaji decimal(10,2)
)

create table absensi(
    id_absensi int primary key,
    id_karyawan int,
    FOREIGN KEY (id_karyawan) REFERENCES karyawan(id_karyawan),
    tanggal date,
    jam_masuk time,
    jam_keluar time
)

-- 1
INSERT INTO jabatan(id_jabatan, nama_jabatan, gaji_pokok) VALUES
(4, "Analis", 5000000)

-- 2
UPDATE karyawan SET nama = "Budi Santoso" WHERE id_karyawan = 2

-- 3
DELETE FROM gaji WHERE id_karyawan = 10

-- 4
SELECT count(karyawan.jenis_kelamin)
FROM karyawan
WHERE jenis_kelamin = "L"

-- 5
SELECT sum(jabatan.gaji_pokok)
FROM jabatan
JOIN karyawan ON jabatan.id_jabatan = karyawan.id_jabatan
WHERE jabatan.id_jabatan = 2

-- 6
SELECT AVG(gaji.tunjangan)
FROM gaji
JOIN absensi ON gaji.id_gaji = absensi.id_absensi
WHERE absensi.tanggal = "2023-10-01"

-- 7
SELECT count(karyawan.id_karyawan)
FROM karyawan
JOIN absensi ON absensi.id_karyawan = karyawan.id_karyawan
WHERE absensi.tanggal = "2023-10-01"

-- 8
SELECT jenis_kelamin, count(karyawan.jenis_kelamin)
FROM karyawan
GROUP BY jenis_kelamin

-- 9
SELECT sum(jabatan.gaji_pokok)
FROM jabatan
JOIN karyawan ON karyawan.id_jabatan = jabatan.id_jabatan
JOIN absensi ON absensi.id_karyawan = karyawan.id_karyawan
WHERE absensi.tanggal = "2023-10-01"

-- 10
SELECT karyawan.nama, sum(gaji.total_gaji)
FROM jabatan
JOIN karyawan ON karyawan.id_jabatan = jabatan.id_jabatan
JOIN gaji ON gaji.id_karyawan = karyawan.id_karyawan
JOIN absensi ON absensi.id_karyawan = karyawan.id_karyawan
WHERE absensi.tanggal = "2023-10-01"
GROUP BY nama
LIMIT 1