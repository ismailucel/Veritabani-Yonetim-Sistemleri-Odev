--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1
-- Dumped by pg_dump version 13.1

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
-- Name: hastane; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE hastane WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Turkish_Turkey.1254';


ALTER DATABASE hastane OWNER TO postgres;

\connect hastane

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
-- Name: doktorUzmanlikDegisikligiIzleTR(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."doktorUzmanlikDegisikligiIzleTR"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF NEW."egitim" <> OLD."egitim" THEN
        INSERT INTO "public"."doktorUzmanlikDegisikligiIzle"("doktorNo", "eskiuzmanlik", "yeniuzmanlik", "degisiklikTarihi")
        VALUES(OLD."doktor_id", OLD."egitim", NEW."egitim", CURRENT_TIMESTAMP::TIMESTAMP);
    END IF;

    RETURN NEW;
END;
$$;


ALTER FUNCTION public."doktorUzmanlikDegisikligiIzleTR"() OWNER TO postgres;

--
-- Name: doktordolanimi(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.doktordolanimi() RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
    doktorlar doktor%ROWTYPE; -- doktor."doktor_id"%TYPE
    sonuc TEXT;
BEGIN
    sonuc := '';
    FOR doktorlar IN SELECT * FROM doktor LOOP
        sonuc := sonuc || doktorlar."doktor_id" || E'\t' || doktorlar."ad" || E'\r\n';
    END LOOP;
    RETURN sonuc;
END;
$$;


ALTER FUNCTION public.doktordolanimi() OWNER TO postgres;

--
-- Name: hastaBoyDegisikligiIzleTR(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."hastaBoyDegisikligiIzleTR"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF NEW."boy" <> OLD."boy" THEN
        INSERT INTO "public"."hastaBoyDegisikligiIzle"("hastaNo", "eskiboy", "yeniboy", "degisiklikTarihi")
        VALUES(OLD."hasta_id", OLD."boy", NEW."boy", CURRENT_TIMESTAMP::TIMESTAMP);
    END IF;

    RETURN NEW;
END;
$$;


ALTER FUNCTION public."hastaBoyDegisikligiIzleTR"() OWNER TO postgres;

--
-- Name: hastaKiloDegisikligiIzleTR(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."hastaKiloDegisikligiIzleTR"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF NEW."kilo" <> OLD."kilo" THEN
        INSERT INTO "public"."hastaKiloDegisikligiIzle"("hastaNo", "eskikilo", "yenikilo", "degisiklikTarihi")
        VALUES(OLD."hasta_id", OLD."kilo", NEW."kilo", CURRENT_TIMESTAMP::TIMESTAMP);
    END IF;

    RETURN NEW;
END;
$$;


ALTER FUNCTION public."hastaKiloDegisikligiIzleTR"() OWNER TO postgres;

--
-- Name: hastadolanimi(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.hastadolanimi() RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
    hastalar hasta%ROWTYPE; -- hasta."hasta_id"%TYPE
    sonuc TEXT;
BEGIN
    sonuc := '';
    FOR hastalar IN SELECT * FROM hasta LOOP
        sonuc := sonuc || hastalar."hasta_id" || E'\t' || hastalar."ad" || E'\r\n';
    END LOOP;
    RETURN sonuc;
END;
$$;


ALTER FUNCTION public.hastadolanimi() OWNER TO postgres;

--
-- Name: ilac2kat(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.ilac2kat(toplam_miktar integer, OUT ilacyeni real) RETURNS real
    LANGUAGE plpgsql
    AS $$
BEGIN
    ilacyeni := 2 * toplam_miktar;
END;
$$;


ALTER FUNCTION public.ilac2kat(toplam_miktar integer, OUT ilacyeni real) OWNER TO postgres;

--
-- Name: ilacSayiDegisikligiIzleTR(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."ilacSayiDegisikligiIzleTR"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF NEW."toplam_miktar" <> OLD."toplam_miktar" THEN
        INSERT INTO "public"."ilacSayiDegisikligiIzle"("ilacNo", "eskiilacsayisi", "yeniilacsayisi", "degisiklikTarihi")
        VALUES(OLD."ilac_adi", OLD."toplam_miktar", NEW."toplam_miktar", CURRENT_TIMESTAMP::TIMESTAMP);
    END IF;

    RETURN NEW;
END;
$$;


ALTER FUNCTION public."ilacSayiDegisikligiIzleTR"() OWNER TO postgres;

--
-- Name: ilac_fiyatdolanimi(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.ilac_fiyatdolanimi() RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
    ilaclar medikalmagaza%ROWTYPE; -- medikalmagaza."ilac_adi"%TYPE
    sonuc TEXT;
BEGIN
    sonuc := '';
    FOR ilaclar IN SELECT * FROM medikalmagaza LOOP
        sonuc := sonuc || ilaclar."ilac_adi" || E'\t' || ilaclar."ilac_fiyati" || E'\r\n';
    END LOOP;
    RETURN sonuc;
END;
$$;


ALTER FUNCTION public.ilac_fiyatdolanimi() OWNER TO postgres;

--
-- Name: yatak2_5kat(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.yatak2_5kat(toplam_yatak integer, OUT yatakyeni real) RETURNS real
    LANGUAGE plpgsql
    AS $$
BEGIN
    yatakyeni := 2.5* toplam_yatak;
END;
$$;


ALTER FUNCTION public.yatak2_5kat(toplam_yatak integer, OUT yatakyeni real) OWNER TO postgres;

--
-- Name: yatakSayiDegisikligiIzleTR(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public."yatakSayiDegisikligiIzleTR"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF NEW."toplam_yatak" <> OLD."toplam_yatak" THEN
        INSERT INTO "public"."yatakSayiDegisikligiIzle"("yatakNo", "eskiyataksayisi", "yeniyataksayisi", "degisiklikTarihi")
        VALUES(OLD."y_id", OLD."toplam_yatak", NEW."toplam_yatak", CURRENT_TIMESTAMP::TIMESTAMP);
    END IF;

    RETURN NEW;
END;
$$;


ALTER FUNCTION public."yatakSayiDegisikligiIzleTR"() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admin_erisim; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_erisim (
    y_id character varying(5),
    res_id character varying(5)
);


ALTER TABLE public.admin_erisim OWNER TO postgres;

--
-- Name: ayakta_tedavi_hasta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ayakta_tedavi_hasta (
    hasta_id character varying(5) NOT NULL,
    durumu_iyi_mi boolean
);


ALTER TABLE public.ayakta_tedavi_hasta OWNER TO postgres;

--
-- Name: bilgi_saglama; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bilgi_saglama (
    lt_id character varying(5),
    ilac_adi character varying(20),
    res_id character varying(5),
    hasta_sayisi integer,
    test_sayisi integer,
    "ilac_ihtiyacı" integer
);


ALTER TABLE public.bilgi_saglama OWNER TO postgres;

--
-- Name: doktor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.doktor (
    doktor_id character varying(20) NOT NULL,
    ad character varying(20),
    soyad character varying(20),
    cinsiyet character varying(6),
    adres character varying(40),
    milliyet character varying(15),
    egitim character varying(20),
    "katılma_tarihi" character varying(15),
    "uzmanlık" character varying(25),
    tc_no integer NOT NULL,
    d_tip character varying(20) NOT NULL
);


ALTER TABLE public.doktor OWNER TO postgres;

--
-- Name: doktorUzmanlikDegisikligiIzle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."doktorUzmanlikDegisikligiIzle" (
    "kayitNo" integer NOT NULL,
    "doktorNo" character varying NOT NULL,
    eskiuzmanlik character varying NOT NULL,
    yeniuzmanlik character varying NOT NULL,
    "degisiklikTarihi" timestamp without time zone NOT NULL
);


ALTER TABLE public."doktorUzmanlikDegisikligiIzle" OWNER TO postgres;

--
-- Name: doktorUzmanlikDegisikligiIzle_kayitNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."doktorUzmanlikDegisikligiIzle_kayitNo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."doktorUzmanlikDegisikligiIzle_kayitNo_seq" OWNER TO postgres;

--
-- Name: doktorUzmanlikDegisikligiIzle_kayitNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."doktorUzmanlikDegisikligiIzle_kayitNo_seq" OWNED BY public."doktorUzmanlikDegisikligiIzle"."kayitNo";


--
-- Name: hasta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hasta (
    hasta_id character varying(5) NOT NULL,
    ad character varying(20),
    soyad character varying(20),
    cinsiyet character varying(5),
    dogum_tarihi character varying(15),
    boy integer,
    kilo integer,
    test_rapor character varying(30),
    hasta_tip character varying(15) DEFAULT 'A'::character varying,
    res_id character varying(5),
    lt_id character varying(5),
    ilac_adi character varying(20)
);


ALTER TABLE public.hasta OWNER TO postgres;

--
-- Name: hastaBoyDegisikligiIzle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."hastaBoyDegisikligiIzle" (
    "kayitNo" integer NOT NULL,
    "hastaNo" character varying NOT NULL,
    eskiboy integer NOT NULL,
    yeniboy integer NOT NULL,
    "degisiklikTarihi" timestamp without time zone NOT NULL
);


ALTER TABLE public."hastaBoyDegisikligiIzle" OWNER TO postgres;

--
-- Name: hastaBoyDegisikligiIzle_kayitNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."hastaBoyDegisikligiIzle_kayitNo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."hastaBoyDegisikligiIzle_kayitNo_seq" OWNER TO postgres;

--
-- Name: hastaBoyDegisikligiIzle_kayitNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."hastaBoyDegisikligiIzle_kayitNo_seq" OWNED BY public."hastaBoyDegisikligiIzle"."kayitNo";


--
-- Name: hastaKiloDegisikligiIzle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."hastaKiloDegisikligiIzle" (
    "kayitNo" integer NOT NULL,
    "hastaNo" character varying NOT NULL,
    eskikilo integer NOT NULL,
    yenikilo integer NOT NULL,
    "degisiklikTarihi" timestamp without time zone NOT NULL
);


ALTER TABLE public."hastaKiloDegisikligiIzle" OWNER TO postgres;

--
-- Name: hastaKiloDegisikligiIzle_kayitNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."hastaKiloDegisikligiIzle_kayitNo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."hastaKiloDegisikligiIzle_kayitNo_seq" OWNER TO postgres;

--
-- Name: hastaKiloDegisikligiIzle_kayitNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."hastaKiloDegisikligiIzle_kayitNo_seq" OWNED BY public."hastaKiloDegisikligiIzle"."kayitNo";


--
-- Name: ilacSayiDegisikligiIzle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ilacSayiDegisikligiIzle" (
    "kayitNo" integer NOT NULL,
    "ilacNo" character varying NOT NULL,
    eskiilacsayisi character varying NOT NULL,
    yeniilacsayisi character varying NOT NULL,
    "degisiklikTarihi" timestamp without time zone NOT NULL
);


ALTER TABLE public."ilacSayiDegisikligiIzle" OWNER TO postgres;

--
-- Name: ilacSayiDegisikligiIzle_kayitNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ilacSayiDegisikligiIzle_kayitNo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ilacSayiDegisikligiIzle_kayitNo_seq" OWNER TO postgres;

--
-- Name: ilacSayiDegisikligiIzle_kayitNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ilacSayiDegisikligiIzle_kayitNo_seq" OWNED BY public."ilacSayiDegisikligiIzle"."kayitNo";


--
-- Name: kullanici; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kullanici (
    kullanici_id character varying(5) NOT NULL,
    kullanici_sifre character varying(8),
    ad character varying(20),
    soyad character varying(20),
    cinsiyet character varying(5),
    tel_no integer,
    yas integer
);


ALTER TABLE public.kullanici OWNER TO postgres;

--
-- Name: laboratuvar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.laboratuvar (
    lt_id character varying(5) NOT NULL,
    lt_sifre character varying(15),
    test_adi character varying(15),
    test_aciklamisi character varying(30)
);


ALTER TABLE public.laboratuvar OWNER TO postgres;

--
-- Name: medikalmagaza; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medikalmagaza (
    ilac_adi character varying(20) NOT NULL,
    toplam_miktar integer,
    "tüketilen_miktar" integer,
    mevcut_miktar integer,
    alinma_tarihi character varying(15),
    ilac_fiyati integer
);


ALTER TABLE public.medikalmagaza OWNER TO postgres;

--
-- Name: muayene; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.muayene (
    doktor_id character varying(5),
    hasta_id character varying(5),
    recete character varying(255)
);


ALTER TABLE public.muayene OWNER TO postgres;

--
-- Name: pers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pers (
    res_id character varying(5),
    ilac_adi character varying(20),
    lt_id character varying(5),
    lab_asistan character varying(15) NOT NULL,
    magaza_sorumlusu character varying(15)
);


ALTER TABLE public.pers OWNER TO postgres;

--
-- Name: randevu_takvimi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.randevu_takvimi (
    randevu_tarihi character varying(15),
    randevu_saati character varying(6),
    doktor_id character varying(5) NOT NULL,
    hasta_id character varying(5)
);


ALTER TABLE public.randevu_takvimi OWNER TO postgres;

--
-- Name: resepsiyonist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resepsiyonist (
    res_id character varying(5) NOT NULL,
    r_sifre character varying(15),
    ad character varying(20),
    soyad character varying(20),
    cinsiyet character varying(15),
    adres character varying(40),
    milliyet character varying(15),
    egitim character varying(15) NOT NULL
);


ALTER TABLE public.resepsiyonist OWNER TO postgres;

--
-- Name: sistem_admini; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sistem_admini (
    admin_id character varying(5) NOT NULL,
    admin_sifre character varying(15),
    ad character varying(20),
    soyad character varying(20),
    cinsiyet character varying(5),
    adres character varying(40)
);


ALTER TABLE public.sistem_admini OWNER TO postgres;

--
-- Name: yatak; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.yatak (
    y_id character varying(20) NOT NULL,
    y_tip character varying(10) NOT NULL,
    cinsiyet character varying(5),
    toplam_yatak integer,
    uygun_yatak integer
);


ALTER TABLE public.yatak OWNER TO postgres;

--
-- Name: yatakSayiDegisikligiIzle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."yatakSayiDegisikligiIzle" (
    "kayitNo" integer NOT NULL,
    "yatakNo" character varying NOT NULL,
    eskiyataksayisi character varying NOT NULL,
    yeniyataksayisi character varying NOT NULL,
    "degisiklikTarihi" timestamp without time zone NOT NULL
);


ALTER TABLE public."yatakSayiDegisikligiIzle" OWNER TO postgres;

--
-- Name: yatakSayiDegisikligiIzle_kayitNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."yatakSayiDegisikligiIzle_kayitNo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."yatakSayiDegisikligiIzle_kayitNo_seq" OWNER TO postgres;

--
-- Name: yatakSayiDegisikligiIzle_kayitNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."yatakSayiDegisikligiIzle_kayitNo_seq" OWNED BY public."yatakSayiDegisikligiIzle"."kayitNo";


--
-- Name: yatili_hasta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.yatili_hasta (
    hasta_id character varying(5) NOT NULL,
    y_id character varying(20),
    "katılma_tarihi" character varying(18),
    "ayrılma_tarihi" character varying(18)
);


ALTER TABLE public.yatili_hasta OWNER TO postgres;

--
-- Name: doktorUzmanlikDegisikligiIzle kayitNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."doktorUzmanlikDegisikligiIzle" ALTER COLUMN "kayitNo" SET DEFAULT nextval('public."doktorUzmanlikDegisikligiIzle_kayitNo_seq"'::regclass);


--
-- Name: hastaBoyDegisikligiIzle kayitNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."hastaBoyDegisikligiIzle" ALTER COLUMN "kayitNo" SET DEFAULT nextval('public."hastaBoyDegisikligiIzle_kayitNo_seq"'::regclass);


--
-- Name: hastaKiloDegisikligiIzle kayitNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."hastaKiloDegisikligiIzle" ALTER COLUMN "kayitNo" SET DEFAULT nextval('public."hastaKiloDegisikligiIzle_kayitNo_seq"'::regclass);


--
-- Name: ilacSayiDegisikligiIzle kayitNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ilacSayiDegisikligiIzle" ALTER COLUMN "kayitNo" SET DEFAULT nextval('public."ilacSayiDegisikligiIzle_kayitNo_seq"'::regclass);


--
-- Name: yatakSayiDegisikligiIzle kayitNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."yatakSayiDegisikligiIzle" ALTER COLUMN "kayitNo" SET DEFAULT nextval('public."yatakSayiDegisikligiIzle_kayitNo_seq"'::regclass);


--
-- Data for Name: admin_erisim; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.admin_erisim VALUES ('W001', 'R010');
INSERT INTO public.admin_erisim VALUES ('W001', 'R009');
INSERT INTO public.admin_erisim VALUES ('W001', 'R003');
INSERT INTO public.admin_erisim VALUES ('W001', 'R004');
INSERT INTO public.admin_erisim VALUES ('W004', 'R008');
INSERT INTO public.admin_erisim VALUES ('W004', 'R005');
INSERT INTO public.admin_erisim VALUES ('W004', 'R002');
INSERT INTO public.admin_erisim VALUES ('W002', 'R001');
INSERT INTO public.admin_erisim VALUES ('W002', 'R007');
INSERT INTO public.admin_erisim VALUES ('W003', 'R006');


--
-- Data for Name: ayakta_tedavi_hasta; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ayakta_tedavi_hasta VALUES ('P004', true);
INSERT INTO public.ayakta_tedavi_hasta VALUES ('P005', true);
INSERT INTO public.ayakta_tedavi_hasta VALUES ('P006', true);
INSERT INTO public.ayakta_tedavi_hasta VALUES ('P008', true);
INSERT INTO public.ayakta_tedavi_hasta VALUES ('P010', true);
INSERT INTO public.ayakta_tedavi_hasta VALUES ('P002', true);
INSERT INTO public.ayakta_tedavi_hasta VALUES ('P003', true);


--
-- Data for Name: bilgi_saglama; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.bilgi_saglama VALUES ('lt010', 'Paracetomol', 'R002', 10, 40, 200);
INSERT INTO public.bilgi_saglama VALUES ('lt010', 'Ibuprofen', 'R008', 20, 40, 500);
INSERT INTO public.bilgi_saglama VALUES ('lt004', 'Doxylamine', 'R005', 5, 40, 300);
INSERT INTO public.bilgi_saglama VALUES ('lt007', 'Ibuprofen', 'R004', 30, 70, 1000);
INSERT INTO public.bilgi_saglama VALUES ('lt009', 'Accolate', 'R010', 10, 40, 400);
INSERT INTO public.bilgi_saglama VALUES ('lt002', 'Metronidazole', 'R007', 10, 20, 600);
INSERT INTO public.bilgi_saglama VALUES ('lt003', 'Loperamide', 'R006', 10, 40, 200);
INSERT INTO public.bilgi_saglama VALUES ('lt003', 'Promethazine', 'R009', 5, 40, 700);
INSERT INTO public.bilgi_saglama VALUES ('lt009', 'Doxylamine', 'R008', 10, 40, 200);
INSERT INTO public.bilgi_saglama VALUES ('lt003', 'Acitretin', 'R003', 50, 40, 800);


--
-- Data for Name: doktor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.doktor VALUES ('0001', 'Dr Ahmet', 'Öztürk', 'E', 'Başakşehir', 'Turk', 'Doçent', '10.11.1995', 'Cerrahi', 1110100234, 'Geçici');
INSERT INTO public.doktor VALUES ('0002', 'Dr Ayhan', 'Doğan', 'E', 'Kadıköy', 'Turk', 'Doçent', '10.11.1995', 'Ürolog', 1110100234, 'Geçici');
INSERT INTO public.doktor VALUES ('0004', 'Dr Hatice', 'Şeref', 'K', 'Fatih', 'Turk', 'Operatör Doktor', '1.11.2003', 'Beyin Cerrahı', 1256478293, 'Geçici');
INSERT INTO public.doktor VALUES ('0005', 'Dr Sıla', 'Özkan', 'K', 'Beykoz', 'Turk', 'Uzman Doktor', '10.01.2003', 'Fizik Tedavi', 1110100234, 'Kalıcı');
INSERT INTO public.doktor VALUES ('0008', 'Dr Furkan', 'Görk', 'E', 'Halkalı', 'Turk', 'Uzman Doktor', '11.06.2000', 'Dermatolog', 1117281987, 'Kalıcı');
INSERT INTO public.doktor VALUES ('0009', 'Dr Uğur', 'Şahin', 'E', 'Beylikdüzü', 'Turk', 'Profesör Doktor', '15.07.1988', 'İç Hastalıkları', 1117765432, 'Kalıcı');
INSERT INTO public.doktor VALUES ('0010', 'Dr Meryem', 'Kasap', 'K', 'Beşiktaş', 'Turk', 'Profesör Doktor', '10.11.1995', 'Dahiliye', 1116543765, 'Kalıcı');
INSERT INTO public.doktor VALUES ('0003', 'Dr Gökçe', 'Fırat', 'K', 'Büyükçekmece', 'Turk', 'Ordinaryüs', '10.11.1995', 'Dahiliye', 1110100234, 'Geçici');
INSERT INTO public.doktor VALUES ('0006', 'Dr Yunus', 'Karadis', 'E', 'Başakşehir', 'Turk', 'Yardımcı Docent', '10.05.1990', 'Diş Hekimi', 1115388276, 'Kalıcı');
INSERT INTO public.doktor VALUES ('0007', 'Dr Özgür', 'Deniz', 'E', 'Üsküdar', 'Turk', 'Operator Doktor', '1.05.2010', 'Psikiyatri', 1342567835, 'Kalıcı');


--
-- Data for Name: doktorUzmanlikDegisikligiIzle; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."doktorUzmanlikDegisikligiIzle" VALUES (1, '0006', 'Uzman Doktor', 'Yardımcı Docent', '2020-12-29 22:35:23.672375');
INSERT INTO public."doktorUzmanlikDegisikligiIzle" VALUES (2, '0007', 'Uzman Doktor', 'Operator Doktor', '2020-12-29 22:35:50.568634');


--
-- Data for Name: hasta; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.hasta VALUES ('P006', 'Leyla', 'Şengül', 'K', '1961-07-04', 165, 60, 'Kalp Ağrısı', 'A', 'R007', 'lt010', 'Doxylamine');
INSERT INTO public.hasta VALUES ('P007', 'Erkan', 'Beyaz', 'E', '1989-06-05', 179, 80, 'Yüksek Ateş', 'Y', 'R003', 'lt005', 'Promethazine');
INSERT INTO public.hasta VALUES ('P008', 'Helin', 'Ilgaz', 'K', '1994-12-19', 174, 51, 'Baş Dönmesi', 'A', 'R006', 'lt008', 'Codeine');
INSERT INTO public.hasta VALUES ('P010', 'Serhat', 'Öge', 'E', '2010-01-15', 182, 75, 'Halsizlik', 'A', 'R010', 'lt009', 'Loperamide');
INSERT INTO public.hasta VALUES ('P009', 'Can', 'Sever', 'E', '1979-10-30', 189, 75, 'Boşaltım Enfeksiyonuu', 'Y', 'R009', 'lt007', 'Doxylamine');
INSERT INTO public.hasta VALUES ('P005', 'Mehmet', 'Doğan', 'E', '1991-11-27', 171, 75, 'Enfeksiyon', 'A', 'R008', 'lt001', 'Ibuprofen');
INSERT INTO public.hasta VALUES ('P002', 'Murat', 'Yildirim', 'E', '2009-09-29', 165, 51, 'Mide Bulantisi', 'A', 'R014', 'lt007', 'Ibuprofen');
INSERT INTO public.hasta VALUES ('P003', 'Barbaros', 'Ugur', 'E', '1984-02-10', 171, 60, 'Covid Pozitif', 'A', 'R010', 'lt006', 'Favirpavir');
INSERT INTO public.hasta VALUES ('P001', 'Samet', 'Kalyon', 'K', '2001-07-11', 168, 81, 'Trafik Kazasi', 'Y', 'R013', 'lt009', 'Loperamide');
INSERT INTO public.hasta VALUES ('P012', 'Hasan', 'Bakirci', 'E', '1965-12-28', 179, 75, 'Covid Pozitif', 'Y', 'R014', 'lt006', 'Favirpavir');
INSERT INTO public.hasta VALUES ('P011', 'Ozge', 'Tunc', 'K', '2000-01-18', 176, 61, 'Covid Pozitif', 'Y', 'R014', 'lt006', 'Favirpavir');
INSERT INTO public.hasta VALUES ('P013', 'Cenk', 'Dogan', 'E', '1979-05-01', 169, 54, 'Mide Bulantisi', 'Y', 'R005', 'lt005', 'Accolate');
INSERT INTO public.hasta VALUES ('P004', 'Naile', 'Şentürk', 'K', '1996-05-08', 169, 60, 'Dis Agrisi', 'A', 'R004', 'lt003', 'Metronidazole');


--
-- Data for Name: hastaBoyDegisikligiIzle; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."hastaBoyDegisikligiIzle" VALUES (1, 'p020', 190, 187, '2020-12-29 22:15:02.536586');
INSERT INTO public."hastaBoyDegisikligiIzle" VALUES (2, 'P009', 194, 176, '2020-12-29 22:15:09.850177');
INSERT INTO public."hastaBoyDegisikligiIzle" VALUES (3, 'P009', 176, 189, '2020-12-29 22:15:16.345394');


--
-- Data for Name: hastaKiloDegisikligiIzle; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."hastaKiloDegisikligiIzle" VALUES (1, 'P009', 77, 75, '2020-12-29 22:04:47.046567');
INSERT INTO public."hastaKiloDegisikligiIzle" VALUES (2, 'P007', 67, 80, '2020-12-29 22:04:49.940698');
INSERT INTO public."hastaKiloDegisikligiIzle" VALUES (3, 'P017', 185, 100, '2020-12-29 22:04:52.104445');
INSERT INTO public."hastaKiloDegisikligiIzle" VALUES (4, 'P005', 70, 75, '2020-12-29 22:06:05.165694');
INSERT INTO public."hastaKiloDegisikligiIzle" VALUES (5, 'P013', 57, 54, '2020-12-30 11:40:49.001742');
INSERT INTO public."hastaKiloDegisikligiIzle" VALUES (6, 'P004', 55, 60, '2020-12-30 13:25:04.432939');
INSERT INTO public."hastaKiloDegisikligiIzle" VALUES (7, 'P030', 85, 95, '2020-12-30 13:44:07.33206');
INSERT INTO public."hastaKiloDegisikligiIzle" VALUES (8, 'P035', 100, 90, '2020-12-30 14:09:16.593053');
INSERT INTO public."hastaKiloDegisikligiIzle" VALUES (9, 'P036', 85, 75, '2020-12-30 14:44:52.821525');
INSERT INTO public."hastaKiloDegisikligiIzle" VALUES (10, 'P038', 100, 80, '2020-12-30 15:07:11.836861');
INSERT INTO public."hastaKiloDegisikligiIzle" VALUES (11, 'P040', 75, 65, '2020-12-30 15:13:37.332011');
INSERT INTO public."hastaKiloDegisikligiIzle" VALUES (12, 'P041', 75, 64, '2020-12-30 15:31:59.745941');


--
-- Data for Name: ilacSayiDegisikligiIzle; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."ilacSayiDegisikligiIzle" VALUES (1, 'calamine lotion', '500', '750', '2020-12-29 23:04:18.755624');
INSERT INTO public."ilacSayiDegisikligiIzle" VALUES (2, 'Doxylamine', '500', '550', '2020-12-29 23:04:24.782704');
INSERT INTO public."ilacSayiDegisikligiIzle" VALUES (3, 'Doxylu', '500', '1200', '2020-12-29 23:04:28.158932');
INSERT INTO public."ilacSayiDegisikligiIzle" VALUES (4, 'Codenal', '500', '1200', '2020-12-29 23:08:08.171549');
INSERT INTO public."ilacSayiDegisikligiIzle" VALUES (5, 'Codeine', '500', '800', '2020-12-30 14:46:01.735052');
INSERT INTO public."ilacSayiDegisikligiIzle" VALUES (6, 'Accolate', '500', '800', '2020-12-30 15:14:44.768759');
INSERT INTO public."ilacSayiDegisikligiIzle" VALUES (7, 'Acitretin', '600', '800', '2020-12-30 15:33:17.725616');


--
-- Data for Name: kullanici; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.kullanici VALUES ('P007', 'kird76', 'Uğur', 'Özer', 'E', 175, 21);
INSERT INTO public.kullanici VALUES ('P009', 'nicjn23', 'Deniz', 'Özkan', 'K', 167, 27);
INSERT INTO public.kullanici VALUES ('P001', '123', 'Emir', 'Kahraman', 'E', 169, 38);


--
-- Data for Name: laboratuvar; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.laboratuvar VALUES ('lt003', 'lab123', 'Blood Pressure', NULL);
INSERT INTO public.laboratuvar VALUES ('lt008', 'lab123', 'X-RAY', 'Xray');
INSERT INTO public.laboratuvar VALUES ('lt001', 'lab123', 'PTT', 'Trombosit Testi');
INSERT INTO public.laboratuvar VALUES ('lt010', 'lab123', 'EKG', 'Kalp Ritim Testi');
INSERT INTO public.laboratuvar VALUES ('lt009', 'lab123', 'Widal Test', 'Tifoid');
INSERT INTO public.laboratuvar VALUES ('lt007', 'lab123', 'UA', 'İdrar Analizi');
INSERT INTO public.laboratuvar VALUES ('lt006', 'lab123', 'BUN', 'Kan Testi');
INSERT INTO public.laboratuvar VALUES ('lt005', 'lab123', 'CPK', 'Kreatin Fosfokinaz');
INSERT INTO public.laboratuvar VALUES ('lt004', 'lab123', 'CBC', 'Kan Hücresi Testi');
INSERT INTO public.laboratuvar VALUES ('lt002', 'lab123', 'HCG', 'Kronik Ganotrapin');


--
-- Data for Name: medikalmagaza; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.medikalmagaza VALUES ('calamine lotion', 750, 200, 300, '2017-03-27', 10);
INSERT INTO public.medikalmagaza VALUES ('chlorohexidine', 600, 200, 400, '2020-02-06', 6);
INSERT INTO public.medikalmagaza VALUES ('Codenal', 1200, 150, 350, '2016-11-11', 210);
INSERT INTO public.medikalmagaza VALUES ('Diclofinac', 500, 140, 360, '2017-10-19', 160);
INSERT INTO public.medikalmagaza VALUES ('Doxylamine', 550, 500, 450, '2020-01-07', 12);
INSERT INTO public.medikalmagaza VALUES ('Doxylu', 1200, 500, 450, '2019-12-18', 12);
INSERT INTO public.medikalmagaza VALUES ('fluconazole', 1000, 600, 400, '2018-01-12', 143);
INSERT INTO public.medikalmagaza VALUES ('ketoconazole', 2000, 1000, 1000, '2017-12-24', 8);
INSERT INTO public.medikalmagaza VALUES ('Ketoconazole', 1000, 600, 400, '2018-01-05', 143);
INSERT INTO public.medikalmagaza VALUES ('Loperamide', 2000, 1000, 1000, '2017-11-27', 8);
INSERT INTO public.medikalmagaza VALUES ('Metronidazole', 500, 140, 360, '2018-02-16', 48);
INSERT INTO public.medikalmagaza VALUES ('Paracetomol', 500, 140, 360, '2017-11-19', 160);
INSERT INTO public.medikalmagaza VALUES ('povidone', 500, 140, 360, '2019-05-11', 48);
INSERT INTO public.medikalmagaza VALUES ('povone', 1500, 500, 1000, '2018-03-17', 13);
INSERT INTO public.medikalmagaza VALUES ('Promethazine', 1500, 500, 1000, '2020-10-09', 13);
INSERT INTO public.medikalmagaza VALUES ('Favirpavir', 10000, 8000, 1002, '2020-04-23', 20000);
INSERT INTO public.medikalmagaza VALUES ('Ibuprofen', 5000, 1500, 3500, ' 2017-12-12', 85);
INSERT INTO public.medikalmagaza VALUES ('Codeine', 800, 150, 350, ' 2017-12-28', 210);
INSERT INTO public.medikalmagaza VALUES ('Accolate', 800, 200, 300, ' 2020-12-15', 10);
INSERT INTO public.medikalmagaza VALUES ('Acitretin', 800, 200, 400, ' 2019-02-06', 6);


--
-- Data for Name: muayene; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.muayene VALUES ('0002', 'P007', 'Promethazine, hapları kullan');


--
-- Data for Name: pers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pers VALUES ('R001', 'Ibuprofen', 'lt010', 'Hüseyin', 'Mustafa');
INSERT INTO public.pers VALUES ('R002', 'Codeine', 'lt010', 'Mahmut', 'Muharrem');
INSERT INTO public.pers VALUES ('R003', 'Paracetomol', 'lt003', 'Demir', 'Taner');
INSERT INTO public.pers VALUES ('R004', 'Doxylamine', 'lt006', 'Muharrem', 'Ümit');
INSERT INTO public.pers VALUES ('R005', 'Loperamide', 'lt001', 'Emir', 'Engin');
INSERT INTO public.pers VALUES ('R006', 'Acitretin', 'lt004', 'Barbaros', 'Sabri');
INSERT INTO public.pers VALUES ('R007', 'Ibuprofen', 'lt008', 'Mert', 'Ali');
INSERT INTO public.pers VALUES ('R008', 'Metronidazole', 'lt009', 'Tanju', 'Gökhan');
INSERT INTO public.pers VALUES ('R009', 'Accolate', 'lt002', 'Uğur', 'Altay');
INSERT INTO public.pers VALUES ('R010', 'Doxylamine', 'lt003', 'Sait', 'Ozan');


--
-- Data for Name: randevu_takvimi; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.randevu_takvimi VALUES ('2020-12-28', '14:45', '0010', 'P001');
INSERT INTO public.randevu_takvimi VALUES ('2018-05-06', '15:15', '0009', 'P009');
INSERT INTO public.randevu_takvimi VALUES ('2019-01-02', '14:30', '0007', 'P007');


--
-- Data for Name: resepsiyonist; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.resepsiyonist VALUES ('R001', 'serkan123', 'Serkan', 'Hikmet', 'M', 'Kasımpaşa', 'Turk', 'Lisans');
INSERT INTO public.resepsiyonist VALUES ('R010', 'tugba123', 'Tuğba', 'Yılmaz', 'F', 'Beşiktaş', 'Turk', 'Lisans');
INSERT INTO public.resepsiyonist VALUES ('R002', 'tuncay123', 'Tuncay', 'Tufan', 'M', 'Fatih', 'Turk', 'Lisans');
INSERT INTO public.resepsiyonist VALUES ('R020', 'büşra123', 'Büşra', 'Özcan', 'F', 'Başakşehir', 'Turk', 'Lisans');
INSERT INTO public.resepsiyonist VALUES ('R011', 'buse123', 'Buse', 'Can', 'F', 'Fatih', 'Turk', 'Lisans');
INSERT INTO public.resepsiyonist VALUES ('R003', 'sena123', 'Sena', 'Öz', 'F', 'Bağcılar', 'Turk', 'Önlisans');
INSERT INTO public.resepsiyonist VALUES ('R012', 'ibrahim123', 'İbrahim', 'Yavuz', 'M', 'Fatih', 'Turk', 'Önlisans');
INSERT INTO public.resepsiyonist VALUES ('R004', 'yiğit123', 'Yiğit', 'Kahraman', 'M', 'Fatih', 'Turk', 'Önlisans');
INSERT INTO public.resepsiyonist VALUES ('R013', 'nilgün123', 'Nilgün ', 'Bulut', 'F', 'Bahçelievler', 'Turk', 'Lise');
INSERT INTO public.resepsiyonist VALUES ('R005', 'emre123', 'Emre', 'Doğan', 'M', 'Başakşehir', 'Turk', 'Lisans');
INSERT INTO public.resepsiyonist VALUES ('R014', 'şükrü123', 'Şükrü', 'Kaplan', 'M', 'Fatih', 'Turk', 'Lisans');
INSERT INTO public.resepsiyonist VALUES ('R006', 'damla123', 'Damla', 'Çakır', 'F', 'Halkalı', 'Turk', 'Lisans');
INSERT INTO public.resepsiyonist VALUES ('R007', 'ozan123', 'Ozan', 'Erkin', 'M', 'Esenler', 'Turk', 'Lisans');
INSERT INTO public.resepsiyonist VALUES ('R015', 'ayhan123', 'Ayhan', 'Aksoy', 'M', 'Esenler', 'Turk', 'Lisans');
INSERT INTO public.resepsiyonist VALUES ('R008', 'görkem123', 'Görkem', 'Celik', 'M', 'Halkalı', 'Turk', 'Önlisans');
INSERT INTO public.resepsiyonist VALUES ('R016', 'derya123', 'Derya', 'Özer', 'F', 'Halkalı', 'Turk', 'Önlisans');
INSERT INTO public.resepsiyonist VALUES ('R009', 'meryem123', 'Meryem', 'Yar', 'F', 'Üsküdar', 'Turk', 'Lise');
INSERT INTO public.resepsiyonist VALUES ('R017', 'sinem123', 'Sinem', 'Yavuz', 'F', 'Bağcılar', 'Turk', 'Lisans');
INSERT INTO public.resepsiyonist VALUES ('R018', 'mustafa123', 'Mustafa', 'Kaya', 'M', 'Bağcılar', 'Turk', 'Lisans');
INSERT INTO public.resepsiyonist VALUES ('R019', 'arzu123', 'Arzu', 'Özdenşr', 'F', 'Fatih', 'Turk', 'Lisans');


--
-- Data for Name: sistem_admini; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sistem_admini VALUES ('A001', 'derya123', 'Derya', 'Ateş', 'K', 'Fatih');
INSERT INTO public.sistem_admini VALUES ('A002', 'burak123', 'Burak', 'Polat', 'E', 'Fatih');
INSERT INTO public.sistem_admini VALUES ('A003', 'sinem123', 'Sinem', 'Bozkurt', 'K', 'Bahçelievler');
INSERT INTO public.sistem_admini VALUES ('A004', 'meral123', 'Meral', 'Aktaş', 'K', 'Bakırköy');
INSERT INTO public.sistem_admini VALUES ('A005', 'murat123', 'Murat', 'Yıldız', 'E', 'Halkalı');
INSERT INTO public.sistem_admini VALUES ('A006', 'ibrahim123', 'İbrahim', 'Can', 'E', 'Bağcılar');
INSERT INTO public.sistem_admini VALUES ('A007', 'süleyman123', 'Süleyman', 'Gül', 'E', 'Esenler');
INSERT INTO public.sistem_admini VALUES ('A008', 'ceren123', 'Ceren', 'Avcı', 'K', 'Avcılar');
INSERT INTO public.sistem_admini VALUES ('A009', 'gaye123', 'Gaye', 'Yıldırım', 'K', 'Esenler');
INSERT INTO public.sistem_admini VALUES ('A010', 'emre123', 'Emre', 'Özcan', 'E', 'Esenyurt');


--
-- Data for Name: yatak; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.yatak VALUES ('W005', 'YBÜ', NULL, 10, 5);
INSERT INTO public.yatak VALUES ('W008', 'YBÜ', NULL, 15, 9);
INSERT INTO public.yatak VALUES ('W001', 'Genel', 'E', 18, 8);
INSERT INTO public.yatak VALUES ('W006', 'YBÜ', NULL, 35, 9);
INSERT INTO public.yatak VALUES ('W007', 'YBÜ', NULL, 3, 2);
INSERT INTO public.yatak VALUES ('W009', 'YBU', 'K', 150, 50);
INSERT INTO public.yatak VALUES ('W002', 'Genel', 'K', 20, 15);
INSERT INTO public.yatak VALUES ('W003', 'Genel', 'K', 40, 4);
INSERT INTO public.yatak VALUES ('W004', 'YBÜ', 'E', 60, 4);


--
-- Data for Name: yatakSayiDegisikligiIzle; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."yatakSayiDegisikligiIzle" VALUES (1, 'W003', '10', '40', '2020-12-29 22:50:32.40816');
INSERT INTO public."yatakSayiDegisikligiIzle" VALUES (2, 'W006', '15', '35', '2020-12-29 22:50:34.980167');
INSERT INTO public."yatakSayiDegisikligiIzle" VALUES (3, 'W007', '6', '3', '2020-12-29 22:50:36.919257');
INSERT INTO public."yatakSayiDegisikligiIzle" VALUES (4, 'W009', '600', '150', '2020-12-29 23:59:31.424162');
INSERT INTO public."yatakSayiDegisikligiIzle" VALUES (5, 'W004', '15', '60', '2020-12-30 15:32:54.199797');


--
-- Data for Name: yatili_hasta; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.yatili_hasta VALUES ('P009', 'W001', '04.03.2018', '19.03.2018');
INSERT INTO public.yatili_hasta VALUES ('P001', 'W002', '2020-03-23', '2020-03-27');
INSERT INTO public.yatili_hasta VALUES ('P007', 'W003', '12.01.2018', '27.02.2018');
INSERT INTO public.yatili_hasta VALUES ('P011', 'W004', '2020-10-12', '2020-10-18');
INSERT INTO public.yatili_hasta VALUES ('P012', 'W004', '2020-12-25', NULL);
INSERT INTO public.yatili_hasta VALUES ('P013', 'W006', '2020-12-28', NULL);


--
-- Name: doktorUzmanlikDegisikligiIzle_kayitNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."doktorUzmanlikDegisikligiIzle_kayitNo_seq"', 2, true);


--
-- Name: hastaBoyDegisikligiIzle_kayitNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."hastaBoyDegisikligiIzle_kayitNo_seq"', 3, true);


--
-- Name: hastaKiloDegisikligiIzle_kayitNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."hastaKiloDegisikligiIzle_kayitNo_seq"', 12, true);


--
-- Name: ilacSayiDegisikligiIzle_kayitNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ilacSayiDegisikligiIzle_kayitNo_seq"', 7, true);


--
-- Name: yatakSayiDegisikligiIzle_kayitNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."yatakSayiDegisikligiIzle_kayitNo_seq"', 5, true);


--
-- Name: hastaKiloDegisikligiIzle PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."hastaKiloDegisikligiIzle"
    ADD CONSTRAINT "PK" PRIMARY KEY ("kayitNo");


--
-- Name: hastaBoyDegisikligiIzle PK2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."hastaBoyDegisikligiIzle"
    ADD CONSTRAINT "PK2" PRIMARY KEY ("kayitNo");


--
-- Name: doktorUzmanlikDegisikligiIzle PK3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."doktorUzmanlikDegisikligiIzle"
    ADD CONSTRAINT "PK3" PRIMARY KEY ("kayitNo");


--
-- Name: yatakSayiDegisikligiIzle PK4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."yatakSayiDegisikligiIzle"
    ADD CONSTRAINT "PK4" PRIMARY KEY ("kayitNo");


--
-- Name: ilacSayiDegisikligiIzle PK5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ilacSayiDegisikligiIzle"
    ADD CONSTRAINT "PK5" PRIMARY KEY ("kayitNo");


--
-- Name: ayakta_tedavi_hasta ayakta_tedavi_hasta.PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ayakta_tedavi_hasta
    ADD CONSTRAINT "ayakta_tedavi_hasta.PK" PRIMARY KEY (hasta_id);


--
-- Name: doktor doktor.PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doktor
    ADD CONSTRAINT "doktor.PK" PRIMARY KEY (doktor_id);


--
-- Name: hasta hasta.PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hasta
    ADD CONSTRAINT "hasta.PK" PRIMARY KEY (hasta_id);


--
-- Name: kullanici kullanici.PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kullanici
    ADD CONSTRAINT "kullanici.PK" PRIMARY KEY (kullanici_id);


--
-- Name: laboratuvar laboratuvar.PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.laboratuvar
    ADD CONSTRAINT "laboratuvar.PK" PRIMARY KEY (lt_id);


--
-- Name: medikalmagaza medikalmagaza.PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medikalmagaza
    ADD CONSTRAINT "medikalmagaza.PK" PRIMARY KEY (ilac_adi);


--
-- Name: randevu_takvimi randevu_takvimi.PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.randevu_takvimi
    ADD CONSTRAINT "randevu_takvimi.PK" PRIMARY KEY (doktor_id);


--
-- Name: resepsiyonist resepsiyonist.PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resepsiyonist
    ADD CONSTRAINT "resepsiyonist.PK" PRIMARY KEY (res_id);


--
-- Name: sistem_admini sistem_admini.PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sistem_admini
    ADD CONSTRAINT "sistem_admini.PK" PRIMARY KEY (admin_id);


--
-- Name: yatak yatak.PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yatak
    ADD CONSTRAINT "yatak.PK" PRIMARY KEY (y_id);


--
-- Name: yatili_hasta yatili_hasta.PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yatili_hasta
    ADD CONSTRAINT "yatili_hasta.PK" PRIMARY KEY (hasta_id);


--
-- Name: hasta boyDegistiginde; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "boyDegistiginde" BEFORE UPDATE ON public.hasta FOR EACH ROW EXECUTE FUNCTION public."hastaBoyDegisikligiIzleTR"();


--
-- Name: medikalmagaza ilacDegistiginde; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "ilacDegistiginde" BEFORE UPDATE ON public.medikalmagaza FOR EACH ROW EXECUTE FUNCTION public."ilacSayiDegisikligiIzleTR"();


--
-- Name: hasta kiloDegistiginde; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "kiloDegistiginde" BEFORE UPDATE ON public.hasta FOR EACH ROW EXECUTE FUNCTION public."hastaKiloDegisikligiIzleTR"();


--
-- Name: doktor uzmanlikDegistiginde; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "uzmanlikDegistiginde" BEFORE UPDATE ON public.doktor FOR EACH ROW EXECUTE FUNCTION public."doktorUzmanlikDegisikligiIzleTR"();


--
-- Name: yatak yatakDegistiginde; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "yatakDegistiginde" BEFORE UPDATE ON public.yatak FOR EACH ROW EXECUTE FUNCTION public."yatakSayiDegisikligiIzleTR"();


--
-- Name: admin_erisim admin_erisim.FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_erisim
    ADD CONSTRAINT "admin_erisim.FK" FOREIGN KEY (y_id) REFERENCES public.yatak(y_id);


--
-- Name: admin_erisim admin_erisim.FK2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_erisim
    ADD CONSTRAINT "admin_erisim.FK2" FOREIGN KEY (res_id) REFERENCES public.resepsiyonist(res_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ayakta_tedavi_hasta ayakta_tedavi_hasta.FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ayakta_tedavi_hasta
    ADD CONSTRAINT "ayakta_tedavi_hasta.FK" FOREIGN KEY (hasta_id) REFERENCES public.hasta(hasta_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: bilgi_saglama bilgi_saglama.FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bilgi_saglama
    ADD CONSTRAINT "bilgi_saglama.FK" FOREIGN KEY (lt_id) REFERENCES public.laboratuvar(lt_id);


--
-- Name: bilgi_saglama bilgi_saglama.FK2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bilgi_saglama
    ADD CONSTRAINT "bilgi_saglama.FK2" FOREIGN KEY (ilac_adi) REFERENCES public.medikalmagaza(ilac_adi);


--
-- Name: bilgi_saglama bilgi_saglama.FK3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bilgi_saglama
    ADD CONSTRAINT "bilgi_saglama.FK3" FOREIGN KEY (res_id) REFERENCES public.resepsiyonist(res_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: hasta hasta.FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hasta
    ADD CONSTRAINT "hasta.FK" FOREIGN KEY (res_id) REFERENCES public.resepsiyonist(res_id);


--
-- Name: hasta hasta.FK2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hasta
    ADD CONSTRAINT "hasta.FK2" FOREIGN KEY (lt_id) REFERENCES public.laboratuvar(lt_id);


--
-- Name: hasta hasta.FK3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hasta
    ADD CONSTRAINT "hasta.FK3" FOREIGN KEY (ilac_adi) REFERENCES public.medikalmagaza(ilac_adi);


--
-- Name: kullanici kullanici.FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kullanici
    ADD CONSTRAINT "kullanici.FK" FOREIGN KEY (kullanici_id) REFERENCES public.yatili_hasta(hasta_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: muayene muayene.FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.muayene
    ADD CONSTRAINT "muayene.FK" FOREIGN KEY (doktor_id) REFERENCES public.doktor(doktor_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: muayene muayene.FK2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.muayene
    ADD CONSTRAINT "muayene.FK2" FOREIGN KEY (hasta_id) REFERENCES public.yatili_hasta(hasta_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: pers pers.FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pers
    ADD CONSTRAINT "pers.FK" FOREIGN KEY (lt_id) REFERENCES public.laboratuvar(lt_id);


--
-- Name: pers pers.FK2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pers
    ADD CONSTRAINT "pers.FK2" FOREIGN KEY (ilac_adi) REFERENCES public.medikalmagaza(ilac_adi);


--
-- Name: pers pers.FK3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pers
    ADD CONSTRAINT "pers.FK3" FOREIGN KEY (res_id) REFERENCES public.resepsiyonist(res_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: randevu_takvimi randevu_takvimi.FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.randevu_takvimi
    ADD CONSTRAINT "randevu_takvimi.FK" FOREIGN KEY (hasta_id) REFERENCES public.yatili_hasta(hasta_id);


--
-- Name: yatili_hasta yatili_hastaFK2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yatili_hasta
    ADD CONSTRAINT "yatili_hastaFK2" FOREIGN KEY (hasta_id) REFERENCES public.hasta(hasta_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

