--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    number_guess integer NOT NULL,
    games_played integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
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
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (2, 2, 790, 7);
INSERT INTO public.games VALUES (3, 2, 499, 10);
INSERT INTO public.games VALUES (4, 2, 927, 15);
INSERT INTO public.games VALUES (5, 3, 760, 6);
INSERT INTO public.games VALUES (6, 4, 264, 265);
INSERT INTO public.games VALUES (7, 4, 882, 883);
INSERT INTO public.games VALUES (8, 5, 251, 252);
INSERT INTO public.games VALUES (9, 5, 886, 887);
INSERT INTO public.games VALUES (10, 4, 582, 585);
INSERT INTO public.games VALUES (11, 4, 436, 438);
INSERT INTO public.games VALUES (12, 4, 931, 932);
INSERT INTO public.games VALUES (13, 6, 889, 890);
INSERT INTO public.games VALUES (14, 6, 431, 432);
INSERT INTO public.games VALUES (15, 7, 331, 332);
INSERT INTO public.games VALUES (16, 7, 689, 690);
INSERT INTO public.games VALUES (17, 6, 593, 596);
INSERT INTO public.games VALUES (18, 6, 426, 428);
INSERT INTO public.games VALUES (19, 6, 251, 252);
INSERT INTO public.games VALUES (20, 8, 47, 48);
INSERT INTO public.games VALUES (21, 8, 594, 595);
INSERT INTO public.games VALUES (22, 9, 626, 627);
INSERT INTO public.games VALUES (23, 9, 813, 814);
INSERT INTO public.games VALUES (24, 8, 22, 25);
INSERT INTO public.games VALUES (25, 8, 218, 220);
INSERT INTO public.games VALUES (26, 8, 408, 409);
INSERT INTO public.games VALUES (27, 10, 933, 934);
INSERT INTO public.games VALUES (28, 10, 753, 754);
INSERT INTO public.games VALUES (29, 11, 541, 542);
INSERT INTO public.games VALUES (30, 11, 442, 443);
INSERT INTO public.games VALUES (31, 10, 650, 653);
INSERT INTO public.games VALUES (32, 10, 745, 747);
INSERT INTO public.games VALUES (33, 10, 192, 193);
INSERT INTO public.games VALUES (34, 12, 12, 13);
INSERT INTO public.games VALUES (35, 12, 890, 891);
INSERT INTO public.games VALUES (36, 13, 271, 272);
INSERT INTO public.games VALUES (37, 13, 359, 360);
INSERT INTO public.games VALUES (38, 12, 342, 345);
INSERT INTO public.games VALUES (39, 12, 616, 618);
INSERT INTO public.games VALUES (40, 12, 503, 504);
INSERT INTO public.games VALUES (41, 14, 803, 804);
INSERT INTO public.games VALUES (42, 14, 81, 82);
INSERT INTO public.games VALUES (43, 15, 815, 816);
INSERT INTO public.games VALUES (44, 15, 65, 66);
INSERT INTO public.games VALUES (45, 14, 353, 356);
INSERT INTO public.games VALUES (46, 14, 560, 562);
INSERT INTO public.games VALUES (47, 14, 534, 535);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (2, 'Waldo');
INSERT INTO public.users VALUES (3, 'shantal');
INSERT INTO public.users VALUES (4, 'user_1725925430007');
INSERT INTO public.users VALUES (5, 'user_1725925430006');
INSERT INTO public.users VALUES (6, 'user_1725925514374');
INSERT INTO public.users VALUES (7, 'user_1725925514373');
INSERT INTO public.users VALUES (8, 'user_1725925588658');
INSERT INTO public.users VALUES (9, 'user_1725925588657');
INSERT INTO public.users VALUES (10, 'user_1725925675288');
INSERT INTO public.users VALUES (11, 'user_1725925675287');
INSERT INTO public.users VALUES (12, 'user_1725925726594');
INSERT INTO public.users VALUES (13, 'user_1725925726593');
INSERT INTO public.users VALUES (14, 'user_1725925745013');
INSERT INTO public.users VALUES (15, 'user_1725925745012');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 47, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 15, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

