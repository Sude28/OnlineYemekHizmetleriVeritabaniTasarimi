use sude;
create TABLE Adres(
Adres_Id int PRIMARY KEY NOT NULL,
Il varchar(20) NOT NULL,
Ilce varchar(20) NOT NULL,
Cadde varchar(20) NOT NULL,
Mahalle varchar(20) NOT NULL,
Sokak varchar(20) NOT NULL,
Bina_no int NOT NULL
);

create TABLE Restoranlar(
Restoran_Id int PRIMARY KEY NOT NULL,
Restoran_ad varchar(50) NOT NULL,
Telefon varchar(11) NOT NULL UNIQUE,
Acilis_saati int,
Kapanis_saati int,
Adres_Id int NOT NULL,
FOREIGN KEY (Adres_Id) REFERENCES adres(Adres_Id)
);

create TABLE Menu(
Menu_Id int PRIMARY KEY NOT NULL,
Restoran_Id int NOT NULL,
FOREIGN KEY (Restoran_Id) REFERENCES restoranlar(Restoran_Id)
);

create TABLE Indirim(
Indirim_Id int PRIMARY KEY,
Indirim_yuzdesi int,
Indirim_baslangic_tarihi varchar(10),
Indirim_bitis_tarihi varchar(10),
Restoran_Id int NOT NULL,
FOREIGN KEY (Restoran_Id) REFERENCES restoranlar(Restoran_Id)
);

create TABLE Musteriler(
Musteri_Id int PRIMARY KEY NOT NULL,
Musteri_ad varchar(30) NOT NULL,
Musteri_soyad varchar(30) NOT NULL,
E_posta varchar(30) NOT NULL,
Telefon varchar(11) NOT NULL UNIQUE,
Adres_Id int NOT NULL,
FOREIGN KEY (Adres_Id) REFERENCES adres(Adres_Id)
);

create TABLE Yemek_Kategori(
Yemek_kategori_Id int PRIMARY KEY NOT NULL,
Yemek_kategori varchar(20)
);

create TABLE Yemekler(
Yemek_Id int PRIMARY KEY NOT NULL,
Yemek_adi varchar(50) NOT NULL,
Yemek_fiyati int NOT NULL,
Menu_Id int NOT NULL,
Yemek_kategori_Id int NOT NULL,
FOREIGN KEY (Menu_Id) REFERENCES menu(Menu_Id),
FOREIGN KEY (Yemek_kategori_Id) REFERENCES yemek_kategori(Yemek_kategori_Id)
);

create TABLE Stok(
Stok_Id int PRIMARY KEY NOT NULL,
Stok_miktarı int NOT NULL,
Stok_durumu boolean NOT NULL,
Yemek_Id int NOT NULL,
FOREIGN KEY (Yemek_Id) REFERENCES yemekler(Yemek_Id)
);

create TABLE Yemek_Aciklama(
Yemek_aciklama_Id int PRIMARY KEY NOT NULL,
Yemek_aciklama varchar(100) NOT NULL,
Kalori int,
Yemek_Id int NOT NULL,
FOREIGN KEY (Yemek_Id) REFERENCES yemekler(Yemek_Id)
);

create TABLE Yemek_Yorum(
Yorum_Id int PRIMARY KEY,
Yorum_metni varchar(100),
Yorum_tarihi varchar(11),
Yemek_Id int NOT NULL,
Musteri_Id int,
FOREIGN KEY (Yemek_Id) REFERENCES yemekler(Yemek_Id) ,
FOREIGN KEY (Musteri_Id) REFERENCES musteriler(Musteri_Id)
);

create TABLE Kurye(
Kurye_Id int PRIMARY KEY NOT NULL,
Kurye_adi varchar(30) NOT NULL,
Kurye_soyadi varchar(30) NOT NULL,
Telefon varchar(11) NOT NULL UNIQUE
);

create TABLE Odeme(
Odeme_Id int PRIMARY KEY NOT NULL,
Odeme_Durumu varchar(50) NOT NULL,
Odeme_Yontemi varchar(50) NOT NULL
);

create TABLE Siparis_Durum(
Siparis_Durum_Id int PRIMARY KEY NOT NULL,
Durum_tanimlamasi varchar(50)
);

create TABLE Siparisler(
Siparis_Id int PRIMARY KEY NOT NULL,
Tarih varchar(10),
Saat varchar(10),
Restoran_Id int NOT NULL,
Musteri_Id int NOT NULL,
Siparis_Durum_Id int NOT NULL,
Kurye_Id int NOT NULL,
Odeme_Id int NOT NULL,
FOREIGN KEY (Restoran_Id) REFERENCES restoranlar(Restoran_Id),
FOREIGN KEY (Musteri_Id) REFERENCES musteriler(Musteri_Id),
FOREIGN KEY (Siparis_Durum_Id) REFERENCES siparis_durum(Siparis_Durum_Id),
FOREIGN KEY (Kurye_Id) REFERENCES kurye(Kurye_Id),
FOREIGN KEY (Odeme_Id) REFERENCES odeme(Odeme_Id)
);

create TABLE Siparis_Detay(
Siparis_Detay_Id int PRIMARY KEY,
Adet int NOT NULL,
Siparis_notu varchar(100),
Odenecek_Tutar int NOT NULL,
Yemek_Id int NOT NULL,
Siparis_Id int NOT NULL,
FOREIGN KEY (Yemek_Id) REFERENCES yemekler(Yemek_Id),
FOREIGN KEY (Siparis_Id) REFERENCES siparisler(Siparis_Id)
);