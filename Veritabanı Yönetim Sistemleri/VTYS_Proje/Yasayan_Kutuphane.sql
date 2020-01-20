--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
-- Dumped by pg_dump version 12rc1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: StokDusur(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."StokDusur"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    Update "Kitap" Set "StokMiktari" = "StokMiktari" - '1' WHERE "UrunID" = '1' OR "UrunID" = '2' OR "UrunID" = '3';
    RETURN NEW;
END;
$$;


ALTER FUNCTION public."StokDusur"() OWNER TO postgres;

--
-- Name: StokMiktariSifir(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."StokMiktariSifir"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF NEW."StokMiktari" = '0' THEN
        INSERT INTO "Silinenler"("UrunID")
        VALUES(OLD."UrunID");
    END IF;

    RETURN NEW;
END;
$$;


ALTER FUNCTION public."StokMiktariSifir"() OWNER TO postgres;

--
-- Name: YorumEkle(integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."YorumEkle"(_urunid integer, _yorum text) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN   
    INSERT INTO "Yorum" ("Yorum", "YorumTarihi", "UrunID") 
        VALUES(_yorum, NOW(), _urunID);
END;
$$;


ALTER FUNCTION public."YorumEkle"(_urunid integer, _yorum text) OWNER TO postgres;

--
-- Name: YorumEkle(integer, text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."YorumEkle"(_urunid integer, _yorum text, _yorumyapan integer) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN   
    INSERT INTO "Yorum" ("Yorum", "YorumTarihi", "UrunID", "YorumYapanID") 
        VALUES(_yorum, NOW(), _urunID, _yorumYapan);
END;
$$;


ALTER FUNCTION public."YorumEkle"(_urunid integer, _yorum text, _yorumyapan integer) OWNER TO postgres;

--
-- Name: YorumGir(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."YorumGir"(_urunid integer) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN   
    
    INSERT INTO "Yorum" ("Yorum","YorumTarihi", "UrunID") 
    VALUES(
        substring('ABCÇDEFGĞHIiJKLMNOÖPRSŞTUÜVYZ' from ceil(random()*10)::smallint for ceil(random()*20)::SMALLINT), 
        NOW(), _urunID
        );
        
END;
$$;


ALTER FUNCTION public."YorumGir"(_urunid integer) OWNER TO postgres;

--
-- Name: id_dondur(character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.id_dondur(_username character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
begin
	if(select count(*) from "Kullanici" where "KullaniciAdi" = _username) > 0 then
		return (SELECT "KullaniciID" FROM "Kullanici" where "KullaniciAdi" = _username);
	else
		return -1;
	end if;
end
$$;


ALTER FUNCTION public.id_dondur(_username character varying) OWNER TO postgres;

--
-- Name: login(character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.login(_username character varying, _password character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
begin
	if(select count(*) from "Kullanici" where "KullaniciAdi" = _username and "Sifre" = _password) > 0 then
		return 1;
	else
		return 0;
	end if;
end
$$;


ALTER FUNCTION public.login(_username character varying, _password character varying) OWNER TO postgres;

--
-- Name: urunSilme(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."urunSilme"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    DELETE FROM "Urun" WHERE "UrunID" = OLD."ElektronikKitapID";
END;
$$;


ALTER FUNCTION public."urunSilme"() OWNER TO postgres;

--
-- Name: yetkidondur(character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.yetkidondur(_username character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
begin
	if(select count(*) from "Kullanici" where "KullaniciAdi" = _username and "YetkiID" = 1) > 0 then
		return 1;
	else
		return 2;
	end if;
end
$$;


ALTER FUNCTION public.yetkidondur(_username character varying) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Cevirmen; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Cevirmen" (
    "CevirmenID" integer NOT NULL,
    "Isim" character varying(2044) NOT NULL,
    "Soyisim" character varying(2044) NOT NULL,
    "Cinsiyet" integer NOT NULL
);


ALTER TABLE public."Cevirmen" OWNER TO postgres;

--
-- Name: Cevirmen_CevirmenID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Cevirmen_CevirmenID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Cevirmen_CevirmenID_seq" OWNER TO postgres;

--
-- Name: Cevirmen_CevirmenID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Cevirmen_CevirmenID_seq" OWNED BY public."Cevirmen"."CevirmenID";


--
-- Name: Dil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Dil" (
    "DilID" integer NOT NULL,
    "Adi" character varying(2044) NOT NULL
);


ALTER TABLE public."Dil" OWNER TO postgres;

--
-- Name: Dil_DilID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Dil_DilID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Dil_DilID_seq" OWNER TO postgres;

--
-- Name: Dil_DilID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Dil_DilID_seq" OWNED BY public."Dil"."DilID";


--
-- Name: ElektronikKitap; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ElektronikKitap" (
    "UrunID" integer NOT NULL,
    "Boyut" double precision NOT NULL,
    "IndirmeSayisi" integer NOT NULL
);


ALTER TABLE public."ElektronikKitap" OWNER TO postgres;

--
-- Name: ElektronikKitap_UrunID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ElektronikKitap_UrunID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ElektronikKitap_UrunID_seq" OWNER TO postgres;

--
-- Name: ElektronikKitap_UrunID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ElektronikKitap_UrunID_seq" OWNED BY public."ElektronikKitap"."UrunID";


--
-- Name: KapakTipi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."KapakTipi" (
    "KapakTipiID" integer NOT NULL,
    "Adi" character varying(2044) NOT NULL
);


ALTER TABLE public."KapakTipi" OWNER TO postgres;

--
-- Name: KapakTipi_KapakTipiID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."KapakTipi_KapakTipiID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."KapakTipi_KapakTipiID_seq" OWNER TO postgres;

--
-- Name: KapakTipi_KapakTipiID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."KapakTipi_KapakTipiID_seq" OWNED BY public."KapakTipi"."KapakTipiID";


--
-- Name: Kategori; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Kategori" (
    "KategoriID" integer NOT NULL,
    "Adi" character varying(2044) NOT NULL
);


ALTER TABLE public."Kategori" OWNER TO postgres;

--
-- Name: Kategori_KategoriID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Kategori_KategoriID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Kategori_KategoriID_seq" OWNER TO postgres;

--
-- Name: Kategori_KategoriID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Kategori_KategoriID_seq" OWNED BY public."Kategori"."KategoriID";


--
-- Name: Kitap; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Kitap" (
    "UrunID" integer NOT NULL,
    "BasimTarihi" date NOT NULL,
    "BaskiSayisi" integer NOT NULL,
    "KapakTipiID" integer NOT NULL,
    "StokMiktari" integer NOT NULL,
    "EklenmeTarihi" date
);


ALTER TABLE public."Kitap" OWNER TO postgres;

--
-- Name: KitapCevirmen; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."KitapCevirmen" (
    "KitapCevirmenID" integer NOT NULL,
    "UrunID" integer NOT NULL,
    "CevirmenID" integer NOT NULL
);


ALTER TABLE public."KitapCevirmen" OWNER TO postgres;

--
-- Name: KitapCevirmen_KitapCevirmenID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."KitapCevirmen_KitapCevirmenID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."KitapCevirmen_KitapCevirmenID_seq" OWNER TO postgres;

--
-- Name: KitapCevirmen_KitapCevirmenID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."KitapCevirmen_KitapCevirmenID_seq" OWNED BY public."KitapCevirmen"."KitapCevirmenID";


--
-- Name: KitapTuru; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."KitapTuru" (
    "KitapTuruID" integer NOT NULL,
    "Adi" character varying(2044) NOT NULL
);


ALTER TABLE public."KitapTuru" OWNER TO postgres;

--
-- Name: KitapTuru_KitapTuruID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."KitapTuru_KitapTuruID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."KitapTuru_KitapTuruID_seq" OWNER TO postgres;

--
-- Name: KitapTuru_KitapTuruID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."KitapTuru_KitapTuruID_seq" OWNED BY public."KitapTuru"."KitapTuruID";


--
-- Name: KitapYazar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."KitapYazar" (
    "KitapYazarID" integer NOT NULL,
    "UrunID" integer NOT NULL,
    "YazarID" integer NOT NULL
);


ALTER TABLE public."KitapYazar" OWNER TO postgres;

--
-- Name: KitapYazar_KitapYazarID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."KitapYazar_KitapYazarID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."KitapYazar_KitapYazarID_seq" OWNER TO postgres;

--
-- Name: KitapYazar_KitapYazarID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."KitapYazar_KitapYazarID_seq" OWNED BY public."KitapYazar"."KitapYazarID";


--
-- Name: Kitap_UrunID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Kitap_UrunID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Kitap_UrunID_seq" OWNER TO postgres;

--
-- Name: Kitap_UrunID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Kitap_UrunID_seq" OWNED BY public."Kitap"."UrunID";


--
-- Name: Kullanici; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Kullanici" (
    "KullaniciID" integer NOT NULL,
    "DilID" integer NOT NULL,
    "DogumTarihi" date NOT NULL,
    "Isim" character varying(2044) NOT NULL,
    "Soyisim" character varying(2044) NOT NULL,
    "KullaniciAdi" character varying(2044) NOT NULL,
    "Sifre" character varying(2044) NOT NULL,
    "UlkeID" integer NOT NULL,
    "YetkiID" integer NOT NULL,
    "Cinsiyet" integer NOT NULL
);


ALTER TABLE public."Kullanici" OWNER TO postgres;

--
-- Name: Kullanici_KullaniciID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Kullanici_KullaniciID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Kullanici_KullaniciID_seq" OWNER TO postgres;

--
-- Name: Kullanici_KullaniciID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Kullanici_KullaniciID_seq" OWNED BY public."Kullanici"."KullaniciID";


--
-- Name: Sepet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Sepet" (
    "SepetID" integer NOT NULL,
    "UrunID" integer NOT NULL
);


ALTER TABLE public."Sepet" OWNER TO postgres;

--
-- Name: Sepet_SepetID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Sepet_SepetID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Sepet_SepetID_seq" OWNER TO postgres;

--
-- Name: Sepet_SepetID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Sepet_SepetID_seq" OWNED BY public."Sepet"."SepetID";


--
-- Name: Silinenler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Silinenler" (
    "SilinenlerID" integer NOT NULL,
    "UrunID" integer NOT NULL
);


ALTER TABLE public."Silinenler" OWNER TO postgres;

--
-- Name: Silinenler_SilinenlerID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Silinenler_SilinenlerID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Silinenler_SilinenlerID_seq" OWNER TO postgres;

--
-- Name: Silinenler_SilinenlerID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Silinenler_SilinenlerID_seq" OWNED BY public."Silinenler"."SilinenlerID";


--
-- Name: Ulke; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Ulke" (
    "UlkeID" integer NOT NULL,
    "Adi" character varying(2044) NOT NULL
);


ALTER TABLE public."Ulke" OWNER TO postgres;

--
-- Name: Ulke_UlkeID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Ulke_UlkeID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Ulke_UlkeID_seq" OWNER TO postgres;

--
-- Name: Ulke_UlkeID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Ulke_UlkeID_seq" OWNED BY public."Ulke"."UlkeID";


--
-- Name: Urun; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Urun" (
    "UrunID" integer NOT NULL,
    "Adi" character varying(2044) NOT NULL,
    "DilID" integer NOT NULL,
    "KapakFotografi" text,
    "KategoriID" integer NOT NULL,
    "KitapTuruID" integer NOT NULL,
    "Puan" double precision NOT NULL,
    "SayfaSayisi" integer NOT NULL,
    "Tanitim" text,
    "Ucret" double precision NOT NULL,
    "YayinEviID" integer NOT NULL
);


ALTER TABLE public."Urun" OWNER TO postgres;

--
-- Name: Urun_UrunID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Urun_UrunID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Urun_UrunID_seq" OWNER TO postgres;

--
-- Name: Urun_UrunID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Urun_UrunID_seq" OWNED BY public."Urun"."UrunID";


--
-- Name: YayinEvi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."YayinEvi" (
    "YayinEviID" integer NOT NULL,
    "Adi" character varying(2044) NOT NULL
);


ALTER TABLE public."YayinEvi" OWNER TO postgres;

--
-- Name: YayinEvi_YayinEviID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."YayinEvi_YayinEviID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."YayinEvi_YayinEviID_seq" OWNER TO postgres;

--
-- Name: YayinEvi_YayinEviID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."YayinEvi_YayinEviID_seq" OWNED BY public."YayinEvi"."YayinEviID";


--
-- Name: Yazar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Yazar" (
    "YazarID" integer NOT NULL,
    "Cinsiyet" integer NOT NULL,
    "DogumTarihi" date NOT NULL,
    "Hayati" text NOT NULL,
    "Isim" character varying(2044) NOT NULL,
    "Soyisim" character varying(2044) NOT NULL,
    "UlkeID" integer NOT NULL
);


ALTER TABLE public."Yazar" OWNER TO postgres;

--
-- Name: Yazar_YazarID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Yazar_YazarID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Yazar_YazarID_seq" OWNER TO postgres;

--
-- Name: Yazar_YazarID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Yazar_YazarID_seq" OWNED BY public."Yazar"."YazarID";


--
-- Name: Yetki; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Yetki" (
    "YetkiID" integer NOT NULL,
    "Adi" character varying(2044) NOT NULL
);


ALTER TABLE public."Yetki" OWNER TO postgres;

--
-- Name: Yetki_YetkiID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Yetki_YetkiID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Yetki_YetkiID_seq" OWNER TO postgres;

--
-- Name: Yetki_YetkiID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Yetki_YetkiID_seq" OWNED BY public."Yetki"."YetkiID";


--
-- Name: Yorum; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Yorum" (
    "YorumID" integer NOT NULL,
    "Yorum" text NOT NULL,
    "UrunID" integer NOT NULL,
    "YorumTarihi" date NOT NULL,
    "YorumYapanID" integer NOT NULL
);


ALTER TABLE public."Yorum" OWNER TO postgres;

--
-- Name: Yorum_YorumID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Yorum_YorumID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Yorum_YorumID_seq" OWNER TO postgres;

--
-- Name: Yorum_YorumID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Yorum_YorumID_seq" OWNED BY public."Yorum"."YorumID";


--
-- Name: Cevirmen CevirmenID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Cevirmen" ALTER COLUMN "CevirmenID" SET DEFAULT nextval('public."Cevirmen_CevirmenID_seq"'::regclass);


--
-- Name: Dil DilID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Dil" ALTER COLUMN "DilID" SET DEFAULT nextval('public."Dil_DilID_seq"'::regclass);


--
-- Name: ElektronikKitap UrunID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ElektronikKitap" ALTER COLUMN "UrunID" SET DEFAULT nextval('public."ElektronikKitap_UrunID_seq"'::regclass);


--
-- Name: KapakTipi KapakTipiID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."KapakTipi" ALTER COLUMN "KapakTipiID" SET DEFAULT nextval('public."KapakTipi_KapakTipiID_seq"'::regclass);


--
-- Name: Kategori KategoriID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Kategori" ALTER COLUMN "KategoriID" SET DEFAULT nextval('public."Kategori_KategoriID_seq"'::regclass);


--
-- Name: Kitap UrunID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Kitap" ALTER COLUMN "UrunID" SET DEFAULT nextval('public."Kitap_UrunID_seq"'::regclass);


--
-- Name: KitapCevirmen KitapCevirmenID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."KitapCevirmen" ALTER COLUMN "KitapCevirmenID" SET DEFAULT nextval('public."KitapCevirmen_KitapCevirmenID_seq"'::regclass);


--
-- Name: KitapTuru KitapTuruID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."KitapTuru" ALTER COLUMN "KitapTuruID" SET DEFAULT nextval('public."KitapTuru_KitapTuruID_seq"'::regclass);


--
-- Name: KitapYazar KitapYazarID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."KitapYazar" ALTER COLUMN "KitapYazarID" SET DEFAULT nextval('public."KitapYazar_KitapYazarID_seq"'::regclass);


--
-- Name: Kullanici KullaniciID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Kullanici" ALTER COLUMN "KullaniciID" SET DEFAULT nextval('public."Kullanici_KullaniciID_seq"'::regclass);


--
-- Name: Sepet SepetID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sepet" ALTER COLUMN "SepetID" SET DEFAULT nextval('public."Sepet_SepetID_seq"'::regclass);


--
-- Name: Silinenler SilinenlerID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Silinenler" ALTER COLUMN "SilinenlerID" SET DEFAULT nextval('public."Silinenler_SilinenlerID_seq"'::regclass);


--
-- Name: Ulke UlkeID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ulke" ALTER COLUMN "UlkeID" SET DEFAULT nextval('public."Ulke_UlkeID_seq"'::regclass);


--
-- Name: Urun UrunID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Urun" ALTER COLUMN "UrunID" SET DEFAULT nextval('public."Urun_UrunID_seq"'::regclass);


--
-- Name: YayinEvi YayinEviID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."YayinEvi" ALTER COLUMN "YayinEviID" SET DEFAULT nextval('public."YayinEvi_YayinEviID_seq"'::regclass);


--
-- Name: Yazar YazarID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Yazar" ALTER COLUMN "YazarID" SET DEFAULT nextval('public."Yazar_YazarID_seq"'::regclass);


--
-- Name: Yetki YetkiID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Yetki" ALTER COLUMN "YetkiID" SET DEFAULT nextval('public."Yetki_YetkiID_seq"'::regclass);


--
-- Name: Yorum YorumID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Yorum" ALTER COLUMN "YorumID" SET DEFAULT nextval('public."Yorum_YorumID_seq"'::regclass);


--
-- Data for Name: Cevirmen; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Cevirmen" VALUES (1, 'Çiğdem Erkal', 'İpek', 2);
INSERT INTO public."Cevirmen" VALUES (2, 'Sevin', 'Okyay', 2);
INSERT INTO public."Cevirmen" VALUES (3, 'Kutluhan', 'Kutlu', 1);
INSERT INTO public."Cevirmen" VALUES (4, 'Pınar', 'Öcal', 2);
INSERT INTO public."Cevirmen" VALUES (5, 'Dost', 'Körpe', 1);
INSERT INTO public."Cevirmen" VALUES (6, 'Nil', 'Alt', 2);
INSERT INTO public."Cevirmen" VALUES (7, 'Barış', 'Alkım', 1);


--
-- Data for Name: Dil; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Dil" VALUES (1, 'Türkçe');
INSERT INTO public."Dil" VALUES (2, 'Azerbaycanca');
INSERT INTO public."Dil" VALUES (4, 'Almanca');
INSERT INTO public."Dil" VALUES (5, 'Fransızca');
INSERT INTO public."Dil" VALUES (6, 'Arapça');
INSERT INTO public."Dil" VALUES (3, 'Rusça');
INSERT INTO public."Dil" VALUES (7, 'İtayanca');
INSERT INTO public."Dil" VALUES (8, 'İspanca');
INSERT INTO public."Dil" VALUES (9, 'İngilizce');
INSERT INTO public."Dil" VALUES (10, 'Portekizce');
INSERT INTO public."Dil" VALUES (11, 'Farsca');


--
-- Data for Name: ElektronikKitap; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."ElektronikKitap" VALUES (4, 1.5, 895);


--
-- Data for Name: KapakTipi; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."KapakTipi" VALUES (1, 'İnce');
INSERT INTO public."KapakTipi" VALUES (2, 'Ciltli');


--
-- Data for Name: Kategori; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Kategori" VALUES (1, 'Macera');
INSERT INTO public."Kategori" VALUES (2, 'Korku');
INSERT INTO public."Kategori" VALUES (3, 'Polisiye');
INSERT INTO public."Kategori" VALUES (4, 'Edebiyat');
INSERT INTO public."Kategori" VALUES (5, 'Tarih');
INSERT INTO public."Kategori" VALUES (6, 'Fantastik');
INSERT INTO public."Kategori" VALUES (8, 'Çocuk');
INSERT INTO public."Kategori" VALUES (9, 'Bilim Kurgu');
INSERT INTO public."Kategori" VALUES (7, 'Şiir');
INSERT INTO public."Kategori" VALUES (10, 'Biyografi');


--
-- Data for Name: Kitap; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Kitap" VALUES (6, '2019-12-17', 4, 1, 5, NULL);
INSERT INTO public."Kitap" VALUES (1, '1990-10-10', 5, 2, 30, NULL);
INSERT INTO public."Kitap" VALUES (2, '2000-09-11', 3, 1, 32, NULL);
INSERT INTO public."Kitap" VALUES (3, '1987-05-02', 1, 1, 0, NULL);


--
-- Data for Name: KitapCevirmen; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."KitapCevirmen" VALUES (1, 1, 4);
INSERT INTO public."KitapCevirmen" VALUES (2, 2, 1);
INSERT INTO public."KitapCevirmen" VALUES (3, 3, 2);
INSERT INTO public."KitapCevirmen" VALUES (4, 3, 3);


--
-- Data for Name: KitapTuru; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."KitapTuru" VALUES (1, 'Hikaye');
INSERT INTO public."KitapTuru" VALUES (2, 'Ansiklopedi');
INSERT INTO public."KitapTuru" VALUES (3, 'Otobiografi');
INSERT INTO public."KitapTuru" VALUES (4, 'Çizgi Roman');
INSERT INTO public."KitapTuru" VALUES (5, 'Roman');


--
-- Data for Name: KitapYazar; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."KitapYazar" VALUES (1, 1, 3);
INSERT INTO public."KitapYazar" VALUES (2, 2, 1);
INSERT INTO public."KitapYazar" VALUES (3, 3, 2);


--
-- Data for Name: Kullanici; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Kullanici" VALUES (1, 1, '1998-11-11', 'Zeynep', 'Aldinç', 'Zeynep', '123123', 1, 2, 2);
INSERT INTO public."Kullanici" VALUES (2, 2, '1997-09-15', 'Almirza', 'Hashimzada', 'Ali', '111222', 2, 1, 1);
INSERT INTO public."Kullanici" VALUES (3, 2, '1993-06-02', 'Talha', 'Çerçi', 'Talha', '123456', 2, 2, 1);
INSERT INTO public."Kullanici" VALUES (4, 2, '1987-01-01', 'Filiz', 'Arat', 'Farat', '123456789', 2, 2, 2);
INSERT INTO public."Kullanici" VALUES (5, 2, '1997-09-10', 'ÖmerFaruk', 'Yetim', 'Ofyetim', '123789', 2, 2, 1);
INSERT INTO public."Kullanici" VALUES (6, 9, '2001-01-01', 'Conrad', 'Jophet', 'CJ', '456456', 9, 2, 1);


--
-- Data for Name: Sepet; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: Silinenler; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Silinenler" VALUES (8, 3);


--
-- Data for Name: Ulke; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Ulke" VALUES (1, 'Türkiye');
INSERT INTO public."Ulke" VALUES (2, 'Azerbaycan');
INSERT INTO public."Ulke" VALUES (3, 'Rusya');
INSERT INTO public."Ulke" VALUES (4, 'Almanya');
INSERT INTO public."Ulke" VALUES (5, 'Fransa');
INSERT INTO public."Ulke" VALUES (6, 'İran');
INSERT INTO public."Ulke" VALUES (7, 'İtalya');
INSERT INTO public."Ulke" VALUES (8, 'İspanya');
INSERT INTO public."Ulke" VALUES (9, 'Amerika');


--
-- Data for Name: Urun; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Urun" VALUES (1, 'Hannibal', 1, NULL, 2, 1, 9.8, 325, NULL, 45.5, 2);
INSERT INTO public."Urun" VALUES (2, 'Beren ve Luthien', 1, NULL, 6, 1, 9.5, 456, NULL, 55.5, 1);
INSERT INTO public."Urun" VALUES (3, 'Harry Potter', 1, NULL, 6, 1, 8.8, 356, NULL, 35.7, 1);
INSERT INTO public."Urun" VALUES (4, 'Kuzuların Sessizliği', 9, 'Boş', 2, 1, 8.7, 100, 'Son Kitap', 65.4, 3);
INSERT INTO public."Urun" VALUES (5, 'Kemikler Şehri', 9, 'Boş', 6, 5, 5, 100, 'vsdvsdv', 45, 6);
INSERT INTO public."Urun" VALUES (6, 'Marslı', 9, 'Boş', 8, 5, 8, 100, 'ascadc', 78, 3);
INSERT INTO public."Urun" VALUES (7, 'Uçurtmalar Şehri', 5, 'Boş', 4, 1, 15, 45, 'tyhhh', 71, 5);


--
-- Data for Name: YayinEvi; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."YayinEvi" VALUES (1, 'Pegasus');
INSERT INTO public."YayinEvi" VALUES (2, 'Nemesis');
INSERT INTO public."YayinEvi" VALUES (3, 'İthaki');
INSERT INTO public."YayinEvi" VALUES (4, 'Koridor');
INSERT INTO public."YayinEvi" VALUES (5, 'YKY');
INSERT INTO public."YayinEvi" VALUES (6, 'Artemis');


--
-- Data for Name: Yazar; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Yazar" VALUES (2, 2, '1965-06-03', 'Güzel', 'Joanne', ' Rowling', 9);
INSERT INTO public."Yazar" VALUES (3, 1, '1940-04-11', 'Komik', 'Thomas', ' Harris', 9);
INSERT INTO public."Yazar" VALUES (4, 1, '1920-12-17', 'bilimkurgu edebiyatına damga vuran yazar', 'Ray', 'Bradbury', 9);
INSERT INTO public."Yazar" VALUES (1, 1, '1892-01-03', 'Eğlenceli', '‎Christopher', 'Tolkien', 9);
INSERT INTO public."Yazar" VALUES (5, 1, '1889-12-17', 'İyi', 'Soner', 'Yalçın', 1);
INSERT INTO public."Yazar" VALUES (6, 2, '2019-12-17', 'kfbckwjfhnw', 'Cassandra', 'Clare', 9);


--
-- Data for Name: Yetki; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Yetki" VALUES (1, 'Admin');
INSERT INTO public."Yetki" VALUES (2, 'Musteri');


--
-- Data for Name: Yorum; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Yorum" VALUES (1, 'Süper Kitap', 1, '2018-02-10', 1);
INSERT INTO public."Yorum" VALUES (2, 'Bayıldım', 2, '2012-02-02', 2);
INSERT INTO public."Yorum" VALUES (3, 'Çok Güzel', 3, '2001-01-01', 3);
INSERT INTO public."Yorum" VALUES (7, 'GĞHIiJKLMNOÖPR', 3, '2019-12-17', 3);
INSERT INTO public."Yorum" VALUES (8, 'FGĞHIiJKL', 1, '2019-12-17', 1);
INSERT INTO public."Yorum" VALUES (9, 'ÇDEFGĞHI', 2, '2019-12-17', 1);
INSERT INTO public."Yorum" VALUES (12, 'ABCÇDEFGĞHIi', 1, '2019-12-17', 2);
INSERT INTO public."Yorum" VALUES (13, 'CFVGBHJN', 1, '2020-01-20', 2);
INSERT INTO public."Yorum" VALUES (14, 'Hello', 1, '2020-01-20', 3);
INSERT INTO public."Yorum" VALUES (15, 'fghfghf', 1, '2020-01-20', 3);
INSERT INTO public."Yorum" VALUES (16, 'dddddd', 1, '2020-01-20', 2);
INSERT INTO public."Yorum" VALUES (17, 'Güzellll', 1, '2020-01-20', 1);
INSERT INTO public."Yorum" VALUES (4, 'BCÇDE', 1, '2019-12-17', 4);
INSERT INTO public."Yorum" VALUES (5, 'GĞHIiJKLMNO', 1, '2019-12-17', 5);
INSERT INTO public."Yorum" VALUES (6, 'HIiJKLMNOÖPRSŞTUÜ', 2, '2019-12-17', 6);
INSERT INTO public."Yorum" VALUES (10, 'F', 1, '2019-12-17', 5);
INSERT INTO public."Yorum" VALUES (11, 'ÇDEFGĞHIi', 2, '2019-12-17', 6);
INSERT INTO public."Yorum" VALUES (20, 'Hello', 2, '2020-01-20', 1);
INSERT INTO public."Yorum" VALUES (21, 'Bayıldım', 3, '2020-01-20', 1);
INSERT INTO public."Yorum" VALUES (22, 'Çok Güzel Kitap Herkese Tavsiye Ederim', 3, '2020-01-20', 1);
INSERT INTO public."Yorum" VALUES (23, 'Tavsiye Ediyorum', 3, '2020-01-20', 1);
INSERT INTO public."Yorum" VALUES (24, 'Hello', 2, '2020-01-20', 1);


--
-- Name: Cevirmen_CevirmenID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Cevirmen_CevirmenID_seq"', 7, true);


--
-- Name: Dil_DilID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Dil_DilID_seq"', 11, true);


--
-- Name: ElektronikKitap_UrunID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ElektronikKitap_UrunID_seq"', 2, true);


--
-- Name: KapakTipi_KapakTipiID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."KapakTipi_KapakTipiID_seq"', 2, true);


--
-- Name: Kategori_KategoriID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Kategori_KategoriID_seq"', 11, true);


--
-- Name: KitapCevirmen_KitapCevirmenID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."KitapCevirmen_KitapCevirmenID_seq"', 4, true);


--
-- Name: KitapTuru_KitapTuruID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."KitapTuru_KitapTuruID_seq"', 5, true);


--
-- Name: KitapYazar_KitapYazarID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."KitapYazar_KitapYazarID_seq"', 3, true);


--
-- Name: Kitap_UrunID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Kitap_UrunID_seq"', 1, true);


--
-- Name: Kullanici_KullaniciID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Kullanici_KullaniciID_seq"', 6, true);


--
-- Name: Sepet_SepetID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Sepet_SepetID_seq"', 48, true);


--
-- Name: Silinenler_SilinenlerID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Silinenler_SilinenlerID_seq"', 8, true);


--
-- Name: Ulke_UlkeID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Ulke_UlkeID_seq"', 9, true);


--
-- Name: Urun_UrunID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Urun_UrunID_seq"', 3, true);


--
-- Name: YayinEvi_YayinEviID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."YayinEvi_YayinEviID_seq"', 6, true);


--
-- Name: Yazar_YazarID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Yazar_YazarID_seq"', 6, true);


--
-- Name: Yetki_YetkiID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Yetki_YetkiID_seq"', 2, true);


--
-- Name: Yorum_YorumID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Yorum_YorumID_seq"', 24, true);


--
-- Name: Cevirmen unique_Cevirmen_CevirmenID; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Cevirmen"
    ADD CONSTRAINT "unique_Cevirmen_CevirmenID" PRIMARY KEY ("CevirmenID");


--
-- Name: Dil unique_Dil_DilID; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Dil"
    ADD CONSTRAINT "unique_Dil_DilID" PRIMARY KEY ("DilID");


--
-- Name: ElektronikKitap unique_ElektronikKitap_UrunID; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ElektronikKitap"
    ADD CONSTRAINT "unique_ElektronikKitap_UrunID" PRIMARY KEY ("UrunID");


--
-- Name: KapakTipi unique_KapakTipi_KapakTipi; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."KapakTipi"
    ADD CONSTRAINT "unique_KapakTipi_KapakTipi" PRIMARY KEY ("KapakTipiID");


--
-- Name: Kategori unique_Kategori_KategoriID; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Kategori"
    ADD CONSTRAINT "unique_Kategori_KategoriID" PRIMARY KEY ("KategoriID");


--
-- Name: KitapCevirmen unique_KitapCevirmen_KitapCevirmenID; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."KitapCevirmen"
    ADD CONSTRAINT "unique_KitapCevirmen_KitapCevirmenID" PRIMARY KEY ("KitapCevirmenID");


--
-- Name: KitapTuru unique_KitapTuru_KitapTuruID; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."KitapTuru"
    ADD CONSTRAINT "unique_KitapTuru_KitapTuruID" PRIMARY KEY ("KitapTuruID");


--
-- Name: KitapYazar unique_KitapYazar_KitapYazarID; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."KitapYazar"
    ADD CONSTRAINT "unique_KitapYazar_KitapYazarID" PRIMARY KEY ("KitapYazarID");


--
-- Name: Kitap unique_Kitap_UrunID; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Kitap"
    ADD CONSTRAINT "unique_Kitap_UrunID" PRIMARY KEY ("UrunID");


--
-- Name: Kullanici unique_Kullanici_KullaniciID; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Kullanici"
    ADD CONSTRAINT "unique_Kullanici_KullaniciID" PRIMARY KEY ("KullaniciID");


--
-- Name: Sepet unique_Sepet_SepetID; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sepet"
    ADD CONSTRAINT "unique_Sepet_SepetID" PRIMARY KEY ("SepetID");


--
-- Name: Silinenler unique_Silinenler_SilinenlerID; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Silinenler"
    ADD CONSTRAINT "unique_Silinenler_SilinenlerID" PRIMARY KEY ("SilinenlerID");


--
-- Name: Ulke unique_Ulke_UlkeID; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ulke"
    ADD CONSTRAINT "unique_Ulke_UlkeID" PRIMARY KEY ("UlkeID");


--
-- Name: Urun unique_Urun_UrunID; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Urun"
    ADD CONSTRAINT "unique_Urun_UrunID" PRIMARY KEY ("UrunID");


--
-- Name: YayinEvi unique_YayinEvi_YayinEviID; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."YayinEvi"
    ADD CONSTRAINT "unique_YayinEvi_YayinEviID" PRIMARY KEY ("YayinEviID");


--
-- Name: Yazar unique_Yazar_YazarID; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Yazar"
    ADD CONSTRAINT "unique_Yazar_YazarID" PRIMARY KEY ("YazarID");


--
-- Name: Yetki unique_Yetki_YetkiID; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Yetki"
    ADD CONSTRAINT "unique_Yetki_YetkiID" PRIMARY KEY ("YetkiID");


--
-- Name: Yorum unique_Yorum_YorumID; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Yorum"
    ADD CONSTRAINT "unique_Yorum_YorumID" PRIMARY KEY ("YorumID");


--
-- Name: Sepet SepetStokMiktari; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "SepetStokMiktari" BEFORE DELETE ON public."Sepet" FOR EACH STATEMENT EXECUTE FUNCTION public."StokDusur"();


--
-- Name: Kitap StokMiktariSifirOldugunda; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "StokMiktariSifirOldugunda" BEFORE UPDATE ON public."Kitap" FOR EACH ROW EXECUTE FUNCTION public."StokMiktariSifir"();


--
-- Name: ElektronikKitap ElektronikKitapUrunFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ElektronikKitap"
    ADD CONSTRAINT "ElektronikKitapUrunFK" FOREIGN KEY ("UrunID") REFERENCES public."Urun"("UrunID") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Kitap KitapUrunFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Kitap"
    ADD CONSTRAINT "KitapUrunFK" FOREIGN KEY ("UrunID") REFERENCES public."Urun"("UrunID") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: KitapCevirmen lnk_Cevirmen_KitapCevirmen; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."KitapCevirmen"
    ADD CONSTRAINT "lnk_Cevirmen_KitapCevirmen" FOREIGN KEY ("CevirmenID") REFERENCES public."Cevirmen"("CevirmenID") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Kullanici lnk_Dil_Kullanici; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Kullanici"
    ADD CONSTRAINT "lnk_Dil_Kullanici" FOREIGN KEY ("DilID") REFERENCES public."Dil"("DilID") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Urun lnk_Dil_Urun; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Urun"
    ADD CONSTRAINT "lnk_Dil_Urun" FOREIGN KEY ("DilID") REFERENCES public."Dil"("DilID") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Kitap lnk_KapakTipi_Kitap; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Kitap"
    ADD CONSTRAINT "lnk_KapakTipi_Kitap" FOREIGN KEY ("KapakTipiID") REFERENCES public."KapakTipi"("KapakTipiID") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Urun lnk_Kategori_Urun; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Urun"
    ADD CONSTRAINT "lnk_Kategori_Urun" FOREIGN KEY ("KategoriID") REFERENCES public."Kategori"("KategoriID") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Urun lnk_KitapTuru_Urun; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Urun"
    ADD CONSTRAINT "lnk_KitapTuru_Urun" FOREIGN KEY ("KitapTuruID") REFERENCES public."KitapTuru"("KitapTuruID") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: KitapCevirmen lnk_Kitap_KitapCevirmen; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."KitapCevirmen"
    ADD CONSTRAINT "lnk_Kitap_KitapCevirmen" FOREIGN KEY ("UrunID") REFERENCES public."Kitap"("UrunID") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: KitapYazar lnk_Kitap_KitapYazar; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."KitapYazar"
    ADD CONSTRAINT "lnk_Kitap_KitapYazar" FOREIGN KEY ("UrunID") REFERENCES public."Kitap"("UrunID") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Kullanici lnk_Ulke_Kullanici; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Kullanici"
    ADD CONSTRAINT "lnk_Ulke_Kullanici" FOREIGN KEY ("UlkeID") REFERENCES public."Ulke"("UlkeID") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Yazar lnk_Ulke_Yazar; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Yazar"
    ADD CONSTRAINT "lnk_Ulke_Yazar" FOREIGN KEY ("UlkeID") REFERENCES public."Ulke"("UlkeID") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Sepet lnk_Urun_Sepet; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sepet"
    ADD CONSTRAINT "lnk_Urun_Sepet" FOREIGN KEY ("UrunID") REFERENCES public."Urun"("UrunID") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Silinenler lnk_Urun_Silinenler; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Silinenler"
    ADD CONSTRAINT "lnk_Urun_Silinenler" FOREIGN KEY ("UrunID") REFERENCES public."Urun"("UrunID") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Yorum lnk_Urun_Yorum; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Yorum"
    ADD CONSTRAINT "lnk_Urun_Yorum" FOREIGN KEY ("UrunID") REFERENCES public."Urun"("UrunID") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Urun lnk_YayinEvi_Urun; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Urun"
    ADD CONSTRAINT "lnk_YayinEvi_Urun" FOREIGN KEY ("YayinEviID") REFERENCES public."YayinEvi"("YayinEviID") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: KitapYazar lnk_Yazar_KitapYazar; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."KitapYazar"
    ADD CONSTRAINT "lnk_Yazar_KitapYazar" FOREIGN KEY ("YazarID") REFERENCES public."Yazar"("YazarID") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Kullanici lnk_Yetki_Kullanici; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Kullanici"
    ADD CONSTRAINT "lnk_Yetki_Kullanici" FOREIGN KEY ("YetkiID") REFERENCES public."Yetki"("YetkiID") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

