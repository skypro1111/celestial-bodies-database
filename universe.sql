--
-- PostgreSQL database dump
--


-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 18.6

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

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(60) NOT NULL,
    star_id integer NOT NULL,
    diameter_km integer,
    is_potentially_hazardous boolean DEFAULT false NOT NULL
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    galaxy_type character varying(40) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric(12,2),
    description text,
    has_black_hole boolean DEFAULT true NOT NULL
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


ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60) NOT NULL,
    planet_id integer NOT NULL,
    diameter_km integer,
    orbital_period_days numeric(10,2),
    is_spherical boolean DEFAULT true NOT NULL,
    description text
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


ALTER SEQUENCE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    star_id integer NOT NULL,
    planet_type character varying(40) NOT NULL,
    number_of_moons integer,
    distance_from_star_au numeric(10,3),
    has_life boolean DEFAULT false NOT NULL,
    is_spherical boolean DEFAULT true NOT NULL
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


ALTER SEQUENCE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_millions_of_years integer,
    temperature_kelvin integer,
    mass_in_suns numeric(8,3),
    is_visible_naked_eye boolean DEFAULT false NOT NULL
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


ALTER SEQUENCE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 1, 939, false);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 1, 525, false);
INSERT INTO public.asteroid VALUES (3, 'Apophis', 1, 0, true);
INSERT INTO public.asteroid VALUES (4, 'Bennu', 1, 0, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred Spiral', 13600, 0.00, 'Our home galaxy.', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 10000, 2537000.00, 'Nearest large spiral galaxy.', true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 10000, 2730000.00, 'Third-largest in the Local Group.', false);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'Irregular', 13000, 163000.00, 'Satellite of the Milky Way.', false);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Spiral', 13250, 29350000.00, 'Bright nucleus and large bulge.', true);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'Spiral', 400, 23160000.00, 'Classic grand-design spiral.', true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 3474, 27.32, true, 'Earth''s only natural satellite.');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 22, 0.32, false, 'Larger moon of Mars.');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12, 1.26, false, 'Smaller moon of Mars.');
INSERT INTO public.moon VALUES (4, 'Io', 5, 3643, 1.77, true, 'Most volcanically active body.');
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3122, 3.55, true, 'Ice-covered ocean world.');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 5268, 7.15, true, 'Largest moon in the Solar System.');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4821, 16.69, true, 'Heavily cratered surface.');
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, 167, 0.50, false, 'Reddest object in the Solar System.');
INSERT INTO public.moon VALUES (9, 'Titan', 6, 5150, 15.95, true, 'Thick nitrogen atmosphere.');
INSERT INTO public.moon VALUES (10, 'Enceladus', 6, 504, 1.37, true, 'Water geysers at its south pole.');
INSERT INTO public.moon VALUES (11, 'Mimas', 6, 396, 0.94, true, 'Large Herschel crater.');
INSERT INTO public.moon VALUES (12, 'Rhea', 6, 1527, 4.52, true, 'Second-largest moon of Saturn.');
INSERT INTO public.moon VALUES (13, 'Iapetus', 6, 1469, 79.32, true, 'Two-toned surface.');
INSERT INTO public.moon VALUES (14, 'Dione', 6, 1123, 2.74, true, 'Icy wispy terrain.');
INSERT INTO public.moon VALUES (15, 'Tethys', 6, 1062, 1.89, true, 'Huge Odysseus crater.');
INSERT INTO public.moon VALUES (16, 'Titania', 7, 1578, 8.71, true, 'Largest moon of Uranus.');
INSERT INTO public.moon VALUES (17, 'Oberon', 7, 1523, 13.46, true, 'Outermost major moon of Uranus.');
INSERT INTO public.moon VALUES (18, 'Miranda', 7, 472, 1.41, true, 'Extreme cliffs like Verona Rupes.');
INSERT INTO public.moon VALUES (19, 'Ariel', 7, 1158, 2.52, true, 'Brightest moon of Uranus.');
INSERT INTO public.moon VALUES (20, 'Triton', 8, 2707, -5.88, true, 'Retrograde orbit around Neptune.');
INSERT INTO public.moon VALUES (21, 'Nereid', 8, 357, 360.13, false, 'Highly eccentric orbit.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', 0, 0.387, false, true);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', 0, 0.723, false, true);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', 1, 1.000, true, true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', 2, 1.524, false, true);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas Giant', 95, 5.203, false, true);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas Giant', 146, 9.537, false, true);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice Giant', 28, 19.191, false, true);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice Giant', 16, 30.069, false, true);
INSERT INTO public.planet VALUES (9, 'Proxima b', 2, 'Terrestrial', 0, 0.049, false, true);
INSERT INTO public.planet VALUES (10, 'TRAPPIST-1e', 6, 'Terrestrial', 0, 0.029, false, true);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1f', 6, 'Terrestrial', 0, 0.038, false, true);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1g', 6, 'Terrestrial', 0, 0.047, false, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4600, 5778, 1.000, true);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 4850, 3042, 0.122, false);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 242, 9940, 2.063, true);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 10, 3500, 16.500, true);
INSERT INTO public.star VALUES (5, 'Alpheratz', 2, 60, 13800, 3.800, true);
INSERT INTO public.star VALUES (6, 'TRAPPIST-1', 1, 7600, 2566, 0.089, false);
INSERT INTO public.star VALUES (7, 'R136a1', 4, 1, 46000, 196.000, false);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 4, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: asteroid asteroid_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--


