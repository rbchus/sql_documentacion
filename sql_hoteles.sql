--
-- PostgreSQL database dump
--

-- Dumped from database version 15.13
-- Dumped by pg_dump version 15.13

-- Started on 2025-05-22 09:07:19

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
-- TOC entry 217 (class 1259 OID 16409)
-- Name: acomodacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.acomodacion (
    id integer NOT NULL,
    descripcion character varying(50) NOT NULL
);


ALTER TABLE public.acomodacion OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16408)
-- Name: acomodacion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.acomodacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.acomodacion_id_seq OWNER TO postgres;

--
-- TOC entry 3374 (class 0 OID 0)
-- Dependencies: 216
-- Name: acomodacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.acomodacion_id_seq OWNED BY public.acomodacion.id;


--
-- TOC entry 218 (class 1259 OID 16417)
-- Name: habitacion_acomodacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.habitacion_acomodacion (
    h_id integer NOT NULL,
    a_id integer NOT NULL
);


ALTER TABLE public.habitacion_acomodacion OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16400)
-- Name: habitacion_tipo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.habitacion_tipo (
    id integer NOT NULL,
    descripcion character varying(50) NOT NULL
);


ALTER TABLE public.habitacion_tipo OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16399)
-- Name: habitacion_tipo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.habitacion_tipo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.habitacion_tipo_id_seq OWNER TO postgres;

--
-- TOC entry 3375 (class 0 OID 0)
-- Dependencies: 214
-- Name: habitacion_tipo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.habitacion_tipo_id_seq OWNED BY public.habitacion_tipo.id;


--
-- TOC entry 222 (class 1259 OID 16455)
-- Name: habitaciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.habitaciones (
    id integer NOT NULL,
    hotel_id integer NOT NULL,
    h_id integer NOT NULL,
    a_id integer NOT NULL,
    cantidad integer NOT NULL,
    CONSTRAINT habitaciones_cantidad_check CHECK ((cantidad > 0))
);


ALTER TABLE public.habitaciones OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16454)
-- Name: habitaciones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.habitaciones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.habitaciones_id_seq OWNER TO postgres;

--
-- TOC entry 3376 (class 0 OID 0)
-- Dependencies: 221
-- Name: habitaciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.habitaciones_id_seq OWNED BY public.habitaciones.id;


--
-- TOC entry 220 (class 1259 OID 16433)
-- Name: hoteles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hoteles (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    direccion character varying(150) NOT NULL,
    ciudad character varying(100) NOT NULL,
    nit character varying(20) NOT NULL,
    h_total integer NOT NULL,
    CONSTRAINT hoteles_h_total_check CHECK ((h_total > 0))
);


ALTER TABLE public.hoteles OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16432)
-- Name: hoteles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hoteles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hoteles_id_seq OWNER TO postgres;

--
-- TOC entry 3377 (class 0 OID 0)
-- Dependencies: 219
-- Name: hoteles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hoteles_id_seq OWNED BY public.hoteles.id;


--
-- TOC entry 3188 (class 2604 OID 16412)
-- Name: acomodacion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acomodacion ALTER COLUMN id SET DEFAULT nextval('public.acomodacion_id_seq'::regclass);


--
-- TOC entry 3187 (class 2604 OID 16403)
-- Name: habitacion_tipo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.habitacion_tipo ALTER COLUMN id SET DEFAULT nextval('public.habitacion_tipo_id_seq'::regclass);


--
-- TOC entry 3190 (class 2604 OID 16458)
-- Name: habitaciones id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.habitaciones ALTER COLUMN id SET DEFAULT nextval('public.habitaciones_id_seq'::regclass);


--
-- TOC entry 3189 (class 2604 OID 16436)
-- Name: hoteles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hoteles ALTER COLUMN id SET DEFAULT nextval('public.hoteles_id_seq'::regclass);


--
-- TOC entry 3363 (class 0 OID 16409)
-- Dependencies: 217
-- Data for Name: acomodacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.acomodacion (id, descripcion) FROM stdin;
1	SENCILLA
2	DOBLE
3	TRIPLE
4	CUÁDRUPLE
\.


--
-- TOC entry 3364 (class 0 OID 16417)
-- Dependencies: 218
-- Data for Name: habitacion_acomodacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.habitacion_acomodacion (h_id, a_id) FROM stdin;
1	1
1	2
2	3
2	4
3	1
3	2
3	3
\.


--
-- TOC entry 3361 (class 0 OID 16400)
-- Dependencies: 215
-- Data for Name: habitacion_tipo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.habitacion_tipo (id, descripcion) FROM stdin;
1	ESTANDAR
2	JUNIOR
3	SUITE
\.


--
-- TOC entry 3368 (class 0 OID 16455)
-- Dependencies: 222
-- Data for Name: habitaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.habitaciones (id, hotel_id, h_id, a_id, cantidad) FROM stdin;
7	3	3	1	4
10	3	1	2	10
11	3	3	2	6
16	4	2	4	2
18	4	1	1	4
20	6	1	1	4
21	4	1	2	4
22	8	1	1	5
\.


--
-- TOC entry 3366 (class 0 OID 16433)
-- Dependencies: 220
-- Data for Name: hoteles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hoteles (id, nombre, direccion, ciudad, nit, h_total) FROM stdin;
6	DECAMERON MEDELLIN	CALLE 23 58-25	Medellín	56765432-1	10
3	DECAMERON SANTA MARTA	CARRERA 23 58-25	SANTA MARTA	54675678-9	25
8	SANTA HELENA	CALLE 23 58-25	OCAÑA	9876545432-1	5
4	DECAMERON SAN ANDRES ISLAS	CALLE 23 58-25	SAN ADRES	12345540-3	30
\.


--
-- TOC entry 3378 (class 0 OID 0)
-- Dependencies: 216
-- Name: acomodacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.acomodacion_id_seq', 4, true);


--
-- TOC entry 3379 (class 0 OID 0)
-- Dependencies: 214
-- Name: habitacion_tipo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.habitacion_tipo_id_seq', 3, true);


--
-- TOC entry 3380 (class 0 OID 0)
-- Dependencies: 221
-- Name: habitaciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.habitaciones_id_seq', 23, true);


--
-- TOC entry 3381 (class 0 OID 0)
-- Dependencies: 219
-- Name: hoteles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hoteles_id_seq', 9, true);


--
-- TOC entry 3198 (class 2606 OID 16416)
-- Name: acomodacion acomodacion_descripcion_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acomodacion
    ADD CONSTRAINT acomodacion_descripcion_key UNIQUE (descripcion);


--
-- TOC entry 3200 (class 2606 OID 16414)
-- Name: acomodacion acomodacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acomodacion
    ADD CONSTRAINT acomodacion_pkey PRIMARY KEY (id);


--
-- TOC entry 3202 (class 2606 OID 16421)
-- Name: habitacion_acomodacion habitacion_acomodacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.habitacion_acomodacion
    ADD CONSTRAINT habitacion_acomodacion_pkey PRIMARY KEY (h_id, a_id);


--
-- TOC entry 3194 (class 2606 OID 16407)
-- Name: habitacion_tipo habitacion_tipo_descripcion_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.habitacion_tipo
    ADD CONSTRAINT habitacion_tipo_descripcion_key UNIQUE (descripcion);


--
-- TOC entry 3196 (class 2606 OID 16405)
-- Name: habitacion_tipo habitacion_tipo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.habitacion_tipo
    ADD CONSTRAINT habitacion_tipo_pkey PRIMARY KEY (id);


--
-- TOC entry 3210 (class 2606 OID 16463)
-- Name: habitaciones habitaciones_hotel_id_h_id_a_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.habitaciones
    ADD CONSTRAINT habitaciones_hotel_id_h_id_a_id_key UNIQUE (hotel_id, h_id, a_id);


--
-- TOC entry 3212 (class 2606 OID 16461)
-- Name: habitaciones habitaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.habitaciones
    ADD CONSTRAINT habitaciones_pkey PRIMARY KEY (id);


--
-- TOC entry 3204 (class 2606 OID 16443)
-- Name: hoteles hoteles_nit_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hoteles
    ADD CONSTRAINT hoteles_nit_key UNIQUE (nit);


--
-- TOC entry 3206 (class 2606 OID 16441)
-- Name: hoteles hoteles_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hoteles
    ADD CONSTRAINT hoteles_nombre_key UNIQUE (nombre);


--
-- TOC entry 3208 (class 2606 OID 16439)
-- Name: hoteles hoteles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hoteles
    ADD CONSTRAINT hoteles_pkey PRIMARY KEY (id);


--
-- TOC entry 3213 (class 2606 OID 16427)
-- Name: habitacion_acomodacion habitacion_acomodacion_a_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.habitacion_acomodacion
    ADD CONSTRAINT habitacion_acomodacion_a_id_fkey FOREIGN KEY (a_id) REFERENCES public.acomodacion(id) ON DELETE CASCADE;


--
-- TOC entry 3214 (class 2606 OID 16422)
-- Name: habitacion_acomodacion habitacion_acomodacion_h_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.habitacion_acomodacion
    ADD CONSTRAINT habitacion_acomodacion_h_id_fkey FOREIGN KEY (h_id) REFERENCES public.habitacion_tipo(id) ON DELETE CASCADE;


--
-- TOC entry 3215 (class 2606 OID 16474)
-- Name: habitaciones habitaciones_a_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.habitaciones
    ADD CONSTRAINT habitaciones_a_id_fkey FOREIGN KEY (a_id) REFERENCES public.acomodacion(id) ON DELETE CASCADE;


--
-- TOC entry 3216 (class 2606 OID 16469)
-- Name: habitaciones habitaciones_h_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.habitaciones
    ADD CONSTRAINT habitaciones_h_id_fkey FOREIGN KEY (h_id) REFERENCES public.habitacion_tipo(id) ON DELETE CASCADE;


--
-- TOC entry 3217 (class 2606 OID 16464)
-- Name: habitaciones habitaciones_hotel_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.habitaciones
    ADD CONSTRAINT habitaciones_hotel_id_fkey FOREIGN KEY (hotel_id) REFERENCES public.hoteles(id) ON DELETE CASCADE;


-- Completed on 2025-05-22 09:07:19

--
-- PostgreSQL database dump complete
--

