--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

-- Started on 2022-05-15 17:55:03

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 16829)
-- Name: autenticacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.autenticacion (
    id_autenticacion integer NOT NULL,
    madre character varying(100),
    fruta character varying(100),
    mascota character varying(100),
    tipo_letra character varying(10) NOT NULL,
    id_usuario integer NOT NULL
);


ALTER TABLE public.autenticacion OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16828)
-- Name: autenticacion_id_autenticacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.autenticacion_id_autenticacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.autenticacion_id_autenticacion_seq OWNER TO postgres;

--
-- TOC entry 3350 (class 0 OID 0)
-- Dependencies: 215
-- Name: autenticacion_id_autenticacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.autenticacion_id_autenticacion_seq OWNED BY public.autenticacion.id_autenticacion;


--
-- TOC entry 210 (class 1259 OID 16807)
-- Name: data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.data (
    auntenticar integer NOT NULL,
    id_tipo integer NOT NULL,
    letra character varying(100) NOT NULL,
    nombre character varying(100) NOT NULL,
    codigo character varying(250) NOT NULL
);


ALTER TABLE public.data OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16813)
-- Name: genero; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genero (
    id_gen integer NOT NULL,
    nom_gen character varying(50) NOT NULL
);


ALTER TABLE public.genero OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16812)
-- Name: genero_id_gen_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.genero_id_gen_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.genero_id_gen_seq OWNER TO postgres;

--
-- TOC entry 3351 (class 0 OID 0)
-- Dependencies: 211
-- Name: genero_id_gen_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.genero_id_gen_seq OWNED BY public.genero.id_gen;


--
-- TOC entry 209 (class 1259 OID 16802)
-- Name: tipo_palabra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_palabra (
    id_tipo integer NOT NULL,
    nombre character varying(30) NOT NULL
);


ALTER TABLE public.tipo_palabra OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16820)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    id_usuario integer NOT NULL,
    id_gen integer NOT NULL,
    apellidos character varying(200) NOT NULL,
    nombres character varying(200) NOT NULL,
    cedula character varying(15) NOT NULL,
    edad integer NOT NULL,
    nacimiento date NOT NULL,
    email character varying(200) NOT NULL,
    telefono character varying(20) NOT NULL,
    ciudad character varying(50) NOT NULL,
    direccion character varying(200) NOT NULL,
    usuario character varying(50) NOT NULL,
    password character varying(100) NOT NULL
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16819)
-- Name: usuario_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_id_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_id_usuario_seq OWNER TO postgres;

--
-- TOC entry 3352 (class 0 OID 0)
-- Dependencies: 213
-- Name: usuario_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_id_usuario_seq OWNED BY public.usuario.id_usuario;


--
-- TOC entry 3184 (class 2604 OID 16832)
-- Name: autenticacion id_autenticacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autenticacion ALTER COLUMN id_autenticacion SET DEFAULT nextval('public.autenticacion_id_autenticacion_seq'::regclass);


--
-- TOC entry 3182 (class 2604 OID 16816)
-- Name: genero id_gen; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genero ALTER COLUMN id_gen SET DEFAULT nextval('public.genero_id_gen_seq'::regclass);


--
-- TOC entry 3183 (class 2604 OID 16823)
-- Name: usuario id_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuario_id_usuario_seq'::regclass);


--
-- TOC entry 3344 (class 0 OID 16829)
-- Dependencies: 216
-- Data for Name: autenticacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.autenticacion (id_autenticacion, madre, fruta, mascota, tipo_letra, id_usuario) VALUES (1, 'Mónica', 'Manzana', 'Stuar', 'V', 1);


--
-- TOC entry 3338 (class 0 OID 16807)
-- Dependencies: 210
-- Data for Name: data; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (1, 1, 'A', 'Azul', '#0000FF');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (2, 1, 'A', 'Amarrillo', '#FFFF00');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (3, 1, 'A', 'Amaranto', '#FF355E');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (4, 1, 'A', 'Avellana', '#B48969');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (5, 2, 'A', 'Aguacate', 'https://i.ibb.co/cYWL6bh/Aguacate.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (6, 2, 'A', 'Aceituna', 'https://i.ibb.co/G7dgH8b/Aceituna.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (7, 2, 'A', 'Almendra', 'https://i.ibb.co/pLYZgZB/Almendra.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (8, 2, 'A', 'Avellana', 'https://i.ibb.co/x6h6r26/Avellana.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (9, 3, 'A', 'Abeja', 'https://i.ibb.co/dMGmvbB/Abeja.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (10, 3, 'A', 'Abejorro', 'https://i.ibb.co/Rgqbh72/Abejorro.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (11, 3, 'A', 'Águila', 'https://i.ibb.co/jHm0TtP/Aguila.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (12, 3, 'A', 'Alacrán', 'https://i.ibb.co/QcZ33zP/Alacran.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (13, 1, 'B', 'Bronce', '#CD7F32');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (14, 1, 'B', 'Barbecho', '#C19A6B');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (15, 1, 'B', 'Berenjena', '#291E29');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (16, 1, 'B', 'Bígaro', '#CCCCFF');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (17, 2, 'B', 'Baya', 'https://i.ibb.co/qpgXP5h/Baya.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (18, 2, 'B', 'Banana', 'https://i.ibb.co/rM2NH7F/Banana.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (19, 2, 'B', 'Babaco', 'https://i.ibb.co/F3dck82/Babaco.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (20, 2, 'B', 'Bellota', 'https://i.ibb.co/nr0tGqN/Bellota.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (21, 3, 'B', 'Babosa', 'https://i.ibb.co/xsbRQxd/Babosa.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (22, 3, 'B', 'Ballena', 'https://i.ibb.co/D8MWPS5/Ballena.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (23, 3, 'B', 'Bagre', 'https://i.ibb.co/89mtnDV/Bagre.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (24, 3, 'B', 'Burro', 'https://i.ibb.co/n0VWyMB/Burro.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (25, 1, 'C', 'Café', '#591F0B');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (26, 1, 'C', 'Cereza', '#DE3163');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (27, 1, 'C', 'Canela', '#BD8A3E');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (28, 1, 'C', 'Celeste', '#00CCFF');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (29, 2, 'C', 'Carambola', 'https://i.ibb.co/CvfbSrp/Carambola.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (30, 2, 'C', 'Chirimoya', 'https://i.ibb.co/GPb1z7M/Chirimoya.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (31, 2, 'C', 'Coco', 'https://i.ibb.co/KqLcF4G/Coco.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (32, 2, 'C', 'Cereza', 'https://i.ibb.co/3hZNVqV/Cereza.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (33, 3, 'C', 'Caballo', 'https://i.ibb.co/R7J1xdh/Caballo.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (34, 3, 'C', 'Cabra', 'https://i.ibb.co/tqyycKM/Cabra.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (35, 3, 'C', 'Calamar', 'https://i.ibb.co/WWcD7ZC/Calamar.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (36, 3, 'C', 'Camaleón', 'https://i.ibb.co/xfh0BG8/Camaleon.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (37, 1, 'D', 'Damasco', '#FAB57F');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (38, 1, 'D', 'Durazno', '#FFE5B4');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (39, 1, 'D', 'Dorado', '#D4AF37');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (40, 1, 'D', 'Desierto', '#CBAE74');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (41, 2, 'D', 'Durazno', 'https://i.ibb.co/TYFTy9X/Durazno.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (42, 2, 'D', 'Damasco', 'https://i.ibb.co/BPtnwpM/Damasco.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (43, 2, 'D', 'Damson', 'https://i.ibb.co/PYRpvXD/Damson.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (44, 2, 'D', 'Durian', 'https://i.ibb.co/1rnm8NJ/Durian.webp');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (45, 3, 'D', 'Delfín', 'https://i.ibb.co/2gWChrv/Delfin.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (46, 3, 'D', 'Danta', 'https://i.ibb.co/SKz0dh7/Danta.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (47, 3, 'D', 'Diucon', 'https://i.ibb.co/R7W0jc3/Diucon.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (48, 3, 'D', 'Ducula', 'https://i.ibb.co/D45MwTC/Ducula.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (49, 1, 'E', 'Escarlata', '#FD2D1C');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (50, 1, 'E', 'Espinaca', '#4A5D23');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (51, 1, 'E', 'Esmeralda', '#009975');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (52, 1, 'E', 'Ébano', '#37312B');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (53, 2, 'E', 'Endrinas', 'https://i.ibb.co/fxbMDXN/Endrinas.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (54, 2, 'E', 'Elote', 'https://i.ibb.co/vB4BxcG/Elote.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (55, 2, 'E', 'Escaramujo', 'https://i.ibb.co/SnsPP3N/Escaramujo.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (56, 2, 'E', 'Embaúba ', 'https://i.ibb.co/6g2CpTq/Embauba.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (57, 3, 'E', 'Elefante', 'https://i.ibb.co/zPDZs11/Elefante.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (58, 3, 'E', 'Erizo', 'https://i.ibb.co/SnsPP3N/Escaramujo.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (59, 3, 'E', 'Escarabajo', 'https://i.ibb.co/s6f8dqR/Escarabajo.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (60, 3, 'E', 'Escorpión', 'https://i.ibb.co/DDhDMcG/Escorpion.webp');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (61, 1, 'F', 'Flamenco', '#FFC7C9');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (62, 1, 'F', 'Flan', '#D6D5C0');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (63, 1, 'F', 'Fandango', '#D6D5D0');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (64, 1, 'F', 'Frambuesa', '#E51B4F');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (65, 2, 'F', 'Fresa', 'https://i.ibb.co/ZGP8HfR/Fresa.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (66, 2, 'F', 'Frambuesa', 'https://i.ibb.co/1fNTQ1Q/Frambuesa.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (67, 2, 'F', 'Feijoa', 'https://i.ibb.co/bd3PNR5/Feijoa.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (68, 2, 'F', 'Fresquilla', 'https://i.ibb.co/HxF6Tzt/Fresquilla.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (69, 3, 'F', 'Foca', 'https://i.ibb.co/KwrM4R2/Foca.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (70, 3, 'F', 'Flamenco', 'https://i.ibb.co/TBkXHh2/Flamenco.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (71, 3, 'F', 'Fragata', 'https://i.ibb.co/VmZxNth/Fragata.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (72, 3, 'F', 'Faetòn', 'https://i.ibb.co/8YpR0hD/faet-n.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (73, 1, 'G', 'Gris', '#989898');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (74, 1, 'G', 'Gamboge', '#D19F11');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (75, 1, 'G', 'Guinda', '#952F57');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (76, 1, 'G', 'Grafito', '#1C1C1C');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (77, 2, 'G', 'Gayuba', 'https://i.ibb.co/rkwfw6W/Gayuba.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (78, 2, 'G', 'Granada', 'https://i.ibb.co/b7Wppzf/Granada.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (79, 2, 'G', 'Grosella', 'https://i.ibb.co/fQ2w78L/Grosella.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (80, 2, 'G', 'Granadilla', 'https://i.ibb.co/HFSG2Lv/Granadilla.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (81, 3, 'G', 'Golondrina', 'https://i.ibb.co/tM29xmL/Golondrina.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (82, 3, 'G', 'Gorila', 'https://i.ibb.co/wRyKBdw/Gorila.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (83, 3, 'G', 'Guacamayo', 'https://i.ibb.co/RYKdT3n/Guacamayo.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (84, 3, 'G', 'Gallina', 'https://i.ibb.co/tzghtBg/Gallina.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (85, 1, 'H', 'Humo', '#84939C');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (86, 1, 'H', 'Hueso', '#E3DAC9');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (87, 1, 'H', 'Helecho', '#3D642D');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (88, 1, 'H', 'Honolulù', '#006DB0');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (89, 2, 'H', 'Habanero', 'https://i.ibb.co/7WGJJNZ/Habanero.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (90, 2, 'H', 'Higo', 'https://i.ibb.co/Z2b8Dbf/Higo.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (91, 2, 'H', 'Huarango', 'https://i.ibb.co/3s2KPRk/Huarango.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (92, 2, 'H', 'Huesillo', 'https://i.ibb.co/ZSyVcF9/Huesillo.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (93, 3, 'H', 'Halcòn', 'https://i.ibb.co/NZNhRns/Halcon.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (94, 3, 'H', 'Hipopòtamo', 'https://i.ibb.co/3yhBcGc/Hipopotamo.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (95, 3, 'H', 'Hormiga', 'https://i.ibb.co/VHgGMn5/Hormiga.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (96, 3, 'H', 'Hámster', 'https://i.ibb.co/hmCGs3r/Hamster.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (97, 1, 'I', 'Ìndigo', '#6F00FF');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (98, 1, 'I', 'Iroco', '#43320');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (99, 1, 'I', 'Iceberg', '#DAF4F0');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (100, 1, 'I', 'Indianred', '#CD5C5C');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (101, 2, 'I', 'Icaco', 'https://i.ibb.co/ZmZDjdy/Icaco.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (102, 2, 'I', 'Ilama', 'https://i.ibb.co/LgvK1vd/Ilama.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (103, 2, 'I', 'Imbè', 'https://i.ibb.co/6WRVW3Q/Imb.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (104, 2, 'I', 'Icaque', 'https://i.ibb.co/sqCxr85/Icaque.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (105, 3, 'I', 'Iguana', 'https://i.ibb.co/YPZqkZS/Iguana.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (106, 3, 'I', 'Ipacaá', 'https://i.ibb.co/c2DSWkY/Ipacaa.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (107, 3, 'I', 'Irbis', 'https://i.ibb.co/nqyDzZh/Irbis.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (108, 3, 'I', 'Impala', 'https://i.ibb.co/88C5Xrh/Impala.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (109, 1, 'J', 'Jeans', '#415D8C');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (110, 1, 'J', 'Jade', '#00A86B');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (111, 1, 'J', 'Jazzberry', '#A50B5E');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (112, 1, 'J', 'Junco', '#BD9237');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (113, 2, 'J', 'Jengibre', 'https://i.ibb.co/9wGGH9t/Jengibre.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (114, 2, 'J', 'Jitomate', 'https://i.ibb.co/ZgbQyLp/Jitomate.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (115, 2, 'J', 'Jalapeño', 'https://i.ibb.co/Wg7DxQW/Jalape-o.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (116, 2, 'J', 'Jujuba', 'https://i.ibb.co/2qVK0qP/Jujuba.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (117, 3, 'J', 'Jabalí', 'https://i.ibb.co/PwFkpQm/Jabali.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (118, 3, 'J', 'Jabirú', 'https://i.ibb.co/gVJCyzm/Jabiru.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (119, 3, 'J', 'Jerbo', 'https://i.ibb.co/jZNvKFy/Jerbo.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (120, 3, 'J', 'Jochi', 'https://i.ibb.co/F6wfwYs/Jochi.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (121, 1, 'K', 'Kalùa', '#B78D5C');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (122, 1, 'K', 'Kiwi', '#ABD93D');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (123, 1, 'K', 'Kraft', '#CFA57B');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (124, 1, 'K', 'Kètchup', '#D00400');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (125, 2, 'K', 'Kiwi', 'https://i.ibb.co/XCqs359/Kiwi.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (126, 2, 'K', 'Kumquat', 'https://i.ibb.co/jrndP7z/Kumquat.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (127, 2, 'K', 'Kaki', 'https://i.ibb.co/R6yt7gz/Kaki.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (128, 2, 'K', 'Karambolo', 'https://i.ibb.co/hF2Sdvt/Karambolo.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (129, 3, 'K', 'Koala', 'https://i.ibb.co/q0pFxpH/Koala.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (130, 3, 'K', 'Kudu', 'https://i.ibb.co/S332pKr/Kudu.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (131, 3, 'K', 'Kakapo', 'https://i.ibb.co/FnCbprY/Kakapo.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (132, 3, 'K', 'Kangal', 'https://i.ibb.co/zFKbtrF/Kangal.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (133, 1, 'L', 'LAVANDA', '#B57EDC');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (134, 1, 'L', 'LILA', '#B794C0');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (135, 1, 'L', 'LACRE', '#A73330');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (136, 1, 'L', 'LADRILLO', '#DF5745');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (137, 2, 'L', 'LIMA', 'https://i.ibb.co/VmCt17p/lima.png');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (138, 2, 'L', 'LIMON', 'https://i.ibb.co/0CjRYFS/limon.png');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (139, 2, 'L', 'LULO', 'https://i.ibb.co/J5bngjk/lulo.png');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (140, 3, 'L', 'LORO', 'https://i.ibb.co/6Y32hjf/loro.png');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (141, 3, 'L', 'LOBO', 'https://i.ibb.co/QFn8ntr/lobo.png');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (142, 3, 'L', 'LECHUZA', 'https://i.ibb.co/RjhtK7F/lechuza.png');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (143, 3, 'L', 'LIEBRE', 'https://i.ibb.co/3rn283H/liebre.png');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (144, 1, 'M', 'MAGENTA', '#FF00FF');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (145, 1, 'M', 'MORADO', '#800080');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (146, 1, 'M', 'MARRON', '#800000');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (147, 1, 'M', 'MOSTAZA', '#FFDB58');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (148, 2, 'M', 'MORA', 'https://i.ibb.co/B3qLgBt/mora.png');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (149, 2, 'M', 'MANGO', 'https://i.ibb.co/jR5KrM4/mango.png');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (150, 2, 'M', 'MELON', 'https://i.ibb.co/rFz2Xnx/melon.png');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (151, 2, 'M', 'MANZANA', 'https://i.ibb.co/k0q8X3K/manzana.png');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (152, 3, 'M', 'MEDUSA', 'https://i.ibb.co/X3RdrVn/medusa.png');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (153, 3, 'M', 'MARIPOSA', 'https://i.ibb.co/TKM2v2h/mariposa.png');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (154, 3, 'M', 'MOSCO', 'https://i.ibb.co/7zC8vVs/mosco.png');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (155, 3, 'M', 'MONO', 'https://i.ibb.co/FhnrXh6/mono.png');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (156, 1, 'N', 'NEGRO', '#000000');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (157, 1, 'N', 'NARANJA', '#FF8000');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (158, 1, 'N', 'NUDE', '#EBC8B2');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (159, 1, 'N', 'NIQUEL', '#727472');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (160, 2, 'N', 'NARANJA', 'https://i.ibb.co/Tr4rJ1F/naranja.png');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (161, 2, 'N', 'NONI', 'https://i.ibb.co/SvxtHyh/noni.png');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (162, 2, 'N', 'NUEZ', 'https://i.ibb.co/xLxJ695/nuez.png');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (163, 2, 'N', 'NISPERO', 'https://i.ibb.co/hKC679v/nispero.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (164, 3, 'N', 'NUTRIA', 'https://i.ibb.co/QjvmTHT/nutria.png');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (165, 3, 'N', 'NIGUA', 'https://i.ibb.co/CwqxHGy/nigua.png');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (166, 3, 'N', 'NOVILLO', 'https://i.ibb.co/tMDVyyB/Novillo-2.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (167, 3, 'N', 'NARVAL', 'https://i.ibb.co/mTHDK7v/narval.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (168, 2, 'Ñ', 'ÑORA', 'https://i.ibb.co/3s9dQm7/ora.png');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (169, 3, 'Ñ', 'ÑEQUE', 'https://i.ibb.co/QD7p04Z/eque.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (170, 3, 'Ñ', 'ÑU', 'https://i.ibb.co/PFhPBZ1/u.png');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (171, 3, 'Ñ', 'ÑACUNDA', 'https://i.ibb.co/9wqFhps/acunda.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (172, 3, 'Ñ', 'ÑANDU', 'https://i.ibb.co/NxwDYYy/andu.png');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (173, 1, 'O', 'ORO', '#B18A23');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (174, 1, 'O', 'OCRE', '#CD7722');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (175, 1, 'O', 'OLIVA', '#1B491D');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (176, 1, 'O', 'ORQUIDEA', '#D36CCE');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (177, 2, 'O', 'OREJONES', 'https://i.ibb.co/Cn7gR3S/orejones.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (178, 3, 'O', 'OSO', 'https://i.ibb.co/j6MPy3m/oso.png');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (179, 3, 'O', 'ORCA', 'https://i.ibb.co/bPwP6vT/orca.png');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (180, 3, 'O', 'OVEJA', 'https://i.ibb.co/k25Qm17/oveja.png');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (181, 3, 'O', 'OSTRA', 'https://i.ibb.co/5YdD6mH/ostra.png');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (182, 1, 'P', 'PÚRPURA', '#7D2181');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (183, 1, 'P', 'PASTEL', '#FDF9C4');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (184, 1, 'P', 'PERLA', '#EAE6CA');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (185, 1, 'P', 'PLATEADO', '#C0C0C0');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (186, 2, 'P', 'PLÁTANO', 'https://i.ibb.co/FHDQCVC/Platano.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (187, 2, 'P', 'PIÑA', 'https://i.ibb.co/G91tq7g/Pi-a.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (188, 2, 'P', 'PAPAYA', 'https://i.ibb.co/ngG9qft/Papaya.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (189, 2, 'P', 'PERA', 'https://i.ibb.co/PGyXd2b/Pera.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (190, 3, 'P', 'PEZ LEÓN', 'https://i.ibb.co/56gDBH4/Pez-leon.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (191, 3, 'P', 'PUMA', 'https://i.ibb.co/7W544x5/Puma.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (192, 3, 'P', 'PICAPUERCOS', 'https://i.ibb.co/m69Tx2B/Picapuerco.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (193, 3, 'P', 'PAVO', 'https://i.ibb.co/bJCtTHn/Pavo.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (194, 1, 'Q', 'QUAIL', '#B6B1AB');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (195, 1, 'Q', 'QUERCITRON', '#E5B03D');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (196, 1, 'Q', 'QUENCIENTA', '#012E67');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (197, 1, 'Q', 'QUINOLEÍNA', '#CFFF05');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (198, 2, 'Q', 'QUEULE', 'https://i.ibb.co/Vx7fJQB/Queule.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (199, 2, 'Q', 'QUANDONG', 'https://i.ibb.co/Wg8Db0W/Quandong.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (200, 2, 'Q', 'QUIMBOMBÓ', 'https://i.ibb.co/B6MB9bh/Quimbombo.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (201, 3, 'Q', 'QUIMERA COMUN', 'https://i.ibb.co/GcGWKWQ/Quimera-comun.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (202, 3, 'Q', 'QUOL TIGRE', 'https://i.ibb.co/pfrj8bw/Quol-tigre.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (203, 3, 'Q', 'QUETZAL', 'https://i.ibb.co/M731QGb/Quetzal.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (204, 3, 'Q', 'QUOKKA', 'https://i.ibb.co/M731QGb/Quetzal.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (205, 1, 'R', 'ROJO', '#FF0000');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (206, 1, 'R', 'ROSADO', '#FF0080');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (207, 1, 'R', 'RUFO', '#CB6D51');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (208, 1, 'R', 'ROCOCO', '#C37567');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (209, 2, 'R', 'REINA CLAUDIA', 'https://i.ibb.co/tDXnFPG/Reina-claudia.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (210, 2, 'R', 'RAMBUTÁN', 'https://i.ibb.co/h7MDtfL/rambutan.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (211, 3, 'R', 'RATA', 'https://i.ibb.co/p4xWJZf/Rata.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (212, 3, 'R', 'RANA', 'https://i.ibb.co/JrthR6K/RanaI.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (213, 3, 'R', 'RINOCERONTE', 'https://i.ibb.co/XJVz1vv/Rinoceronte.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (214, 3, 'R', 'RENO', 'https://i.ibb.co/S02XMHM/Reno.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (215, 1, 'S', 'SIENA', '#C58A3E');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (216, 1, 'S', 'SALMON', '#FA8072');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (217, 1, 'S', 'SEPIA', '#382C1E');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (218, 1, 'S', 'SABLE', '#F0DDC5');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (219, 2, 'S', 'SANDIA', 'https://i.ibb.co/VmzsrfT/Sandia.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (220, 2, 'S', 'SORVEIRA', 'https://i.ibb.co/g3s4HpY/sorveira.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (221, 2, 'S', 'SÉSAMO', 'https://i.ibb.co/nfkxMrG/Sesamo.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (222, 3, 'S', 'SALAMANDRA', 'https://i.ibb.co/r7j30zk/Salamandra.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (223, 3, 'S', 'SARDINA', 'https://i.ibb.co/Prd8mrJ/Sardina.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (224, 3, 'S', 'SAPO', 'https://i.ibb.co/zmxHMT6/Sapo.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (225, 3, 'S', 'SERPIENTE', 'https://i.ibb.co/Kjx6tCZ/serpiente.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (226, 1, 'T', 'TURQUESA', '#5DC1B9');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (227, 1, 'T', 'TERRACOTA', '#C89C7D');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (228, 1, 'T', 'TOPACIO', '#DB7D2E');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (229, 1, 'T', 'TURPIAL', '#F7A400');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (230, 2, 'T', 'TAMARINDO', 'https://i.ibb.co/jv5vwkg/Tamarindo.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (231, 2, 'T', 'TORONJA', 'https://i.ibb.co/rQDWgn5/Toronja.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (232, 2, 'T', 'TUNA', 'https://i.ibb.co/B3Q9XcX/Tuna.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (233, 2, 'T', 'TAMARILLO', 'https://i.ibb.co/rcjqcR1/Tamarillo.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (234, 3, 'T', 'TARÁNTULA', 'https://i.ibb.co/KVZNH5s/Tarantula.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (235, 3, 'T', 'TEJÓN', 'https://i.ibb.co/TkKhHxT/Tejon.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (236, 3, 'T', 'TIGRE', 'https://i.ibb.co/d79Kq6T/Tigre.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (237, 3, 'T', 'TOPO', 'https://i.ibb.co/sCZ44X3/Topo.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (238, 1, 'U', 'ULTRAMAR', '#20214F');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (239, 1, 'U', 'ULTRAVIOLETA', '#5F4B8B');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (240, 1, 'U', 'UVA', '#2F2140');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (241, 2, 'U', 'UVA BLANCA', 'https://i.ibb.co/ZHYP2NL/Uva-blanca.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (242, 2, 'U', 'UVA NEGRA', 'https://i.ibb.co/3k72N94/Uva-negra.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (243, 2, 'U', 'UCHUVA', 'https://i.ibb.co/9859wth/Uchuva.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (244, 2, 'U', 'UGLI', 'https://i.ibb.co/7zhdWNk/Ugli.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (245, 3, 'U', 'URIAL', 'https://i.ibb.co/MS03KhT/Urial.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (246, 3, 'U', 'URSÓN', 'https://i.ibb.co/GcCk4TT/Urson.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (247, 3, 'U', 'UALABÍ RUPESTRE', 'https://i.ibb.co/J7XyKRD/ualabi.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (248, 3, 'U', 'UAPITI', 'https://i.ibb.co/MBjvhw2/Uapiti.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (249, 1, 'V', 'VAINILLA', '#F3E5AB');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (250, 1, 'V', 'VERDE', '#ADFF2F');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (251, 1, 'V', 'VINOTINTO', '#56070C');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (252, 1, 'V', 'VIOLETA', '#922B3E');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (253, 2, 'V', 'VAINILLA', 'https://i.ibb.co/9ZLdJFQ/vainilla.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (254, 2, 'V', 'VITORIA', 'https://i.ibb.co/kGHYszZ/vitoria.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (255, 2, 'V', 'VELUDO', 'https://i.ibb.co/BBF2MWT/veludo.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (256, 2, 'V', 'VAINITA', 'https://i.ibb.co/VxMbttr/vainitas.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (257, 3, 'V', 'VACA', 'https://i.ibb.co/HDhcY19/vaca.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (258, 3, 'V', 'VÍBORA', 'https://i.ibb.co/dQ1rvk0/vibora.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (259, 3, 'V', 'VUIDA NEGRA', 'https://i.ibb.co/pX2Fh4Y/viuda-negra.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (260, 3, 'V', 'VELOCIRAPTOR', 'https://i.ibb.co/T4HWkvH/velociraptor.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (261, 1, 'W', 'WISTERIA', '#C9A0DC');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (262, 1, 'W', 'WENGUÉ', '#3D2E2C');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (263, 1, 'W', 'WASABI', '#59A523');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (264, 2, 'W', 'WASABI', 'https://i.ibb.co/Y71CZGM/wasabi.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (265, 3, 'W', 'WOMBAT', 'https://i.ibb.co/M9RXdKd/wombat.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (266, 3, 'W', 'WALABÍ', 'https://i.ibb.co/zVxMQv2/walabi.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (267, 3, 'W', 'WALARÓ', 'https://i.ibb.co/wJdQjsS/walaro.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (268, 3, 'W', 'WAPITI', 'https://i.ibb.co/YWx6rYV/wapiti.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (269, 1, 'X', 'XANADÚ', '#738678');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (270, 1, 'X', 'XÁNTICO', '#F39430');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (271, 2, 'X', 'XOCONOSTLE', 'https://i.ibb.co/gvQ8vbZ/xoconostle.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (272, 2, 'X', 'XOCOTA', 'https://i.ibb.co/ns5bRBb/xocota.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (273, 2, 'X', 'XIGUA', 'https://i.ibb.co/Vw9dChP/xigua.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (274, 2, 'X', 'XIMENIA', 'https://i.ibb.co/rcb6J72/Ximenia.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (275, 3, 'X', 'XARDA', 'https://i.ibb.co/TrKDqfp/xarda.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (276, 3, 'X', 'XIFOFORO', 'https://i.ibb.co/BfgHhPp/xifoforo.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (277, 3, 'X', 'XENOPUS', 'https://i.ibb.co/QptLc9B/xenopus.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (278, 3, 'X', 'XIFOSURO', 'https://i.ibb.co/d4gpDnV/xifosuros.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (279, 1, 'Y', 'YEMA', '#FFE600');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (280, 1, 'Y', 'YESO', '#EBE9E4');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (281, 2, 'Y', 'YACA', 'https://i.ibb.co/5jCHBkN/61-Zs-Rkrj-B9-L-AC-SX569.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (282, 2, 'Y', 'YUZU', 'https://i.ibb.co/Y3zBV6h/Yuzu-1.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (283, 2, 'Y', 'YOYOMO', 'https://i.ibb.co/wM6VQZB/yoyomo.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (284, 3, 'Y', 'YEGUA', 'https://i.ibb.co/2Kb3Psm/Yeguas.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (285, 3, 'Y', 'YACARE', 'https://i.ibb.co/Lp5Zy8g/Yacare.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (286, 3, 'Y', 'YAK', 'https://i.ibb.co/gmf9P0K/Yaks.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (287, 3, 'Y', 'YARARÁ', 'https://i.ibb.co/Xpf27N5/Yarar.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (288, 1, 'Z', 'ZOMP', '#39A78E');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (289, 1, 'Z', 'ZAFIRO', '#354685');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (290, 1, 'Z', 'ZAFRE', '#3012A3');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (291, 1, 'Z', 'ZINC', '#8D8388');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (292, 2, 'Z', 'ZAPOTE', 'https://i.ibb.co/p3gj66N/zapote.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (293, 2, 'Z', 'ZAPALLO', 'https://i.ibb.co/M6hZ0VK/Zapallo.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (294, 2, 'Z', 'ZARZAMORA', 'https://i.ibb.co/vQKfmvp/Zarzamora.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (295, 3, 'Z', 'ZORRO', 'https://i.ibb.co/WV3QLHd/Zorro.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (296, 3, 'Z', 'ZANCUDO', 'https://i.ibb.co/64mXnPr/hqdefault.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (297, 3, 'Z', 'ZARIGUEYA', 'https://i.ibb.co/Sv0G83f/zarigueya.jpg');
INSERT INTO public.data (auntenticar, id_tipo, letra, nombre, codigo) VALUES (298, 3, 'Z', 'ZOPILOTE', 'https://i.ibb.co/TtZcZDx/zopilote.jpg');


--
-- TOC entry 3340 (class 0 OID 16813)
-- Dependencies: 212
-- Data for Name: genero; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.genero (id_gen, nom_gen) VALUES (1, 'Masculino');
INSERT INTO public.genero (id_gen, nom_gen) VALUES (2, 'Femenino');


--
-- TOC entry 3337 (class 0 OID 16802)
-- Dependencies: 209
-- Data for Name: tipo_palabra; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tipo_palabra (id_tipo, nombre) VALUES (1, 'Color');
INSERT INTO public.tipo_palabra (id_tipo, nombre) VALUES (2, 'Fruta');
INSERT INTO public.tipo_palabra (id_tipo, nombre) VALUES (3, 'Animal');


--
-- TOC entry 3342 (class 0 OID 16820)
-- Dependencies: 214
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.usuario (id_usuario, id_gen, apellidos, nombres, cedula, edad, nacimiento, email, telefono, ciudad, direccion, usuario, password) VALUES (1, 1, 'Navas', 'Jefry', '1719591719', 22, '2000-04-22', 'jefry6@outlook.com', '0999262546', 'Quito', 'Catarama', 'jefry', '12345678');


--
-- TOC entry 3353 (class 0 OID 0)
-- Dependencies: 215
-- Name: autenticacion_id_autenticacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.autenticacion_id_autenticacion_seq', 1, true);


--
-- TOC entry 3354 (class 0 OID 0)
-- Dependencies: 211
-- Name: genero_id_gen_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.genero_id_gen_seq', 1, false);


--
-- TOC entry 3355 (class 0 OID 0)
-- Dependencies: 213
-- Name: usuario_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_id_usuario_seq', 1, true);


--
-- TOC entry 3194 (class 2606 OID 16834)
-- Name: autenticacion autenticacion_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autenticacion
    ADD CONSTRAINT autenticacion_pk PRIMARY KEY (id_autenticacion);


--
-- TOC entry 3188 (class 2606 OID 16811)
-- Name: data data_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data
    ADD CONSTRAINT data_pk PRIMARY KEY (auntenticar);


--
-- TOC entry 3190 (class 2606 OID 16818)
-- Name: genero genero_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genero
    ADD CONSTRAINT genero_pk PRIMARY KEY (id_gen);


--
-- TOC entry 3186 (class 2606 OID 16806)
-- Name: tipo_palabra tipo_palabra_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_palabra
    ADD CONSTRAINT tipo_palabra_pk PRIMARY KEY (id_tipo);


--
-- TOC entry 3192 (class 2606 OID 16827)
-- Name: usuario usuario_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pk PRIMARY KEY (id_usuario);


--
-- TOC entry 3196 (class 2606 OID 16840)
-- Name: usuario genero_usuario_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT genero_usuario_fk FOREIGN KEY (id_gen) REFERENCES public.genero(id_gen);


--
-- TOC entry 3195 (class 2606 OID 16835)
-- Name: data tipo_palabra_data_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data
    ADD CONSTRAINT tipo_palabra_data_fk FOREIGN KEY (id_tipo) REFERENCES public.tipo_palabra(id_tipo);


--
-- TOC entry 3197 (class 2606 OID 16845)
-- Name: autenticacion usuario_autenticacion_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autenticacion
    ADD CONSTRAINT usuario_autenticacion_fk FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario);


-- Completed on 2022-05-15 17:55:04

--
-- PostgreSQL database dump complete
--

