--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    first_observed character varying(20),
    distance_in_m_ly numeric(3,1),
    diameter_in_kp numeric(4,2),
    structure character varying(20) NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: habitability; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.habitability (
    habitability_id integer NOT NULL,
    planet_id integer,
    goldilocks_zone boolean DEFAULT true NOT NULL,
    water boolean DEFAULT true NOT NULL,
    more_info text,
    name character varying(10)
);


ALTER TABLE public.habitability OWNER TO freecodecamp;

--
-- Name: habitability_ph_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.habitability_ph_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.habitability_ph_id_seq OWNER TO freecodecamp;

--
-- Name: habitability_ph_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.habitability_ph_id_seq OWNED BY public.habitability.habitability_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    orbit character varying(30),
    planet_id integer NOT NULL,
    visited boolean DEFAULT false
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    prim_atmos character varying(30),
    age_b_yrs numeric(4,2),
    star_id integer,
    number_moons integer,
    orbit_in_earth_days integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    type character varying(40) NOT NULL,
    distance_in_ly numeric(8,4),
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: habitability habitability_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.habitability ALTER COLUMN habitability_id SET DEFAULT nextval('public.habitability_ph_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (7, 'Andromeda', '964 AD', 2.5, 46.56, 'barred spiral');
INSERT INTO public.galaxy VALUES (8, 'Milky Way', NULL, NULL, 26.80, 'barred spiral');
INSERT INTO public.galaxy VALUES (9, 'Triangulum', '1600 AD', 3.0, 15.29, 'unbarred spiral');
INSERT INTO public.galaxy VALUES (10, 'Pinwheel', '1781 AD', 21.0, 52.10, 'barred spiral');
INSERT INTO public.galaxy VALUES (11, 'Nubecula Major', '900 AD', 0.2, 9.86, 'magellanic spiral');
INSERT INTO public.galaxy VALUES (12, 'Sagittarius Dwarf', '1994 AD', 0.1, 3.06, 'elliptical');


--
-- Data for Name: habitability; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.habitability VALUES (1, 2, false, false, 'Venus is not considered to be a candidate for the development of life as we know it', 'Venus');
INSERT INTO public.habitability VALUES (2, 3, true, true, 'Liquid water has likely played a significant role in the development of life on our planet.', 'Earth');
INSERT INTO public.habitability VALUES (3, 4, false, true, 'Research and exploration efforts concerning the potential habitability of Mars are ongoing.', 'Mars');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'Phobos', 'inclined', 4, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 'inclined', 4, false);
INSERT INTO public.moon VALUES (4, 'Io', 'eccentric', 5, false);
INSERT INTO public.moon VALUES (5, 'Europa', 'eccentric', 5, false);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'eccentric', 5, false);
INSERT INTO public.moon VALUES (7, 'Callisto', 'eccentric', 5, false);
INSERT INTO public.moon VALUES (8, 'Amalthea', 'prograde', 5, false);
INSERT INTO public.moon VALUES (9, 'Titan', 'prograde', 6, false);
INSERT INTO public.moon VALUES (10, 'Enceladus', 'prograde', 6, false);
INSERT INTO public.moon VALUES (11, 'Mimas', 'prograde', 6, false);
INSERT INTO public.moon VALUES (12, 'Tethys', 'prograde', 6, false);
INSERT INTO public.moon VALUES (13, 'Dione', 'prograde', 6, false);
INSERT INTO public.moon VALUES (14, 'Miranda', 'prograde', 7, false);
INSERT INTO public.moon VALUES (15, 'Ariel', 'prograde', 7, false);
INSERT INTO public.moon VALUES (16, 'Umbriel', 'prograde', 7, false);
INSERT INTO public.moon VALUES (17, 'Titania', 'prograde', 7, false);
INSERT INTO public.moon VALUES (18, 'Triton', 'prograde', 8, false);
INSERT INTO public.moon VALUES (19, 'Proteus', 'prograde', 8, false);
INSERT INTO public.moon VALUES (20, 'Nereid', 'prograde', 8, false);
INSERT INTO public.moon VALUES (21, 'Larissa', 'prograde', 8, false);
INSERT INTO public.moon VALUES (1, 'Moon', 'eccentric', 3, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', NULL, NULL, 4, NULL, NULL);
INSERT INTO public.planet VALUES (10, 'TRAPPIST-1b', NULL, NULL, 5, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1c', NULL, NULL, 5, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1d', NULL, NULL, 5, NULL, NULL);
INSERT INTO public.planet VALUES (13, 'TRAPPIST-1e', NULL, NULL, 5, NULL, NULL);
INSERT INTO public.planet VALUES (14, 'TRAPPIST-1f', NULL, NULL, 5, NULL, NULL);
INSERT INTO public.planet VALUES (15, 'TRAPPIST-1g', NULL, NULL, 5, NULL, NULL);
INSERT INTO public.planet VALUES (16, 'TRAPPIST-1h', NULL, NULL, 5, NULL, NULL);
INSERT INTO public.planet VALUES (1, 'Mercury', 'helium', 4.50, 1, 0, 88);
INSERT INTO public.planet VALUES (2, 'Venus', 'carbon dioxide', 4.50, 1, 0, 225);
INSERT INTO public.planet VALUES (3, 'Earth', 'oxygen', 4.54, 1, 1, 365);
INSERT INTO public.planet VALUES (4, 'Mars', 'carbon dioxide', 4.50, 1, 2, 687);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'hydrogen', 4.50, 1, 80, 4380);
INSERT INTO public.planet VALUES (6, 'Saturn', 'hydrogen', 4.50, 1, 82, 10858);
INSERT INTO public.planet VALUES (7, 'Uranus', 'hydgrogen', 4.50, 1, 27, 30660);
INSERT INTO public.planet VALUES (8, 'Neptune', 'hydrogen', 4.50, 1, 14, 59860);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'yellow dwarf', 0.0016, 8);
INSERT INTO public.star VALUES (2, 'Sirius A', 'A-type dwarf', 8.6000, 8);
INSERT INTO public.star VALUES (3, 'Sirius B', 'white dwarf', 8.6000, 8);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 'red dwarf', 4.2000, 8);
INSERT INTO public.star VALUES (5, 'TRAPPIST-1', 'ultra-cool dwarf', 39.0000, 8);
INSERT INTO public.star VALUES (6, 'Betelgeuse', 'red supergiant', 640.0000, 8);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 12, true);


--
-- Name: habitability_ph_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.habitability_ph_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 16, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: habitability habitability_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.habitability
    ADD CONSTRAINT habitability_name_key UNIQUE (name);


--
-- Name: habitability habitability_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.habitability
    ADD CONSTRAINT habitability_pkey PRIMARY KEY (habitability_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: habitability habitability_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.habitability
    ADD CONSTRAINT habitability_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--
