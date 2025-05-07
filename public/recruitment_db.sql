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
    resume_extension character varying(100)
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
-- Name: vacancies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vacancies ALTER COLUMN id SET DEFAULT nextval('public.vacancies_id_seq'::regclass);


--
-- Data for Name: responses_vacancies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.responses_vacancies (id, name, city, metro, education, sex, date_birth, email, phone, photo, resume_file, vacancy_number, name_file_photo, name_file_resume, photo_extension, resume_extension) FROM stdin;
\.


--
-- Data for Name: vacancies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vacancies (id, vacancy_title, education, experience, type_of_employment, work_schedule, work_format, vacancy_opening_date, template_style_head, vacancy_template_body, salary_from, salary_up_to, before_tax, vacancy_posted, vacancy_number) FROM stdin;
43	Старший менеджер студенческого офиса №2	Среднее специальное	От 1 года до 3 лет	Полная занятость	Полный день	На месте работодателя	2025-05-06	<style type="text/css">\nbody{margin:0;padding:8px;}\np{line-height:1.15;margin:0;white-space:pre-wrap;}\nol,ul{margin-top:0;margin-bottom:0;}\nimg{border:none;}\nli>p{display:inline;}\n</style>	<body>\n<p><span style="font-family: Times New Roman;font-size: 16pt;font-style: normal;font-weight: bold;text-decoration: none;">Обязанности:</span><span style="font-family: Times New Roman;font-size: 14pt;font-style: normal;font-weight: normal;text-decoration: none;"><br>Консультирование студентов по организационным вопросам.<br>Предоставление документов.<br>Принятие и регистрация заявлений студентов.<br>Исполнение обязанностей руководителя в его отсутствие<br></span><span style="font-family: Times New Roman;font-size: 16pt;font-style: normal;font-weight: bold;text-decoration: none;">Требования:</span><span style="font-family: Times New Roman;font-size: 14pt;font-style: normal;font-weight: normal;text-decoration: none;"><br>Образование: Среднее специальное<br>Опыт работы: От 1 года до 3 лет<br>Опыт работы: от 1 года<br>Уверенный пользователь ПК, MS OFFICE;<br>Грамотная устная и письменная речь;<br>Коммуникабельность, исполнительность, внимательность.<br></span><span style="font-family: Times New Roman;font-size: 16pt;font-style: normal;font-weight: bold;text-decoration: none;">Условия:</span><span style="font-family: Times New Roman;font-size: 14pt;font-style: normal;font-weight: normal;text-decoration: none;"><br>Тип занятости: Полная занятость<br>график работы: Полный день<br>Формат работы: На месте работодателя<br>Оплата труда от: 45 000 до: 55 000 рублей в месяц (до вычета налога)<br>Прием по ТК РФ</span><br></p>\n</body>	45000	55000	t	t	000000002
42	Старший менеджер студенческого офиса №2	Среднее специальное	От 1 года до 3 лет	Полная занятость	Полный день	На месте работодателя	2025-05-06	<style type="text/css">\nbody{margin:0;padding:8px;}\np{line-height:1.15;margin:0;white-space:pre-wrap;}\nol,ul{margin-top:0;margin-bottom:0;}\nimg{border:none;}\nli>p{display:inline;}\n</style>	<body>\n<p><span style="font-family: Times New Roman;font-size: 16pt;font-style: normal;font-weight: bold;text-decoration: none;">Обязанности:</span><span style="font-family: Times New Roman;font-size: 14pt;font-style: normal;font-weight: normal;text-decoration: none;"><br>Консультирование студентов по организационным вопросам.<br>Предоставление документов.<br>Принятие и регистрация заявлений студентов.<br>Исполнение обязанностей руководителя в его отсутствие<br></span><span style="font-family: Times New Roman;font-size: 16pt;font-style: normal;font-weight: bold;text-decoration: none;">Требования:</span><span style="font-family: Times New Roman;font-size: 14pt;font-style: normal;font-weight: normal;text-decoration: none;"><br>Образование: Среднее специальное<br>Опыт работы: От 1 года до 3 лет<br>Опыт работы: от 1 года<br>Уверенный пользователь ПК, MS OFFICE;<br>Грамотная устная и письменная речь;<br>Коммуникабельность, исполнительность, внимательность.<br></span><span style="font-family: Times New Roman;font-size: 16pt;font-style: normal;font-weight: bold;text-decoration: none;">Условия:</span><span style="font-family: Times New Roman;font-size: 14pt;font-style: normal;font-weight: normal;text-decoration: none;"><br>Тип занятости: Полная занятость<br>график работы: Полный день<br>Формат работы: На месте работодателя<br>Оплата труда от: 45 000 до: 55 000 рублей в месяц (до вычета налога)<br>Прием по ТК РФ</span><br></p>\n</body>	45000	55000	t	t	000000002
44	Старший менеджер студенческого офиса №2	Среднее специальное	От 1 года до 3 лет	Полная занятость	Полный день	На месте работодателя	2025-05-06	<style type="text/css">\nbody{margin:0;padding:8px;}\np{line-height:1.15;margin:0;white-space:pre-wrap;}\nol,ul{margin-top:0;margin-bottom:0;}\nimg{border:none;}\nli>p{display:inline;}\n</style>	<body>\n<p><span style="font-family: Times New Roman;font-size: 16pt;font-style: normal;font-weight: bold;text-decoration: none;">Обязанности:</span><span style="font-family: Times New Roman;font-size: 14pt;font-style: normal;font-weight: normal;text-decoration: none;"><br>Консультирование студентов по организационным вопросам.<br>Предоставление документов.<br>Принятие и регистрация заявлений студентов.<br>Исполнение обязанностей руководителя в его отсутствие<br></span><span style="font-family: Times New Roman;font-size: 16pt;font-style: normal;font-weight: bold;text-decoration: none;">Требования:</span><span style="font-family: Times New Roman;font-size: 14pt;font-style: normal;font-weight: normal;text-decoration: none;"><br>Образование: Среднее специальное<br>Опыт работы: От 1 года до 3 лет<br>Опыт работы: от 1 года<br>Уверенный пользователь ПК, MS OFFICE;<br>Грамотная устная и письменная речь;<br>Коммуникабельность, исполнительность, внимательность.<br></span><span style="font-family: Times New Roman;font-size: 16pt;font-style: normal;font-weight: bold;text-decoration: none;">Условия:</span><span style="font-family: Times New Roman;font-size: 14pt;font-style: normal;font-weight: normal;text-decoration: none;"><br>Тип занятости: Полная занятость<br>график работы: Полный день<br>Формат работы: На месте работодателя<br>Оплата труда от: 45 000 до: 55 000 рублей в месяц (до вычета налога)<br>Прием по ТК РФ</span><br></p>\n</body>	45000	55000	t	t	000000002
45	Старший менеджер студенческого офиса №2	Среднее специальное	От 1 года до 3 лет	Полная занятость	Полный день	На месте работодателя	2025-05-06	<style type="text/css">\nbody{margin:0;padding:8px;}\np{line-height:1.15;margin:0;white-space:pre-wrap;}\nol,ul{margin-top:0;margin-bottom:0;}\nimg{border:none;}\nli>p{display:inline;}\n</style>	<body>\n<p><span style="font-family: Times New Roman;font-size: 16pt;font-style: normal;font-weight: bold;text-decoration: none;">Обязанности:</span><span style="font-family: Times New Roman;font-size: 14pt;font-style: normal;font-weight: normal;text-decoration: none;"><br>Консультирование студентов по организационным вопросам.<br>Предоставление документов.<br>Принятие и регистрация заявлений студентов.<br>Исполнение обязанностей руководителя в его отсутствие<br></span><span style="font-family: Times New Roman;font-size: 16pt;font-style: normal;font-weight: bold;text-decoration: none;">Требования:</span><span style="font-family: Times New Roman;font-size: 14pt;font-style: normal;font-weight: normal;text-decoration: none;"><br>Образование: Среднее специальное<br>Опыт работы: От 1 года до 3 лет<br>Опыт работы: от 1 года<br>Уверенный пользователь ПК, MS OFFICE;<br>Грамотная устная и письменная речь;<br>Коммуникабельность, исполнительность, внимательность.<br></span><span style="font-family: Times New Roman;font-size: 16pt;font-style: normal;font-weight: bold;text-decoration: none;">Условия:</span><span style="font-family: Times New Roman;font-size: 14pt;font-style: normal;font-weight: normal;text-decoration: none;"><br>Тип занятости: Полная занятость<br>график работы: Полный день<br>Формат работы: На месте работодателя<br>Оплата труда от: 45 000 до: 55 000 рублей в месяц (до вычета налога)<br>Прием по ТК РФ</span><br></p>\n</body>	45000	55000	t	t	000000002
46	Старший менеджер студенческого офиса №2	Среднее специальное	От 1 года до 3 лет	Полная занятость	Полный день	На месте работодателя	2025-05-06	<style type="text/css">\nbody{margin:0;padding:8px;}\np{line-height:1.15;margin:0;white-space:pre-wrap;}\nol,ul{margin-top:0;margin-bottom:0;}\nimg{border:none;}\nli>p{display:inline;}\n</style>	<body>\n<p><span style="font-family: Times New Roman;font-size: 16pt;font-style: normal;font-weight: bold;text-decoration: none;">Обязанности:</span><span style="font-family: Times New Roman;font-size: 14pt;font-style: normal;font-weight: normal;text-decoration: none;"><br>Консультирование студентов по организационным вопросам.<br>Предоставление документов.<br>Принятие и регистрация заявлений студентов.<br>Исполнение обязанностей руководителя в его отсутствие<br></span><span style="font-family: Times New Roman;font-size: 16pt;font-style: normal;font-weight: bold;text-decoration: none;">Требования:</span><span style="font-family: Times New Roman;font-size: 14pt;font-style: normal;font-weight: normal;text-decoration: none;"><br>Образование: Среднее специальное<br>Опыт работы: От 1 года до 3 лет<br>Опыт работы: от 1 года<br>Уверенный пользователь ПК, MS OFFICE;<br>Грамотная устная и письменная речь;<br>Коммуникабельность, исполнительность, внимательность.<br></span><span style="font-family: Times New Roman;font-size: 16pt;font-style: normal;font-weight: bold;text-decoration: none;">Условия:</span><span style="font-family: Times New Roman;font-size: 14pt;font-style: normal;font-weight: normal;text-decoration: none;"><br>Тип занятости: Полная занятость<br>график работы: Полный день<br>Формат работы: На месте работодателя<br>Оплата труда от: 45 000 до: 55 000 рублей в месяц (до вычета налога)<br>Прием по ТК РФ</span><br></p>\n</body>	45000	55000	t	t	000000002
47	Старший менеджер студенческого офиса №2	Среднее специальное	От 1 года до 3 лет	Полная занятость	Полный день	На месте работодателя	2025-05-06	<style type="text/css">\nbody{margin:0;padding:8px;}\np{line-height:1.15;margin:0;white-space:pre-wrap;}\nol,ul{margin-top:0;margin-bottom:0;}\nimg{border:none;}\nli>p{display:inline;}\n</style>	<body>\n<p><span style="font-family: Times New Roman;font-size: 16pt;font-style: normal;font-weight: bold;text-decoration: none;">Обязанности:</span><span style="font-family: Times New Roman;font-size: 14pt;font-style: normal;font-weight: normal;text-decoration: none;"><br>Консультирование студентов по организационным вопросам.<br>Предоставление документов.<br>Принятие и регистрация заявлений студентов.<br>Исполнение обязанностей руководителя в его отсутствие<br></span><span style="font-family: Times New Roman;font-size: 16pt;font-style: normal;font-weight: bold;text-decoration: none;">Требования:</span><span style="font-family: Times New Roman;font-size: 14pt;font-style: normal;font-weight: normal;text-decoration: none;"><br>Образование: Среднее специальное<br>Опыт работы: От 1 года до 3 лет<br>Опыт работы: от 1 года<br>Уверенный пользователь ПК, MS OFFICE;<br>Грамотная устная и письменная речь;<br>Коммуникабельность, исполнительность, внимательность.<br></span><span style="font-family: Times New Roman;font-size: 16pt;font-style: normal;font-weight: bold;text-decoration: none;">Условия:</span><span style="font-family: Times New Roman;font-size: 14pt;font-style: normal;font-weight: normal;text-decoration: none;"><br>Тип занятости: Полная занятость<br>график работы: Полный день<br>Формат работы: На месте работодателя<br>Оплата труда от: 45 000 до: 55 000 рублей в месяц (до вычета налога)<br>Прием по ТК РФ</span><br></p>\n</body>	45000	55000	t	t	000000002
48	Старший менеджер студенческого офиса №2	Среднее специальное	От 1 года до 3 лет	Полная занятость	Полный день	На месте работодателя	2025-05-06	<style type="text/css">\nbody{margin:0;padding:8px;}\np{line-height:1.15;margin:0;white-space:pre-wrap;}\nol,ul{margin-top:0;margin-bottom:0;}\nimg{border:none;}\nli>p{display:inline;}\n</style>	<body>\n<p><span style="font-family: Times New Roman;font-size: 16pt;font-style: normal;font-weight: bold;text-decoration: none;">Обязанности:</span><span style="font-family: Times New Roman;font-size: 14pt;font-style: normal;font-weight: normal;text-decoration: none;"><br>Консультирование студентов по организационным вопросам.<br>Предоставление документов.<br>Принятие и регистрация заявлений студентов.<br>Исполнение обязанностей руководителя в его отсутствие<br></span><span style="font-family: Times New Roman;font-size: 16pt;font-style: normal;font-weight: bold;text-decoration: none;">Требования:</span><span style="font-family: Times New Roman;font-size: 14pt;font-style: normal;font-weight: normal;text-decoration: none;"><br>Образование: Среднее специальное<br>Опыт работы: От 1 года до 3 лет<br>Опыт работы: от 1 года<br>Уверенный пользователь ПК, MS OFFICE;<br>Грамотная устная и письменная речь;<br>Коммуникабельность, исполнительность, внимательность.<br></span><span style="font-family: Times New Roman;font-size: 16pt;font-style: normal;font-weight: bold;text-decoration: none;">Условия:</span><span style="font-family: Times New Roman;font-size: 14pt;font-style: normal;font-weight: normal;text-decoration: none;"><br>Тип занятости: Полная занятость<br>график работы: Полный день<br>Формат работы: На месте работодателя<br>Оплата труда от: 45 000 до: 55 000 рублей в месяц (до вычета налога)<br>Прием по ТК РФ</span><br></p>\n</body>	45000	55000	t	t	000000002
\.


--
-- Name: responses_vacancies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.responses_vacancies_id_seq', 4, true);


--
-- Name: vacancies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vacancies_id_seq', 48, true);


--
-- Name: responses_vacancies responses_vacancies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.responses_vacancies
    ADD CONSTRAINT responses_vacancies_pkey PRIMARY KEY (id);


--
-- Name: vacancies vacancies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vacancies
    ADD CONSTRAINT vacancies_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

