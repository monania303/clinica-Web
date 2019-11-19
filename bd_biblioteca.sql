--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.20
-- Dumped by pg_dump version 9.3.20
-- Started on 2019-03-14 19:38:19

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

DROP DATABASE bd_biblioteca;
--
-- TOC entry 2025 (class 1262 OID 57939)
-- Name: bd_biblioteca; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE bd_biblioteca WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Spain.1252' LC_CTYPE = 'Spanish_Spain.1252';


ALTER DATABASE bd_biblioteca OWNER TO postgres;

\connect bd_biblioteca

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 1 (class 3079 OID 11750)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2028 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 172 (class 1259 OID 57942)
-- Name: autores; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE autores (
    aut_codigo integer NOT NULL,
    aut_nombre character varying,
    aut_foto bytea
);


ALTER TABLE public.autores OWNER TO postgres;

--
-- TOC entry 171 (class 1259 OID 57940)
-- Name: autores_aut_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE autores_aut_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.autores_aut_codigo_seq OWNER TO postgres;

--
-- TOC entry 2029 (class 0 OID 0)
-- Dependencies: 171
-- Name: autores_aut_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE autores_aut_codigo_seq OWNED BY autores.aut_codigo;


--
-- TOC entry 174 (class 1259 OID 57953)
-- Name: ciudades; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ciudades (
    ciu_codigo integer NOT NULL,
    ciu_descripcion character varying
);


ALTER TABLE public.ciudades OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 57951)
-- Name: ciudades_ciu_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ciudades_ciu_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ciudades_ciu_codigo_seq OWNER TO postgres;

--
-- TOC entry 2030 (class 0 OID 0)
-- Dependencies: 173
-- Name: ciudades_ciu_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ciudades_ciu_codigo_seq OWNED BY ciudades.ciu_codigo;


--
-- TOC entry 176 (class 1259 OID 57964)
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE clientes (
    cli_codigo integer NOT NULL,
    cli_nombre character varying,
    cli_ciudad integer,
    cli_direccion character varying,
    cli_obs character varying,
    cli_foto bytea
);


ALTER TABLE public.clientes OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 57962)
-- Name: clientes_cli_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE clientes_cli_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clientes_cli_codigo_seq OWNER TO postgres;

--
-- TOC entry 2031 (class 0 OID 0)
-- Dependencies: 175
-- Name: clientes_cli_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE clientes_cli_codigo_seq OWNED BY clientes.cli_codigo;


--
-- TOC entry 178 (class 1259 OID 57980)
-- Name: libros; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE libros (
    lib_codigo integer NOT NULL,
    lib_descripcion character varying,
    lib_cantidad integer,
    lib_obs character varying
);


ALTER TABLE public.libros OWNER TO postgres;

--
-- TOC entry 179 (class 1259 OID 57989)
-- Name: libros_autores; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE libros_autores (
    lau_libro integer NOT NULL,
    lau_autor integer NOT NULL
);


ALTER TABLE public.libros_autores OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 57978)
-- Name: libros_lib_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE libros_lib_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.libros_lib_codigo_seq OWNER TO postgres;

--
-- TOC entry 2032 (class 0 OID 0)
-- Dependencies: 177
-- Name: libros_lib_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE libros_lib_codigo_seq OWNED BY libros.lib_codigo;


--
-- TOC entry 183 (class 1259 OID 58017)
-- Name: prestamos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE prestamos (
    pre_numero integer NOT NULL,
    pre_fecha date,
    pre_cliente integer,
    pre_observacion character varying,
    pre_situacion character varying,
    pre_usuario integer,
    pre_total double precision
);


ALTER TABLE public.prestamos OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 58038)
-- Name: prestamos_libros; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE prestamos_libros (
    pli_secuencia integer NOT NULL,
    pli_prestamo integer,
    pli_libro integer,
    pli_estado integer,
    pli_dias integer,
    pli_valor double precision,
    pli_fecha_devolucion date
);


ALTER TABLE public.prestamos_libros OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 58036)
-- Name: prestamos_libros_pli_secuencia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE prestamos_libros_pli_secuencia_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prestamos_libros_pli_secuencia_seq OWNER TO postgres;

--
-- TOC entry 2033 (class 0 OID 0)
-- Dependencies: 184
-- Name: prestamos_libros_pli_secuencia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE prestamos_libros_pli_secuencia_seq OWNED BY prestamos_libros.pli_secuencia;


--
-- TOC entry 182 (class 1259 OID 58015)
-- Name: prestamos_pre_numero_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE prestamos_pre_numero_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prestamos_pre_numero_seq OWNER TO postgres;

--
-- TOC entry 2034 (class 0 OID 0)
-- Dependencies: 182
-- Name: prestamos_pre_numero_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE prestamos_pre_numero_seq OWNED BY prestamos.pre_numero;


--
-- TOC entry 181 (class 1259 OID 58006)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE usuarios (
    usu_codigo integer NOT NULL,
    usu_username character varying,
    usu_password character varying
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 58004)
-- Name: usuarios_usu_codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE usuarios_usu_codigo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuarios_usu_codigo_seq OWNER TO postgres;

--
-- TOC entry 2035 (class 0 OID 0)
-- Dependencies: 180
-- Name: usuarios_usu_codigo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE usuarios_usu_codigo_seq OWNED BY usuarios.usu_codigo;


--
-- TOC entry 1869 (class 2604 OID 57945)
-- Name: aut_codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY autores ALTER COLUMN aut_codigo SET DEFAULT nextval('autores_aut_codigo_seq'::regclass);


--
-- TOC entry 1870 (class 2604 OID 57956)
-- Name: ciu_codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ciudades ALTER COLUMN ciu_codigo SET DEFAULT nextval('ciudades_ciu_codigo_seq'::regclass);


--
-- TOC entry 1871 (class 2604 OID 57967)
-- Name: cli_codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY clientes ALTER COLUMN cli_codigo SET DEFAULT nextval('clientes_cli_codigo_seq'::regclass);


--
-- TOC entry 1872 (class 2604 OID 57983)
-- Name: lib_codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY libros ALTER COLUMN lib_codigo SET DEFAULT nextval('libros_lib_codigo_seq'::regclass);


--
-- TOC entry 1874 (class 2604 OID 58020)
-- Name: pre_numero; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY prestamos ALTER COLUMN pre_numero SET DEFAULT nextval('prestamos_pre_numero_seq'::regclass);


--
-- TOC entry 1875 (class 2604 OID 58041)
-- Name: pli_secuencia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY prestamos_libros ALTER COLUMN pli_secuencia SET DEFAULT nextval('prestamos_libros_pli_secuencia_seq'::regclass);


--
-- TOC entry 1873 (class 2604 OID 58009)
-- Name: usu_codigo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuarios ALTER COLUMN usu_codigo SET DEFAULT nextval('usuarios_usu_codigo_seq'::regclass);


--
-- TOC entry 2007 (class 0 OID 57942)
-- Dependencies: 172
-- Data for Name: autores; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO autores (aut_codigo, aut_nombre, aut_foto) VALUES (1, 'Moisés Montanía', NULL);
INSERT INTO autores (aut_codigo, aut_nombre, aut_foto) VALUES (2, 'Joel Sanchez', NULL);
INSERT INTO autores (aut_codigo, aut_nombre, aut_foto) VALUES (4, 'Rocio Martinez', NULL);
INSERT INTO autores (aut_codigo, aut_nombre, aut_foto) VALUES (5, 'Maciel', NULL);
INSERT INTO autores (aut_codigo, aut_nombre, aut_foto) VALUES (6, 'Mauro Cespedes', NULL);
INSERT INTO autores (aut_codigo, aut_nombre, aut_foto) VALUES (7, 'Jose Rodriguez', NULL);


--
-- TOC entry 2036 (class 0 OID 0)
-- Dependencies: 171
-- Name: autores_aut_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('autores_aut_codigo_seq', 7, true);


--
-- TOC entry 2009 (class 0 OID 57953)
-- Dependencies: 174
-- Data for Name: ciudades; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO ciudades (ciu_codigo, ciu_descripcion) VALUES (2, 'Hernandarias');


--
-- TOC entry 2037 (class 0 OID 0)
-- Dependencies: 173
-- Name: ciudades_ciu_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ciudades_ciu_codigo_seq', 2, true);


--
-- TOC entry 2011 (class 0 OID 57964)
-- Dependencies: 176
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO clientes (cli_codigo, cli_nombre, cli_ciudad, cli_direccion, cli_obs, cli_foto) VALUES (2, 'Nueva Ciudad', 2, 'Direccion nueva ciudad', 'Obs nueva ciudad', NULL);


--
-- TOC entry 2038 (class 0 OID 0)
-- Dependencies: 175
-- Name: clientes_cli_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('clientes_cli_codigo_seq', 2, true);


--
-- TOC entry 2013 (class 0 OID 57980)
-- Dependencies: 178
-- Data for Name: libros; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO libros (lib_codigo, lib_descripcion, lib_cantidad, lib_obs) VALUES (1, 'Nueva Libro', 2, 'Obs nuevo libro');


--
-- TOC entry 2014 (class 0 OID 57989)
-- Dependencies: 179
-- Data for Name: libros_autores; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2039 (class 0 OID 0)
-- Dependencies: 177
-- Name: libros_lib_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('libros_lib_codigo_seq', 2, true);


--
-- TOC entry 2018 (class 0 OID 58017)
-- Dependencies: 183
-- Data for Name: prestamos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2020 (class 0 OID 58038)
-- Dependencies: 185
-- Data for Name: prestamos_libros; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2040 (class 0 OID 0)
-- Dependencies: 184
-- Name: prestamos_libros_pli_secuencia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('prestamos_libros_pli_secuencia_seq', 1, false);


--
-- TOC entry 2041 (class 0 OID 0)
-- Dependencies: 182
-- Name: prestamos_pre_numero_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('prestamos_pre_numero_seq', 1, false);


--
-- TOC entry 2016 (class 0 OID 58006)
-- Dependencies: 181
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2042 (class 0 OID 0)
-- Dependencies: 180
-- Name: usuarios_usu_codigo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('usuarios_usu_codigo_seq', 1, false);


--
-- TOC entry 1877 (class 2606 OID 57950)
-- Name: autores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY autores
    ADD CONSTRAINT autores_pkey PRIMARY KEY (aut_codigo);


--
-- TOC entry 1879 (class 2606 OID 57961)
-- Name: ciudades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ciudades
    ADD CONSTRAINT ciudades_pkey PRIMARY KEY (ciu_codigo);


--
-- TOC entry 1881 (class 2606 OID 57972)
-- Name: clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (cli_codigo);


--
-- TOC entry 1885 (class 2606 OID 57993)
-- Name: libros_autores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY libros_autores
    ADD CONSTRAINT libros_autores_pkey PRIMARY KEY (lau_libro, lau_autor);


--
-- TOC entry 1883 (class 2606 OID 57988)
-- Name: libros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY libros
    ADD CONSTRAINT libros_pkey PRIMARY KEY (lib_codigo);


--
-- TOC entry 1891 (class 2606 OID 58043)
-- Name: prestamos_libros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY prestamos_libros
    ADD CONSTRAINT prestamos_libros_pkey PRIMARY KEY (pli_secuencia);


--
-- TOC entry 1889 (class 2606 OID 58025)
-- Name: prestamos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY prestamos
    ADD CONSTRAINT prestamos_pkey PRIMARY KEY (pre_numero);


--
-- TOC entry 1887 (class 2606 OID 58014)
-- Name: usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (usu_codigo);


--
-- TOC entry 1892 (class 2606 OID 57973)
-- Name: clientes_cli_ciudad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY clientes
    ADD CONSTRAINT clientes_cli_ciudad_fkey FOREIGN KEY (cli_ciudad) REFERENCES ciudades(ciu_codigo);


--
-- TOC entry 1893 (class 2606 OID 57994)
-- Name: libros_autores_lau_autor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY libros_autores
    ADD CONSTRAINT libros_autores_lau_autor_fkey FOREIGN KEY (lau_autor) REFERENCES autores(aut_codigo);


--
-- TOC entry 1894 (class 2606 OID 57999)
-- Name: libros_autores_lau_libro_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY libros_autores
    ADD CONSTRAINT libros_autores_lau_libro_fkey FOREIGN KEY (lau_libro) REFERENCES libros(lib_codigo);


--
-- TOC entry 1897 (class 2606 OID 58044)
-- Name: prestamos_libros_pli_libro_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY prestamos_libros
    ADD CONSTRAINT prestamos_libros_pli_libro_fkey FOREIGN KEY (pli_libro) REFERENCES libros(lib_codigo);


--
-- TOC entry 1898 (class 2606 OID 58049)
-- Name: prestamos_libros_pli_prestamo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY prestamos_libros
    ADD CONSTRAINT prestamos_libros_pli_prestamo_fkey FOREIGN KEY (pli_prestamo) REFERENCES prestamos(pre_numero);


--
-- TOC entry 1895 (class 2606 OID 58026)
-- Name: prestamos_pre_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY prestamos
    ADD CONSTRAINT prestamos_pre_cliente_fkey FOREIGN KEY (pre_cliente) REFERENCES clientes(cli_codigo);


--
-- TOC entry 1896 (class 2606 OID 58031)
-- Name: prestamos_pre_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY prestamos
    ADD CONSTRAINT prestamos_pre_usuario_fkey FOREIGN KEY (pre_usuario) REFERENCES usuarios(usu_codigo);


--
-- TOC entry 2027 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2019-03-14 19:38:20

--
-- PostgreSQL database dump complete
--

