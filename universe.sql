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
    name character varying(30) NOT NULL,
    distance_from_earth_in_ly integer,
    galaxy_types character varying(30),
    description text,
    age_in_millions_of_years integer
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
-- Name: life; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.life (
    life_id integer NOT NULL,
    name character varying(20) NOT NULL,
    planet_id integer
);


ALTER TABLE public.life OWNER TO freecodecamp;

--
-- Name: life_life_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.life_life_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.life_life_id_seq OWNER TO freecodecamp;

--
-- Name: life_life_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.life_life_id_seq OWNED BY public.life.life_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    equatorial_diameter_in_earth numeric(4,3),
    mass_in_earth numeric(7,6),
    planet_id integer NOT NULL
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
    has_life boolean,
    is_spherical boolean,
    planet_types character varying(30),
    age_in_billions_of_years numeric(5,3),
    distance_from_earth_in_millions_of_km integer,
    star_id integer,
    mass_in_earth numeric(8,4),
    volume_in_earth numeric(7,3),
    surface_gravity_in_earth numeric(6,3),
    temperature_in_c numeric(6,2),
    escape_velocity_in_km_to_s numeric(6,3)
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
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    age_in_billions_of_years numeric(5,3),
    mass_in_solar numeric(5,3),
    radius_in_solar numeric(6,3),
    distance_from_earth_in_ly numeric(5,1),
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
-- Name: life life_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.life ALTER COLUMN life_id SET DEFAULT nextval('public.life_life_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 26670, 'spiral', 'the galaxy that includes the Solar System', 13610);
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', 158200, 'disrupted barred spiral', 'a satellite galaxy of the Milky Way', 1101);
INSERT INTO public.galaxy VALUES (7, 'Small Magellanic Cloud', 200000, 'Magellanic spiral', 'a dwarf galaxy near the Milky Way', 6500);
INSERT INTO public.galaxy VALUES (6, 'Andromeda Galaxy', 2520000, 'barred spiral', 'the nearest large galaxy to the Milky Way', 10010);
INSERT INTO public.galaxy VALUES (8, 'Triangulum Galaxy', 2730000, 'spiral', 'the third-largest member of the Local Group of galaxies', 3500000);
INSERT INTO public.galaxy VALUES (9, 'Centaurus A', 13050000, 'elliptical', 'the fifth-brightest in the sky', 13270);


--
-- Data for Name: life; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.life VALUES (1, 'Human', 1);
INSERT INTO public.life VALUES (2, 'bird', 1);
INSERT INTO public.life VALUES (3, 'fish', 1);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 0.272, 0.012300, 1);
INSERT INTO public.moon VALUES (2, 'Io', 0.285, 0.015000, 5);
INSERT INTO public.moon VALUES (3, 'Europa', 0.246, 0.008000, 5);
INSERT INTO public.moon VALUES (4, 'Ganymage', 0.413, 0.025800, 5);
INSERT INTO public.moon VALUES (5, 'Tethys', 0.084, 0.000100, 6);
INSERT INTO public.moon VALUES (6, 'Dione', 0.088, 0.000200, 6);
INSERT INTO public.moon VALUES (7, 'Titan', 0.403, 0.022500, 6);
INSERT INTO public.moon VALUES (8, 'Iapetus', 0.115, 0.000300, 6);
INSERT INTO public.moon VALUES (9, 'Ariel', 0.091, 0.000200, 7);
INSERT INTO public.moon VALUES (10, 'Titania', 0.124, 0.000600, 7);
INSERT INTO public.moon VALUES (11, 'Oberon', 0.119, 0.000500, 7);
INSERT INTO public.moon VALUES (12, 'Triton', 0.212, 0.003600, 8);
INSERT INTO public.moon VALUES (13, 'Charon', 0.095, 0.000300, 9);
INSERT INTO public.moon VALUES (14, 'Callisto', 0.378, 0.018000, 5);
INSERT INTO public.moon VALUES (15, 'Rhea', 0.120, 0.000400, 6);
INSERT INTO public.moon VALUES (16, 'Mimas', 0.031, 0.000006, 6);
INSERT INTO public.moon VALUES (17, 'Enceladus', 0.040, 0.000018, 6);
INSERT INTO public.moon VALUES (18, 'Dysnomia', 0.057, 0.000050, 11);
INSERT INTO public.moon VALUES (19, 'Umbriel', 0.092, 0.000200, 7);
INSERT INTO public.moon VALUES (20, 'Miranda', 0.037, 0.000011, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, true, 'terrestrial planet', 4.543, 0, 1, 1.0000, 1.000, 1.000, 14.76, 11.186);
INSERT INTO public.planet VALUES (2, 'Mars', false, true, 'terrestrial planet', 4.603, 225, 1, 0.1070, 0.151, 0.379, -64.00, 5.027);
INSERT INTO public.planet VALUES (3, 'Mercury', false, true, 'terrestrial planet', 4.503, 48, 1, 0.0550, 0.056, 0.380, 164.00, 4.250);
INSERT INTO public.planet VALUES (4, 'Venus', false, true, 'terrestrial planet', 4.503, 68, 1, 0.8150, 0.857, 0.904, -41.00, 10.360);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, true, 'gas giant', 4.603, 863, 1, 317.8000, 1321.000, 24.790, -185.00, 59.500);
INSERT INTO public.planet VALUES (6, 'Saturn', false, false, 'gas giant', 4.503, 1400, 1, 95.1590, 763.590, 1.065, -185.00, 35.500);
INSERT INTO public.planet VALUES (7, 'Uranus', false, true, 'ice giant', 4.503, 2800, 1, 14.5360, 63.086, 0.886, -195.00, 21.300);
INSERT INTO public.planet VALUES (9, 'Pluto', false, true, 'dwarf planet', 4.600, 3580, 1, 0.0020, 0.006, 0.063, -232.00, 1.212);
INSERT INTO public.planet VALUES (8, 'Neptune', false, true, 'ice giant', 4.503, 4400, 1, 17.1470, 57.740, 1.140, -214.00, 23.500);
INSERT INTO public.planet VALUES (10, 'Ceres', false, true, 'dwarf planet', 4.560, 246, 1, 0.0002, 0.000, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'Eris', false, true, 'dwarf planet', 4.503, 10125, 1, 0.0027, 0.006, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'Orcus', false, true, 'dwarf planet', NULL, NULL, 1, 0.0001, NULL, NULL, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Canopus', 4, 0.025, 8.000, 73.300, 310.0, 1);
INSERT INTO public.star VALUES ('Sun', 1, 4.600, 1.000, 1.000, 0.0, 1);
INSERT INTO public.star VALUES ('Alpha Centauri A', 5, 5.300, 1.079, 1.218, 4.3, 1);
INSERT INTO public.star VALUES ('Vega', 6, 0.455, 2.135, 2.550, 25.0, 1);
INSERT INTO public.star VALUES ('Betelgeuse', 7, 0.008, 16.500, 764.000, 548.0, 1);
INSERT INTO public.star VALUES ('Sirius A', 2, 0.002, 2.063, 1.711, 8.6, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 9, true);


--
-- Name: life_life_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.life_life_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


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
-- Name: life life_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.life
    ADD CONSTRAINT life_name_key UNIQUE (name);


--
-- Name: life life_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.life
    ADD CONSTRAINT life_pkey PRIMARY KEY (life_id);


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
-- Name: life life_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.life
    ADD CONSTRAINT life_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

