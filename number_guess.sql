--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0 NOT NULL,
    best_game integer DEFAULT 999 NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'user_1754238214312', 0, 999);
INSERT INTO public.users VALUES (2, 'user_1754238214311', 0, 999);
INSERT INTO public.users VALUES (3, 'user_1754240161703', 0, 999);
INSERT INTO public.users VALUES (4, 'user_1754240161702', 0, 999);
INSERT INTO public.users VALUES (7, 'user_1754241931828', 1, 999);
INSERT INTO public.users VALUES (23, 'user_1754247612356', 2, 999);
INSERT INTO public.users VALUES (6, 'user_1754241931830', 1, 999);
INSERT INTO public.users VALUES (22, 'user_1754247612357', 5, 999);
INSERT INTO public.users VALUES (9, 'user_1754241961523', 1, 999);
INSERT INTO public.users VALUES (39, 'user_1754250174287', 2, 558);
INSERT INTO public.users VALUES (8, 'user_1754241961525', 1, 999);
INSERT INTO public.users VALUES (25, 'user_1754247951183', 2, 999);
INSERT INTO public.users VALUES (11, 'user_1754242397510', 1, 999);
INSERT INTO public.users VALUES (38, 'user_1754250174288', 5, 112);
INSERT INTO public.users VALUES (10, 'user_1754242397511', 1, 999);
INSERT INTO public.users VALUES (24, 'user_1754247951184', 5, 999);
INSERT INTO public.users VALUES (13, 'user_1754242658030', 1, 999);
INSERT INTO public.users VALUES (12, 'user_1754242658031', 1, 999);
INSERT INTO public.users VALUES (27, 'user_1754248009737', 2, 999);
INSERT INTO public.users VALUES (15, 'user_1754243464455', 2, 999);
INSERT INTO public.users VALUES (41, 'user_1754250219089', 2, 208);
INSERT INTO public.users VALUES (26, 'user_1754248009738', 5, 999);
INSERT INTO public.users VALUES (14, 'user_1754243464456', 5, 999);
INSERT INTO public.users VALUES (17, 'user_1754243494233', 2, 999);
INSERT INTO public.users VALUES (40, 'user_1754250219090', 5, 330);
INSERT INTO public.users VALUES (16, 'user_1754243494234', 5, 999);
INSERT INTO public.users VALUES (5, 'John', 2, 10);
INSERT INTO public.users VALUES (29, 'user_1754249652906', 2, 999);
INSERT INTO public.users VALUES (19, 'user_1754245532048', 2, 999);
INSERT INTO public.users VALUES (28, 'user_1754249652907', 5, 999);
INSERT INTO public.users VALUES (18, 'user_1754245532049', 5, 999);
INSERT INTO public.users VALUES (21, 'user_1754245557125', 2, 999);
INSERT INTO public.users VALUES (31, 'user_1754249714564', 2, 999);
INSERT INTO public.users VALUES (20, 'user_1754245557126', 5, 999);
INSERT INTO public.users VALUES (43, 'user_1754250460120', 2, 570);
INSERT INTO public.users VALUES (30, 'user_1754249714565', 5, 999);
INSERT INTO public.users VALUES (42, 'user_1754250460121', 5, 475);
INSERT INTO public.users VALUES (33, 'user_1754249804237', 2, 999);
INSERT INTO public.users VALUES (32, 'user_1754249804238', 5, 999);
INSERT INTO public.users VALUES (45, 'user_1754250489479', 2, 30);
INSERT INTO public.users VALUES (35, 'user_1754249862469', 2, 999);
INSERT INTO public.users VALUES (34, 'user_1754249862470', 5, 999);
INSERT INTO public.users VALUES (44, 'user_1754250489480', 5, 345);
INSERT INTO public.users VALUES (37, 'user_1754249918997', 2, 698);
INSERT INTO public.users VALUES (36, 'user_1754249918998', 5, 37);
INSERT INTO public.users VALUES (47, 'user_1754250690901', 2, 104);
INSERT INTO public.users VALUES (46, 'user_1754250690902', 5, 345);
INSERT INTO public.users VALUES (49, 'user_1754250764322', 2, 600);
INSERT INTO public.users VALUES (48, 'user_1754250764323', 5, 54);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 49, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

