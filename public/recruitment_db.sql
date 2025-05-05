--
-- PostgreSQL database dump
--

-- Dumped from database version 17.3
-- Dumped by pg_dump version 17.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: vacancies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vacancies (
    id bigint NOT NULL,
    vacancy_title character varying(100) NOT NULL,
    education character varying(50) NOT NULL,
    experience character varying(50) NOT NULL,
    type_of_employment character varying(20) NOT NULL,
    work_schedule character varying(20) NOT NULL,
    work_format character varying(50) NOT NULL,
    vacancy_opening_date date NOT NULL,
    template_style_head text,
    vacancy_template_body text,
    salary_from integer,
    salary_up_to integer,
    before_tax boolean,
    vacancy_posted boolean
);


ALTER TABLE public.vacancies OWNER TO postgres;

--
-- Name: vacancies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vacancies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vacancies_id_seq OWNER TO postgres;

--
-- Name: vacancies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vacancies_id_seq OWNED BY public.vacancies.id;


--
-- Name: vacancies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vacancies ALTER COLUMN id SET DEFAULT nextval('public.vacancies_id_seq'::regclass);


--
-- Data for Name: vacancies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vacancies (id, vacancy_title, education, experience, type_of_employment, work_schedule, work_format, vacancy_opening_date, template_style_head, vacancy_template_body, salary_from, salary_up_to, before_tax, vacancy_posted) FROM stdin;
1	Менеджер в клиентский отдел	Среднее	От 1 до 3 лет	Полная занятость	Полный день	На месте работодателя	2025-02-10	\N	\N	35000	40000	\N	\N
2	Старший менеджер	Высшее	от 3 до 6 лет	Частичная занятость	Гибкий график	На месте работодателя	2025-03-23	\N	\N	42000	50000	t	\N
\.


--
-- Name: vacancies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vacancies_id_seq', 2, true);


--
-- Name: vacancies vacancies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vacancies
    ADD CONSTRAINT vacancies_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

