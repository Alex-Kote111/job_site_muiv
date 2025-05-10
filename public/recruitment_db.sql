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
-- Name: responses_vacancies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.responses_vacancies (
    id bigint NOT NULL,
    name character varying(150) NOT NULL,
    city character varying(150) NOT NULL,
    metro character varying(150),
    education character varying(19) NOT NULL,
    sex character varying(7) NOT NULL,
    date_birth date NOT NULL,
    email character varying(255) NOT NULL,
    phone character varying(11) NOT NULL,
    photo bytea,
    resume_file bytea,
    vacancy_number character varying(9) NOT NULL,
    name_file_photo character varying(260),
    name_file_resume character varying(260),
    photo_extension character varying(100),
    resume_extension character varying(100),
    salary character varying(10) NOT NULL
);


ALTER TABLE public.responses_vacancies OWNER TO postgres;

--
-- Name: responses_vacancies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.responses_vacancies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.responses_vacancies_id_seq OWNER TO postgres;

--
-- Name: responses_vacancies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.responses_vacancies_id_seq OWNED BY public.responses_vacancies.id;


--
-- Name: user_authorization_codes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_authorization_codes (
    id bigint NOT NULL,
    username character varying(150) NOT NULL,
    authorization_code character varying(64) NOT NULL
);


ALTER TABLE public.user_authorization_codes OWNER TO postgres;

--
-- Name: user_authorization_codes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_authorization_codes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_authorization_codes_id_seq OWNER TO postgres;

--
-- Name: user_authorization_codes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_authorization_codes_id_seq OWNED BY public.user_authorization_codes.id;


--
-- Name: vacancies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vacancies (
    id bigint NOT NULL,
    vacancy_title character varying(100) NOT NULL,
    education character varying(19) NOT NULL,
    experience character varying(18) NOT NULL,
    type_of_employment character varying(19) NOT NULL,
    work_schedule character varying(16) NOT NULL,
    work_format character varying(21) NOT NULL,
    vacancy_opening_date date NOT NULL,
    template_style_head text,
    vacancy_template_body text,
    salary_from integer,
    salary_up_to integer,
    before_tax boolean,
    vacancy_posted boolean,
    vacancy_number character varying(9)
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
-- Name: responses_vacancies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.responses_vacancies ALTER COLUMN id SET DEFAULT nextval('public.responses_vacancies_id_seq'::regclass);


--
-- Name: user_authorization_codes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_authorization_codes ALTER COLUMN id SET DEFAULT nextval('public.user_authorization_codes_id_seq'::regclass);


--
-- Name: vacancies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vacancies ALTER COLUMN id SET DEFAULT nextval('public.vacancies_id_seq'::regclass);


--
-- Data for Name: responses_vacancies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.responses_vacancies (id, name, city, metro, education, sex, date_birth, email, phone, photo, resume_file, vacancy_number, name_file_photo, name_file_resume, photo_extension, resume_extension, salary) FROM stdin;
\.


--
-- Data for Name: user_authorization_codes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_authorization_codes (id, username, authorization_code) FROM stdin;
\.


--
-- Data for Name: vacancies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vacancies (id, vacancy_title, education, experience, type_of_employment, work_schedule, work_format, vacancy_opening_date, template_style_head, vacancy_template_body, salary_from, salary_up_to, before_tax, vacancy_posted, vacancy_number) FROM stdin;
\.


--
-- Name: responses_vacancies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.responses_vacancies_id_seq', 12, true);


--
-- Name: user_authorization_codes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_authorization_codes_id_seq', 2, true);


--
-- Name: vacancies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vacancies_id_seq', 52, true);


--
-- Name: responses_vacancies responses_vacancies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.responses_vacancies
    ADD CONSTRAINT responses_vacancies_pkey PRIMARY KEY (id);


--
-- Name: user_authorization_codes user_authorization_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_authorization_codes
    ADD CONSTRAINT user_authorization_codes_pkey PRIMARY KEY (id);


--
-- Name: vacancies vacancies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vacancies
    ADD CONSTRAINT vacancies_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

