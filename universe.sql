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
    name character varying(50),
    type character varying(20),
    distance real,
    mass numeric,
    has_habitable_zone boolean
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50),
    planet_id integer,
    radius real,
    temperature real,
    is_satellite boolean
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
    name character varying(50),
    star_id integer,
    radius real,
    distance real,
    has_atmosphere boolean
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
    name character varying(50),
    age integer,
    distance real,
    mass numeric,
    galaxy_id integer NOT NULL,
    description text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: star_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_galaxy_id_seq OWNED BY public.star.galaxy_id;


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
-- Name: star galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN galaxy_id SET DEFAULT nextval('public.star_galaxy_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 25000, 1500000000000, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 7.8e+06, 1300000000000, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 3e+06, 62000000000, false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 31, 100000000000, false);
INSERT INTO public.galaxy VALUES (5, 'Pinwheel', 'Spiral', 21, 50000000000, false);
INSERT INTO public.galaxy VALUES (6, 'Cigar', 'Irregular', 12, 3000000000, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3, 1738.1, -20, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 1738.1, -20, true);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 1738.1, -20, true);
INSERT INTO public.moon VALUES (4, 'Io', 6, 1738.1, -20, true);
INSERT INTO public.moon VALUES (5, 'Europa', 6, 1738.1, -20, true);
INSERT INTO public.moon VALUES (6, 'Ganymede', 6, 1738.1, -20, true);
INSERT INTO public.moon VALUES (7, 'Callisto', 6, 1738.1, -20, true);
INSERT INTO public.moon VALUES (8, 'Mimas', 7, 1738.1, -20, true);
INSERT INTO public.moon VALUES (9, 'Enceladus', 7, 1738.1, -20, true);
INSERT INTO public.moon VALUES (10, 'Tethys', 7, 1738.1, -20, true);
INSERT INTO public.moon VALUES (11, 'Tethys', 7, 1738.1, -20, true);
INSERT INTO public.moon VALUES (12, 'Tethys', 7, 1738.1, -20, true);
INSERT INTO public.moon VALUES (13, 'Tethys', 7, 1738.1, -20, true);
INSERT INTO public.moon VALUES (14, 'Tethys', 7, 1738.1, -20, true);
INSERT INTO public.moon VALUES (15, 'Callisto', 8, 235.8, -187, true);
INSERT INTO public.moon VALUES (16, 'Callisto', 8, 235.8, -187, true);
INSERT INTO public.moon VALUES (17, 'Callisto', 8, 235.8, -187, true);
INSERT INTO public.moon VALUES (18, 'Callisto', 8, 235.8, -187, true);
INSERT INTO public.moon VALUES (19, 'Callisto', 8, 235.8, -187, true);
INSERT INTO public.moon VALUES (20, 'Titania', 9, 235.8, -187, true);
INSERT INTO public.moon VALUES (21, 'Titania', 9, 235.8, -187, true);
INSERT INTO public.moon VALUES (22, 'Titania', 9, 235.8, -187, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 2439.7, 57.9, false);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 6051.8, 108.2, true);
INSERT INTO public.planet VALUES (3, 'Mercury', 1, 2324.8, 34.7, true);
INSERT INTO public.planet VALUES (4, 'Earth', 1, 2354.7, 24, false);
INSERT INTO public.planet VALUES (5, 'Mars', 1, 3389.5, 227.9, false);
INSERT INTO public.planet VALUES (6, 'Jupiter', 2, 69911, 778.3, false);
INSERT INTO public.planet VALUES (7, 'Saturn', 2, 69911, 778.3, false);
INSERT INTO public.planet VALUES (8, 'Uranus', 2, 69911, 778.3, false);
INSERT INTO public.planet VALUES (9, 'Neptune', 2, 69911, 778.3, false);
INSERT INTO public.planet VALUES (10, 'Kepler-234b', 3, 69911, 778.3, false);
INSERT INTO public.planet VALUES (11, 'Kepler-345b', 3, 69911, 778.3, false);
INSERT INTO public.planet VALUES (12, 'TRAPPIST', 4, 69911, 778.3, false);
INSERT INTO public.planet VALUES (13, 'Proxima Centauri b', 5, 69911, 778.3, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 5, 0, 1989000000000000000000000000000, 1, 'The closest star to Earth.');
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 6, 4.37, 2187900000000000000000000000000.0, 2, 'The closest star system to Earth.');
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 5, 4.24, 244647000000000000000000000000.000, 3, 'A red dwarf star in the Alpha Centauri system.');
INSERT INTO public.star VALUES (4, 'Betelgeuse', 9, 640, 23072400000000000000000000000000.0, 4, 'A red supergiant in the constellation Orion.');
INSERT INTO public.star VALUES (5, 'Vega', 455, 25, 4176900000000000000000000000000.0, 5, 'The brightest star in the constellation Lyra.');
INSERT INTO public.star VALUES (6, 'Sirius', 250, 8.6, 4017780000000000000000000000000.00, 6, 'The brightest star in the night sky.');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_galaxy_id_seq', 36, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 36, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_planet_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey1 FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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
