CREATE TABLE "Kullanıcı"(
    "KullanıcıID" INT,
    "İsim" VARCHAR,
    "Soyisim" VARCHAR,
    "Email" VARCHAR,
    "Şifre" VARCHAR,
    "ProfilGöruntülenmesi" SERIAL,
    "SoruSayısı" INT,
    "SonGörülme" DATE,
    "KayıtTarihi" DATE,
    "BildirimSayısı" INT,
    "CevapSayısı" INT,
    CONSTRAINT "kullanıcıPK" PRIMARY KEY("KullanıcıID"),
    CONSTRAINT "kullanıcıEmail" UNIQUE("Email")
);

CREATE TABLE "Şöhretler"(
    "ŞöhretSayısı" INT,
    "KullanıcıID" INT,
    CONSTRAINT "ŞöhretlerPK" PRIMARY KEY("ŞöhretSayısı"),
    CONSTRAINT "ŞöhretlerFK" FOREIGN KEY("KullanıcıID")
);
CREATE TABLE "Ayrıcalıklar"(
    "AyrıcalıkTipi" VARCHAR,
    "AyrıcalıkSayısı" INT,
    CONSTRAINT "AyrıcalıklarPK" PRIMARY KEY ("AyrıcalıkTipi")
);
CREATE TABLE "KullanıcıAyrıcalığı"(
    "KullanıcıID" INT,
    "AyrıcalıkTipi" VARCHAR,
    "KullanıcıAyrıcalıkSayısı" INT,
    CONSTRAINT "KullanıcıAyrıcalığıPK" PRIMARY KEY ("KullanıcıID"),
    "KullanıcıAyrıcalığıFK" FOREIGN KEY ("KullanıcıID"),
    CONSTRAINT "KullanıcıAyrıcalığıPK" PRIMARY KEY ("AyrıcalıkTipi"),
    "KullanıcıAyrıcalığıFK" FOREIGN KEY ("AyrıcalıkTipi")
    
);
ALTER TABLE "YeniKullanıcı"(
     "KullanıcıID" INT,
     CONSTRAINT "YeniKullanıcıPK" PRIMARY KEY ("KullanıcıID"),
     CONSTRAINT "YeniKullanıcıFK" FOREIGN KEY ("KullanıcıID");
);
ALTER TABLE "Editör"(
     "KullanıcıID" INT,
     CONSTRAINT "EditörPK" PRIMARY KEY ("KullanıcıID"),
     CONSTRAINT "EditörFK" FOREIGN KEY ("KullanıcıID");
);
ALTER TABLE "Moderatör"(
     "KullanıcıID" INT,
     CONSTRAINT "ModeratörPK" PRIMARY KEY ("KullanıcıID"),
     CONSTRAINT "ModeratörFK" FOREIGN KEY ("KullanıcıID")
);
CREATE TABLE "Rozet"(
    "RozetNo" INT,
    "RozetSayısı" INT,
    "RozetTipi" VARCHAR,
    CONSTRAINT "RozetPK" PRIMARY KEY ("RozetNo")
    
);
//ROZET KALITIM
ALTER TABLE "AltınRozet"(
    "RozetNo" INT,
    CONSTRAINT "AltınRozetPK" PRIMARY KEY ("RozetNo"),
    CONSTRAINT "AltınRozetFK" FOREIGN KEY ("RozetNo")
);
ALTER TABLE "GümüşRozet"(
    "RozetNo" INT,
    CONSTRAINT "GümüşRozetPK" PRIMARY KEY ("RozetNo"),
    CONSTRAINT "GümüşRozetFK" FOREIGN KEY ("RozetNo")
);
ALTER TABLE "BronzRozet"(
    "RozetNo" INT,
    CONSTRAINT "BronzRozetPK" PRIMARY KEY ("RozetNo"),
    CONSTRAINT "BronzRozetFK" FOREIGN KEY ("RozetNo")
);

