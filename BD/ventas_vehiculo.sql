--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.4
-- Dumped by pg_dump version 9.4.4
-- Started on 2016-11-07 02:21:49

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 183 (class 3079 OID 11855)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2052 (class 0 OID 0)
-- Dependencies: 183
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 173 (class 1259 OID 33121)
-- Name: auto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auto (
    idauto bigint NOT NULL,
    marca character varying(50)[],
    modelo character varying(50)[],
    tipocombustibe character varying(50)[],
    anio integer
);


ALTER TABLE auto OWNER TO postgres;

--
-- TOC entry 172 (class 1259 OID 33119)
-- Name: auto_idauto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auto_idauto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auto_idauto_seq OWNER TO postgres;

--
-- TOC entry 2053 (class 0 OID 0)
-- Dependencies: 172
-- Name: auto_idauto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auto_idauto_seq OWNED BY auto.idauto;


--
-- TOC entry 182 (class 1259 OID 33169)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cliente (
    idcliente bigint NOT NULL,
    nombre character varying(50)[],
    direccion character varying(100)[],
    telefono integer
);


ALTER TABLE cliente OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 33167)
-- Name: cliente_idcliente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cliente_idcliente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cliente_idcliente_seq OWNER TO postgres;

--
-- TOC entry 2054 (class 0 OID 0)
-- Dependencies: 181
-- Name: cliente_idcliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cliente_idcliente_seq OWNED BY cliente.idcliente;


--
-- TOC entry 176 (class 1259 OID 33134)
-- Name: stock; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE stock (
    idstock bigint NOT NULL,
    idauto bigint NOT NULL,
    cantidad integer
);


ALTER TABLE stock OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 33132)
-- Name: stock_idauto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE stock_idauto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE stock_idauto_seq OWNER TO postgres;

--
-- TOC entry 2055 (class 0 OID 0)
-- Dependencies: 175
-- Name: stock_idauto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE stock_idauto_seq OWNED BY stock.idauto;


--
-- TOC entry 174 (class 1259 OID 33130)
-- Name: stock_idstock_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE stock_idstock_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE stock_idstock_seq OWNER TO postgres;

--
-- TOC entry 2056 (class 0 OID 0)
-- Dependencies: 174
-- Name: stock_idstock_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE stock_idstock_seq OWNED BY stock.idstock;


--
-- TOC entry 180 (class 1259 OID 33154)
-- Name: venta; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE venta (
    idventa bigint NOT NULL,
    idauto bigint NOT NULL,
    idcliente bigint NOT NULL,
    monto bigint,
    fecha date
);


ALTER TABLE venta OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 33150)
-- Name: venta_idauto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE venta_idauto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE venta_idauto_seq OWNER TO postgres;

--
-- TOC entry 2057 (class 0 OID 0)
-- Dependencies: 178
-- Name: venta_idauto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE venta_idauto_seq OWNED BY venta.idauto;


--
-- TOC entry 179 (class 1259 OID 33152)
-- Name: venta_idcliente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE venta_idcliente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE venta_idcliente_seq OWNER TO postgres;

--
-- TOC entry 2058 (class 0 OID 0)
-- Dependencies: 179
-- Name: venta_idcliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE venta_idcliente_seq OWNED BY venta.idcliente;


--
-- TOC entry 177 (class 1259 OID 33148)
-- Name: venta_idventa_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE venta_idventa_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE venta_idventa_seq OWNER TO postgres;

--
-- TOC entry 2059 (class 0 OID 0)
-- Dependencies: 177
-- Name: venta_idventa_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE venta_idventa_seq OWNED BY venta.idventa;


--
-- TOC entry 1907 (class 2604 OID 33124)
-- Name: idauto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auto ALTER COLUMN idauto SET DEFAULT nextval('auto_idauto_seq'::regclass);


--
-- TOC entry 1913 (class 2604 OID 33172)
-- Name: idcliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cliente ALTER COLUMN idcliente SET DEFAULT nextval('cliente_idcliente_seq'::regclass);


--
-- TOC entry 1908 (class 2604 OID 33137)
-- Name: idstock; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY stock ALTER COLUMN idstock SET DEFAULT nextval('stock_idstock_seq'::regclass);


--
-- TOC entry 1909 (class 2604 OID 33138)
-- Name: idauto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY stock ALTER COLUMN idauto SET DEFAULT nextval('stock_idauto_seq'::regclass);


--
-- TOC entry 1910 (class 2604 OID 33157)
-- Name: idventa; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY venta ALTER COLUMN idventa SET DEFAULT nextval('venta_idventa_seq'::regclass);


--
-- TOC entry 1911 (class 2604 OID 33158)
-- Name: idauto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY venta ALTER COLUMN idauto SET DEFAULT nextval('venta_idauto_seq'::regclass);


--
-- TOC entry 1912 (class 2604 OID 33159)
-- Name: idcliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY venta ALTER COLUMN idcliente SET DEFAULT nextval('venta_idcliente_seq'::regclass);


--
-- TOC entry 2035 (class 0 OID 33121)
-- Dependencies: 173
-- Data for Name: auto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auto (idauto, marca, modelo, tipocombustibe, anio) FROM stdin;
\.


--
-- TOC entry 2060 (class 0 OID 0)
-- Dependencies: 172
-- Name: auto_idauto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auto_idauto_seq', 1, false);


--
-- TOC entry 2044 (class 0 OID 33169)
-- Dependencies: 182
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cliente (idcliente, nombre, direccion, telefono) FROM stdin;
\.


--
-- TOC entry 2061 (class 0 OID 0)
-- Dependencies: 181
-- Name: cliente_idcliente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cliente_idcliente_seq', 1, false);


--
-- TOC entry 2038 (class 0 OID 33134)
-- Dependencies: 176
-- Data for Name: stock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY stock (idstock, idauto, cantidad) FROM stdin;
\.


--
-- TOC entry 2062 (class 0 OID 0)
-- Dependencies: 175
-- Name: stock_idauto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('stock_idauto_seq', 1, false);


--
-- TOC entry 2063 (class 0 OID 0)
-- Dependencies: 174
-- Name: stock_idstock_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('stock_idstock_seq', 1, false);


--
-- TOC entry 2042 (class 0 OID 33154)
-- Dependencies: 180
-- Data for Name: venta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY venta (idventa, idauto, idcliente, monto, fecha) FROM stdin;
\.


--
-- TOC entry 2064 (class 0 OID 0)
-- Dependencies: 178
-- Name: venta_idauto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('venta_idauto_seq', 1, false);


--
-- TOC entry 2065 (class 0 OID 0)
-- Dependencies: 179
-- Name: venta_idcliente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('venta_idcliente_seq', 1, false);


--
-- TOC entry 2066 (class 0 OID 0)
-- Dependencies: 177
-- Name: venta_idventa_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('venta_idventa_seq', 1, false);


--
-- TOC entry 1915 (class 2606 OID 33126)
-- Name: auto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auto
    ADD CONSTRAINT auto_pkey PRIMARY KEY (idauto);


--
-- TOC entry 1921 (class 2606 OID 33177)
-- Name: cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (idcliente);


--
-- TOC entry 1917 (class 2606 OID 33140)
-- Name: stock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY stock
    ADD CONSTRAINT stock_pkey PRIMARY KEY (idstock);


--
-- TOC entry 1919 (class 2606 OID 33161)
-- Name: venta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY venta
    ADD CONSTRAINT venta_pkey PRIMARY KEY (idventa);


--
-- TOC entry 1922 (class 2606 OID 33141)
-- Name: stock_idauto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY stock
    ADD CONSTRAINT stock_idauto_fkey FOREIGN KEY (idauto) REFERENCES auto(idauto);


--
-- TOC entry 1923 (class 2606 OID 33162)
-- Name: venta_idauto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY venta
    ADD CONSTRAINT venta_idauto_fkey FOREIGN KEY (idauto) REFERENCES auto(idauto);


--
-- TOC entry 1924 (class 2606 OID 33178)
-- Name: venta_idcliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY venta
    ADD CONSTRAINT venta_idcliente_fkey FOREIGN KEY (idcliente) REFERENCES cliente(idcliente);


--
-- TOC entry 2051 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-11-07 02:21:49

--
-- PostgreSQL database dump complete
--

