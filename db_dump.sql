--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.7
-- Dumped by pg_dump version 10.2

-- Started on 2020-04-01 00:17:34 EEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2394 (class 1262 OID 74803)
-- Name: scoreboard; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE scoreboard WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';


\connect scoreboard

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12655)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2396 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 186 (class 1259 OID 74811)
-- Name: score; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE score (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    score integer NOT NULL,
    CONSTRAINT scores_score_check CHECK ((score >= 0))
);


--
-- TOC entry 185 (class 1259 OID 74809)
-- Name: scores_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE scores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2397 (class 0 OID 0)
-- Dependencies: 185
-- Name: scores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE scores_id_seq OWNED BY score.id;


--
-- TOC entry 2267 (class 2604 OID 74814)
-- Name: score id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY score ALTER COLUMN id SET DEFAULT nextval('scores_id_seq'::regclass);


--
-- TOC entry 2389 (class 0 OID 74811)
-- Dependencies: 186
-- Data for Name: score; Type: TABLE DATA; Schema: public; Owner: -
--

COPY score (id, name, score) FROM stdin;
1	Rachel	35
2	Ross	67
3	Joey	65
4	Chandler	80
5	Monica	51
6	Phoebe	20
\.


--
-- TOC entry 2398 (class 0 OID 0)
-- Dependencies: 185
-- Name: scores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('scores_id_seq', 6, true);


--
-- TOC entry 2270 (class 2606 OID 74817)
-- Name: score scores_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY score
    ADD CONSTRAINT scores_pkey PRIMARY KEY (id);


-- Completed on 2020-04-01 00:17:34 EEST

--
-- PostgreSQL database dump complete
--

