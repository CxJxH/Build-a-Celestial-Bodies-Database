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
    description text,
    galaxy_types character varying(40),
    age_in_millions_of_years integer,
    distance_from_earth numeric(20,2)
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
-- Name: gspm; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.gspm (
    gspm_id integer NOT NULL,
    galaxy_id integer,
    moon_id integer,
    planet_id integer,
    star_id integer,
    name character varying(40) NOT NULL
);


ALTER TABLE public.gspm OWNER TO freecodecamp;

--
-- Name: gspm_gspm_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.gspm_gspm_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gspm_gspm_id_seq OWNER TO freecodecamp;

--
-- Name: gspm_gspm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.gspm_gspm_id_seq OWNED BY public.gspm.gspm_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text,
    is_spherical boolean,
    age_in_millions_of_years integer,
    distance_from_earth numeric(20,2),
    planet_id integer
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
    name character varying(40) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    planet_types character varying(40),
    age_in_millions_of_years integer,
    distance_from_earth numeric(20,2),
    star_id integer
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
    description text,
    is_spherical boolean,
    age_in_millions_of_years integer,
    distance_from_earth numeric(20,2),
    galaxy_id integer,
    star_types character varying(40)
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
-- Name: gspm gspm_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.gspm ALTER COLUMN gspm_id SET DEFAULT nextval('public.gspm_gspm_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way Galaxy', 'A barred spiral galaxy containing over 100 billion stars, including our own sun.', 'SBbc', 13600, 100000.00);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy (M31)', 'A spiral galaxy similar to the Milky Way and the closest galaxy to our own.', 'Sb', 10000, 2500000.00);
INSERT INTO public.galaxy VALUES (3, 'Whirlpool Galaxy (M51)', 'A grand design spiral galaxy with a prominent dust lane and companion galaxy.', 'Sc', 400, 23600000.00);
INSERT INTO public.galaxy VALUES (4, 'Sombrero Galaxy (M104)', 'A spiral galaxy with a large central bulge and prominent dust lane resembling a sombrero.', 'S0', 8200, 28000000.00);
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud (LMC)', 'A dwarf irregular galaxy that is a satellite of the Milky Way and visible to the naked eye from the southern hemisphere.', 'IBm', 1700, 163000.00);
INSERT INTO public.galaxy VALUES (6, 'Triangulum Galaxy (M33)', 'A spiral galaxy similar to the Milky Way and Andromeda, located in the Local Group.', 'Scd', 15000, 3000000.00);


--
-- Data for Name: gspm; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.gspm VALUES (1, 1, 1, 4, 1, 'Milky Way Galaxy');
INSERT INTO public.gspm VALUES (2, 1, 2, 6, 1, 'Milky Way Galaxy');
INSERT INTO public.gspm VALUES (3, 1, 4, 16, 1, 'Milky Way Galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'The Moon is a natural satellite of the Earth.', true, 4531, 1.28, 4);
INSERT INTO public.moon VALUES (2, 'Ganymede', 'Ganymede is the largest moon in the Solar System.', true, 4568, 38.10, 6);
INSERT INTO public.moon VALUES (3, 'Europa', 'Europa is one of the Galilean moons of Jupiter and is believed to have a subsurface ocean of liquid water.', true, 4568, 67.10, 6);
INSERT INTO public.moon VALUES (4, 'Titan', 'Titan is the largest moon of Saturn and is the only moon in the Solar System known to have a dense atmosphere.', true, 4545, 746.00, 16);
INSERT INTO public.moon VALUES (5, 'Triton', 'Triton is the largest moon of Neptune and is one of the few moons in the Solar System that has a retrograde orbit.', true, 4504, 4.40, 13);
INSERT INTO public.moon VALUES (6, 'Titania', 'Titania is the largest moon of Uranus.', true, 4511, 2.70, 12);
INSERT INTO public.moon VALUES (7, 'Io', 'The most volcanic object in the solar system.', true, 4500, 390.00, 6);
INSERT INTO public.moon VALUES (8, 'Callisto', 'The most heavily cratered object in the solar system.', true, 4500, 390.00, 6);
INSERT INTO public.moon VALUES (9, 'Miranda', 'Has the most varied and extreme topography of any object in the solar system.', true, 4500, 2645.00, 12);
INSERT INTO public.moon VALUES (10, 'Enceladus', 'Icy moon with subsurface ocean and geysers.', true, 4500, 1400.00, 16);
INSERT INTO public.moon VALUES (11, 'Oberon', 'Dark and heavily cratered.', true, 4500, 31.80, 12);
INSERT INTO public.moon VALUES (12, 'Nereid', 'Irregularly shaped, thought to be captured asteroid', false, 4500, 2700.00, 13);
INSERT INTO public.moon VALUES (13, 'Umbriel', 'Umbriel is the third largest moon of Uranus. It has a heavily cratered surface and is the darkest of the Uranian moons.', true, 4500, 19.14, 12);
INSERT INTO public.moon VALUES (14, 'Ariel', 'Ariel is the fourth largest of the moons of Uranus. It has the youngest and most varied surface of the five largest moons of Uranus.', true, 4500, 19.14, 12);
INSERT INTO public.moon VALUES (15, 'Amalthea', 'Small, reddish moon with a lumpy shape.', false, 4500, 415.00, 6);
INSERT INTO public.moon VALUES (16, 'Thebe', 'Small and irregularly shaped moon with a heavily cratered surface.', false, 4500, 422.00, 6);
INSERT INTO public.moon VALUES (17, 'Atlas', 'Small, irregularly shaped moon with a prominent equatorial ridge.', false, 4500, 1238.00, 16);
INSERT INTO public.moon VALUES (18, 'Prometheus', 'Small, irregularly shaped moon that helps maintain the shape of Saturns F-ring.', false, 4500, 1507.00, 16);
INSERT INTO public.moon VALUES (19, 'Puck', 'Small, irregularly shaped moon with a heavily cratered surface.', false, 3500, 3000.00, 12);
INSERT INTO public.moon VALUES (20, 'Caliban', 'Small, irregularly shaped moon with a dark, heavily cratered surface.', false, 3500, 1715.00, 12);
INSERT INTO public.moon VALUES (21, 'Naiad', 'Small, irregularly shaped moon with a heavily cratered surface.', false, 4500, 4200.00, 13);
INSERT INTO public.moon VALUES (22, 'Thalassa', 'Small, irregularly shaped moon with a heavily cratered surface.', false, 4500, 4200.00, 13);
INSERT INTO public.moon VALUES (23, 'Hydra', 'Small, irregularly shaped moon with a dark, heavily cratered surface.', false, 4500, 4670.00, 14);
INSERT INTO public.moon VALUES (24, 'Nix', 'Small, irregularly shaped moon with a reddish tint and a heavily cratered surface.', false, 4500, 4670.00, 14);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'The closest planet to the Sun, and the smallest planet in the Solar System.', false, true, 'Terrestrial', 4500, 4.09, 1);
INSERT INTO public.planet VALUES (2, 'Alpha Centauri b', 'An exoplanet orbiting Alpha Centauri A.', false, true, 'Terrestrial', 6, 4.37, 2);
INSERT INTO public.planet VALUES (3, 'Venus', 'Known for its thick and toxic atmosphere, Venus is the hottest planet in our solar system.', false, true, 'Terrestrial', 4500, 25.00, 1);
INSERT INTO public.planet VALUES (4, 'Earth', 'The only known planet with the conditions necessary to support life.', true, true, 'Terrestrial', 4500, 1.00, 1);
INSERT INTO public.planet VALUES (5, 'Mars', 'Often called the "Red Planet" due to its rusty color, Mars is home to the largest volcano in the solar system.', false, true, 'Terrestrial', 4500, 0.50, 1);
INSERT INTO public.planet VALUES (6, 'Jupiter', 'The largest planet in our solar system, Jupiter is known for its colorful bands and the Great Red Spot.', false, false, 'Gas Giant', 4500, 35.00, 1);
INSERT INTO public.planet VALUES (7, 'Proxima Centauri b', 'Earth-sized, rocky planet orbiting Proxima Centauri.', NULL, true, 'Terrestrial', 10, 4.24, 2);
INSERT INTO public.planet VALUES (8, 'Alpha Centauri Bb', 'Super Earth orbiting Alpha Centauri B.', NULL, NULL, 'Terrestrial or Gas Giant', 10, 4.37, 2);
INSERT INTO public.planet VALUES (9, 'Alpha Centauri Bc', 'Super Earth orbiting Alpha Centauri B.', NULL, NULL, 'Terrestrial or Gas Giant', 10, 4.37, 2);
INSERT INTO public.planet VALUES (10, 'Alpha Centauri Bd', 'Super Earth orbiting Alpha Centauri B.', NULL, NULL, 'Terrestrial or Gas GIant', 10, 4.37, 2);
INSERT INTO public.planet VALUES (11, 'Alpha Centauri Cb', 'Neptune-like planet orbiting Alpha Centauri C.', NULL, NULL, 'Gas Giant', NULL, 4.22, 2);
INSERT INTO public.planet VALUES (12, 'Uranus', 'Has a tilted axis and a faint ring system.', false, false, 'Ice Giant', 4500, 31.80, 1);
INSERT INTO public.planet VALUES (13, 'Neptune', 'Has the strongest winds in the solar system.', false, false, 'Ice Giant', 4500, 30.10, 1);
INSERT INTO public.planet VALUES (14, 'Pluto', 'Dwarf planet with a highly elliptical orbit.', false, true, 'Dwarf Planet', 4500, 4.67, 1);
INSERT INTO public.planet VALUES (15, 'Eris', 'Dwarf planet larger than Pluto.', false, true, 'Dwarf Planet', 4500, 96.40, 1);
INSERT INTO public.planet VALUES (16, 'Saturn', 'Saturn is a gas giant, with an atmosphere made mostly of hydrogen and helium. It is best known for its prominent ring system.', false, true, 'Jovian', 4500, 746.00, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The star at the center of the Solar System that provides light and heat to the planets.', false, 4600, 8.30, 1, 'G2V (Yellow Dwarf)');
INSERT INTO public.star VALUES (2, 'Alpha Centauri', 'A triple star system consisting of three stars, with the closest one being the nearest star to the Solar System.', false, 6000, 4.37, 1, 'G2V (Yellow Dwarf)');
INSERT INTO public.star VALUES (3, 'RX J0042.3+4115', 'Blue star', false, 25, 2500000.00, 2, 'O-Type');
INSERT INTO public.star VALUES (4, 'J004457.70+412352.5', 'Yellow star', false, 7500, 2500000.00, 2, 'G-Type');
INSERT INTO public.star VALUES (5, 'NGC 5195 X-1', 'High mass X-ray binary with black hole.', false, 30, 26000000.00, 3, 'Binary');
INSERT INTO public.star VALUES (6, 'SN 1994I', 'Type Ic supernova', true, 30, 23000000.00, 3, 'Supernova');
INSERT INTO public.star VALUES (7, 'M104-S1', 'A red supergiant star located in the central bulge of the Sombrero Galaxy.', true, 8000, 28000000.00, 4, 'M-Type');
INSERT INTO public.star VALUES (8, 'M104-S2', 'A blue giant star located in the disk of the Sombrero Galaxy.', true, 7000, 29000000.00, 4, 'B-Type');
INSERT INTO public.star VALUES (9, 'R136a1', 'A very massive star that is part of the R136 star cluster in the Tarantula Nebula. It is one of the most luminous and massive stars known.', false, 1, 163000.00, 5, 'Blue Hypergiant');
INSERT INTO public.star VALUES (10, 'HV11417', 'A hot, bright star in the LMC that is part of a binary star system. It has an estimated mass of 40 times that of the Sun.', true, 18, 163000.00, 5, 'Blue Supergiant');
INSERT INTO public.star VALUES (11, 'HV0085', 'Blue supergiant star.', false, 30, 3000000.00, 6, 'O-Type');
INSERT INTO public.star VALUES (12, 'HV0086', 'Red giant star.', false, 2000, 2900000.00, 6, 'M-Type');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: gspm_gspm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.gspm_gspm_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 16, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 18, true);


--
-- Name: galaxy galaxy_id_pk; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_id_pk PRIMARY KEY (galaxy_id);


--
-- Name: gspm gspm_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.gspm
    ADD CONSTRAINT gspm_pkey PRIMARY KEY (gspm_id);


--
-- Name: moon moon_id_pk; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id_pk PRIMARY KEY (moon_id);


--
-- Name: planet planet_id_pk; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id_pk PRIMARY KEY (planet_id);


--
-- Name: star star_id_pk; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id_pk PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy UNIQUE (galaxy_id);


--
-- Name: gspm unique_gspm; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.gspm
    ADD CONSTRAINT unique_gspm UNIQUE (galaxy_id, moon_id, planet_id, star_id);


--
-- Name: moon unique_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon UNIQUE (moon_id);


--
-- Name: planet unique_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet UNIQUE (planet_id);


--
-- Name: star unique_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star UNIQUE (star_id);


--
-- Name: star galaxy_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_id_fk FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: gspm gspm_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.gspm
    ADD CONSTRAINT gspm_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: gspm gspm_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.gspm
    ADD CONSTRAINT gspm_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: gspm gspm_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.gspm
    ADD CONSTRAINT gspm_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: gspm gspm_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.gspm
    ADD CONSTRAINT gspm_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon planet_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_id_fk FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_id_fk FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

