--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.25
-- Dumped by pg_dump version 14.1

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

ALTER TABLE IF EXISTS ONLY public.customertickets DROP CONSTRAINT IF EXISTS customertickets_customers_id_fk;
ALTER TABLE IF EXISTS ONLY public.devices DROP CONSTRAINT IF EXISTS "DEVICES_devicetypes_devicetype_FK";
ALTER TABLE IF EXISTS ONLY public.customerservicesdevices DROP CONSTRAINT IF EXISTS "CUSTOMERSERVICESDEVICES_customers_customer_FK";
ALTER TABLE IF EXISTS ONLY public.customerservicesdevices DROP CONSTRAINT IF EXISTS "CUSTOMERSERVICESDEVICES_costs_cost_FK";
ALTER TABLE IF EXISTS ONLY public.costs DROP CONSTRAINT IF EXISTS "COSTS_services_service_FK";
ALTER TABLE IF EXISTS ONLY public.costs DROP CONSTRAINT IF EXISTS "COSTS_devicetype_devicetype_FK";
ALTER TABLE IF EXISTS ONLY public.costs DROP CONSTRAINT IF EXISTS "COSTS_devices_device_FK";
DROP INDEX IF EXISTS public.services_servicename_uindex;
DROP INDEX IF EXISTS public.devicetypes_name_uindex;
DROP INDEX IF EXISTS public.devices_systemname_uindex;
DROP INDEX IF EXISTS public."COSTS_services_types_INDEX";
ALTER TABLE IF EXISTS ONLY public.signeddocuments DROP CONSTRAINT IF EXISTS signeddocuments_pk;
ALTER TABLE IF EXISTS ONLY public.services DROP CONSTRAINT IF EXISTS services_pk;
ALTER TABLE IF EXISTS ONLY public.devicetypes DROP CONSTRAINT IF EXISTS devicetypes_pk;
ALTER TABLE IF EXISTS ONLY public.devices DROP CONSTRAINT IF EXISTS devices_pk;
ALTER TABLE IF EXISTS ONLY public.customertickets DROP CONSTRAINT IF EXISTS customertickets_pkey;
ALTER TABLE IF EXISTS ONLY public.customerservicesdevices DROP CONSTRAINT IF EXISTS customerservicesdevices_pk;
ALTER TABLE IF EXISTS ONLY public.customers DROP CONSTRAINT IF EXISTS customers_pk;
ALTER TABLE IF EXISTS ONLY public.costs DROP CONSTRAINT IF EXISTS costs_pk;
ALTER TABLE IF EXISTS public.signeddocuments ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.services ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.devicetypes ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.devices ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.customertickets ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.customerservicesdevices ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.customers ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.costs ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE IF EXISTS public.signeddocuments_id_seq;
DROP TABLE IF EXISTS public.signeddocuments;
DROP SEQUENCE IF EXISTS public.services_id_seq;
DROP TABLE IF EXISTS public.services;
DROP SEQUENCE IF EXISTS public.devicetypes_id_seq;
DROP TABLE IF EXISTS public.devicetypes;
DROP SEQUENCE IF EXISTS public.devices_id_seq;
DROP TABLE IF EXISTS public.devices;
DROP SEQUENCE IF EXISTS public.customertickets_id_seq;
DROP TABLE IF EXISTS public.customertickets;
DROP SEQUENCE IF EXISTS public.customerservicesdevices_id_seq;
DROP TABLE IF EXISTS public.customerservicesdevices;
DROP SEQUENCE IF EXISTS public.customers_id_seq;
DROP TABLE IF EXISTS public.customers;
DROP SEQUENCE IF EXISTS public.costs_id_seq;
DROP TABLE IF EXISTS public.costs;
SET default_tablespace = '';

--
-- Name: costs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.costs (
    id integer NOT NULL,
    service integer,
    servicedevicetype integer,
    cost double precision NOT NULL,
    device integer
);


--
-- Name: costs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.costs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: costs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.costs_id_seq OWNED BY public.costs.id;


--
-- Name: customers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customers (
    id integer NOT NULL,
    name character varying(60) NOT NULL,
    city integer,
    documenttype character varying(101),
    documentid character varying(30),
    email character varying(90),
    birthdate date,
    userid integer,
    policyaccepted boolean DEFAULT false NOT NULL,
    photoid character varying(300)
);


--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- Name: customerservicesdevices; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customerservicesdevices (
    id integer NOT NULL,
    customer integer NOT NULL,
    cost integer NOT NULL
);


--
-- Name: customerservicesdevices_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.customerservicesdevices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: customerservicesdevices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.customerservicesdevices_id_seq OWNED BY public.customerservicesdevices.id;


--
-- Name: customertickets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customertickets (
    id integer NOT NULL,
    comments text,
    fileid integer,
    signature text,
    customer integer
);


--
-- Name: customertickets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.customertickets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: customertickets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.customertickets_id_seq OWNED BY public.customertickets.id;


--
-- Name: devices; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.devices (
    id integer NOT NULL,
    systemname character varying DEFAULT 60 NOT NULL,
    devicetype integer NOT NULL
);


--
-- Name: devices_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.devices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: devices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.devices_id_seq OWNED BY public.devices.id;


--
-- Name: devicetypes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.devicetypes (
    id integer NOT NULL,
    name character varying DEFAULT 30 NOT NULL
);


--
-- Name: devicetypes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.devicetypes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: devicetypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.devicetypes_id_seq OWNED BY public.devicetypes.id;


--
-- Name: services; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.services (
    id integer NOT NULL,
    servicename character varying DEFAULT 60 NOT NULL
);


--
-- Name: services_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.services_id_seq OWNED BY public.services.id;


--
-- Name: signeddocuments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.signeddocuments (
    id integer NOT NULL,
    userid integer NOT NULL,
    document text,
    sign text
);


--
-- Name: signeddocuments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.signeddocuments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: signeddocuments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.signeddocuments_id_seq OWNED BY public.signeddocuments.id;


--
-- Name: costs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.costs ALTER COLUMN id SET DEFAULT nextval('public.costs_id_seq'::regclass);


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- Name: customerservicesdevices id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customerservicesdevices ALTER COLUMN id SET DEFAULT nextval('public.customerservicesdevices_id_seq'::regclass);


--
-- Name: customertickets id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customertickets ALTER COLUMN id SET DEFAULT nextval('public.customertickets_id_seq'::regclass);


--
-- Name: devices id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.devices ALTER COLUMN id SET DEFAULT nextval('public.devices_id_seq'::regclass);


--
-- Name: devicetypes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.devicetypes ALTER COLUMN id SET DEFAULT nextval('public.devicetypes_id_seq'::regclass);


--
-- Name: services id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.services ALTER COLUMN id SET DEFAULT nextval('public.services_id_seq'::regclass);


--
-- Name: signeddocuments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.signeddocuments ALTER COLUMN id SET DEFAULT nextval('public.signeddocuments_id_seq'::regclass);


--
-- Data for Name: costs; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.customers VALUES (1, 'Jhon Doe', 43117, 'CC', '956781234', 'info@jhanu.com', '2022-11-26', 12, true, '1671717699121_1');


--
-- Data for Name: customerservicesdevices; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: customertickets; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.customertickets VALUES (6, 'ds fjhds fkjsdhfjks', 123, NULL, 1);


--
-- Data for Name: devices; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.devices VALUES (15, 'My windows x1', 19);
INSERT INTO public.devices VALUES (16, 'My windows x2', 19);
INSERT INTO public.devices VALUES (17, 'My windows x3', 19);
INSERT INTO public.devices VALUES (18, 'My windows x4', 20);
INSERT INTO public.devices VALUES (21, 'My windows x6', 22);


--
-- Data for Name: devicetypes; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.devicetypes VALUES (7, 'new option');
INSERT INTO public.devicetypes VALUES (8, 'new haha');
INSERT INTO public.devicetypes VALUES (12, 'New Device Example');
INSERT INTO public.devicetypes VALUES (13, 'new device');
INSERT INTO public.devicetypes VALUES (4, 'MACOS2');
INSERT INTO public.devicetypes VALUES (19, 'Windows');
INSERT INTO public.devicetypes VALUES (20, 'MS WIN');
INSERT INTO public.devicetypes VALUES (22, 'MS WIN x1');


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: signeddocuments; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.signeddocuments VALUES (1, 12, 'hkjsdhfkjds kjfh kdjs fkjdsh fkjhdskjfhkjsdhfkjs', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAlgAAADICAYAAAA0n5+2AAAgAElEQVR4Xu2dW8w8SVmH/yDIyklRDCISZg0JxCALHhBFZTBG0QsXwoUCiQ4IEROSXS4QMCLfckGWQGRJ5AKB8BGNEGKyywWKNzAoaBAjLGoED2EWlUVEwUUEBdH32X8XW1s7h56Z6vn68FTyZk7V1VXPWzP1m7eqq+92ySQBCUhAAhKQgAQkUJXA3aqWZmESkIAEJCABCUhAApcUWHYCCUhAAhKQgAQkUJmAAqsyUIuTgAQkIAEJSEACCiz7gAQkIAEJSEACEqhMQIFVGajFSUACEpCABCQgAQWWfUACEpCABCQgAQlUJqDAqgzU4iQgAQlIQAISkIACyz4gAQlIQAISkIAEKhNQYFUGanESkIAEJCABCUhAgWUfkIAEJCABCUhAApUJKLAqA7U4CUhAAhKQgAQkoMCyD0hAAhKQgAQkIIHKBBRYlYFanAQkIAEJSEACElBg2QckIAEJSEACEpBAZQIKrMpALU4CEpCABCQgAQkosOwDEpCABCQgAQlIoDIBBVZloBYnAQlIQAISkIAEFFj2AQlIQAISkIAEJFCZgAKrMlCLk4AEJCABCUhAAgos+4AEJCABCUhAAhKoTECBVRmoxUlAAhKQgAQkIAEFln1AAhKQgAQkIAEJVCagwKoM1OIkIAEJSEACEpCAAss+IAEJSEACEpCABCoTUGBVBmpxEpCABCQgAQlIQIFlH5CABCQgAQlIQAKVCSiwKgO1OAlIQAISkIAEJKDAsg9IQAISkIAEJCCBygQUWJWBWpwEJCABCUhAAhJQYNkHJCABCUhAAhKQQGUCCqzKQC1OAhKQgAQkIAEJKLDsAxKQgAQkIAEJSKAyAQVWZaAWJwEJSEACEpCABBRY9gEJSEACEpCABCRQmYACqzJQi5OABCQgAQlIQAIKLPuABCQgAQlIQAISqExAgVUZqMVJQAISkIAEJCABBZZ9QAISkIAEJCABCVQmoMCqDNTiJCABCUhAAhKQgALLPiABCUhAAhKQgAQqE1BgVQZqcRKQgAQkIAEJSECBZR+QgAQkIAEJSEAClQkosCoDtTgJSEACEpCABCSgwLIPSEACEpCABCQggcoEFFiVge4o7jHx+dVh88bI/tGwp4d9+LRV8WwSkIAEJCABCXRFQIHVFdk7l7uIly8Lm2053ZPis+VpquNZJCABCUhAAhLokoACq0u6ly4RsXpzGI+7EhGsx+7K5OcSkIAEJCABCfSfgAKrOx8toujXhH3ThlPcFu/fGvaI7HOjWN35w5IlIAEJSEACJyOgwOoGNeKKyFWZbok3bghbhqU1VzfFc9Zlka4LO+umSpYqAQlIQAISkMCpCCiw6pNGQF1TFPsf8frasPM1p7s+3nuRAqu+IyxRAhKQgAQkcFEEFFh1ySOgfqEo8rVNVOpzG06VR7BYCP/yulWyNAlIQAISkIAETk1AgVWP+I1R1FOy4rZFrfKzMlV4VfMGi9zdrqGeTyxJAhKQgAQkcCEEFFjHY2cRO+utcnH13ni9CFvtKJ6rCz/U5GF91uz46liCBCQgAQlIQAIXTUCBdZwHEEhErnJh9Lp4/fwWxSLMEFfp2KfGc6YLTRKQgAQkIAEJDJyAAutwB84bcZW2YWBKkCjWskWRHIMwowzSO5pjWxxqFglIQAISkIAE+k5AgXWYhxZxWL4NA9N7iKVVy+LyKw1vbo7dtAi+ZZFmk4AEJCABCUigLwQUWPt7ohRX+wqk58Qp39CcFmHGNKPian8/eIQEJCABCUigtwQUWPu5higVU3tpWpCpPQRXW4GUL2rnzFeGrfargrklIAEJSEACEug7AQVWew8hqj5eiKv8ysFdJZXHvzAOePWug/xcAhKQgAQkIIHhEVBgtfdZviHovtOCiKv3hBHBIrH5KDu7myQgAQlIQAISGCEBBVY7pyKGuHEziasFEUqrdofenqsUZ0lo7VGEWSUgAQlIQAISGAoBBdZuT80iC9EnHkn77ld1Hsek2+fse7Xh7tqZQwISkIAEJCCB3hFQYO12ybsiy0822fad2svFFZGveZi3wtnN3BwSkIAEJCCBQRNQYG13H4vYuWqQtArjXoFtrxhUXA36q2HlJSABCUhAAocTUGBtZjeLj7iVTdqSYZ8bMSuuDu+THikBCUhAAhIYPAEF1mYXLuOjJzYfvyAe2X29Tcp3aXdasA0x80hAAhKQgARGRkCBtd6hi3g73QrnvfF83tLvb4p8z27yKq5aQjObBCQgAQlIYGwEFFh39Wi5IWjbqcE8ckWp7tI+tm+L7ZGABCQgAQm0JKDAuiuofM+q6+LjsxYszyNP2oqB7E8Pe1uL48wiAQlIQAISkMAICSiw7uzU/F6B7Fk1a+FzBNjLsnz7rNdqUbxZJCABCUhAAhIYGgEF1p09lkevnhUfEZnalkpxte8+WUPrL9ZXAhKQgAQkIIEWBBRYd0AiWsXNnEltolf57XM45h1h+9z8uYV7zCIBCUhAAhKQwBAJKLDu8FoejdoVvSrF1b43fx5iX7HOEpCABCQgAQm0JKDAugPUKp4+LIztFdLmousw5kIsRbvm8YTjTRKQgAQkIAEJSOCSAutyJ8gXt29bR3UeefOrBZlKZFrQ+wv6ZZKABCQgAQlI4GsEFFiXUeR7WK3b94qIFhuP5musiHQhzFb2JwlIQAISkIAEJJATUGBdpvHRsEeEsZYK0ZQnxBU3fJ5nb7rmyu+RBCQgAQlIQAIbCSiw7jw9+Nwg9caMFovZrw+7V/Yet84hkvU5+5UEJCABCUhAAhJYR0CBdcf0YD7lNwtYTAnmUSv4vSUM0aW48vskAQlIQAISkIARrC19YBWfcfVguqnzWTy/Jqy8ktB9rvwiSUACEpCABCTQisDUI1hM9bG+ivS6sCeElWuw+Exx1ao7mUkCEpCABCQgAQhMXWDlVw9u6hGKK78rEpCABCQgAQnsRWDKAospwFvDrthCDHG1CHPN1V7dyswSkIAEJCCBaROYqsB6dLj9PWHfvMX918VnZ9PuHrZeAhKQgAQkIIFDCExRYLHu6rfD7rsBGLuzE7VaHgLUYyQgAQlIQAISkMCUBBaL118TNt/gdrZpYE0W5pSg3w0JSEACEpCABA4mMHaBxTqrq5uI1CZhBTz2tzoLWx1M0gMlIAEJSEACEpBAQ2DMAosNQbkx87ptF/IO8IF48Xh7hAQkIAEJSEACEqhFYKwCC3HFdGCZuCpwGfa3Ye9sPnxtPJLfJAEJSEACEpCABKoQGKvAyjcQZYd21lUhrNLaqnk85ypCklcLVulKFiIBCUhAAhKQQCIwVoFF+9LU4IfXuFuB5XdAAhKQgAQkIIHOCIxZYG2Ddn18+KImwyvj8cWdEbZgCUhAAhKQgAQmR2CqAusl4elXNN5+dTy+cHKet8ESkIAEJCABCXRGYKoC6yyIvqyh6hqszrqXBUtAAhKQgASmSUCBdenSC8L1LIKfamKvsCeGsWZtnkHggoD7h/1Z2JfClmFsxrpuTdtU2dluCUhAAhKQwFoCUxVYCKprGiJTjGClDVifEQyeFHbPPb4fq0Zssb2FYmsPcGaVgAQkIIHpEJiqwDoPF7MJKelZYbyeQkJYsT/YolJjEViwYyd8by9UCarFSEACEpDA8AkosKazDxZTgDeGzTZ027QJa4pKIcYeGPYdTX6Oxx624fhlJraG/82wBRKQgAQkIIEjCExVYJ0FsyktckcY/WnYFUVfYRPWm8L2WYOGQGMjV4y1W2UiknUexhTi6oi+6aESkIAEJCCBwRJQYF0WAmO+VQ6CiF3reUyJaBVtPlYAIdyeF/bksHWRrbN4nzVuJglIQAISkMCkCExVYJW30pmP2OvLaFseafpgvH5cB+1NUa20ti2dAhH31DAXxHcA3SIlIAEJSKCfBKYqsFhf9NnMJQ+I52NcpL2Idr05a+fN8Rwx2WVbYcuUYym0iJgRLTRJQAISkIAERk9gqgILxxJRuarxMBEW1iKNLeVtpG2Pbdp9inYyfYjQyqNnfxGvf/GEdThFOz2HBCQgAQlI4C4EpiywFkEjRXf6sg6L6A+iD3FC+u6wbwnj/TItG6FyywbBMov3P54dxFYKtPnU6SxOmC4oSOfmPddmndoTnk8CEpCABE5GYMoCK58m/GIQv/fJqN/5RIgpNj2dhyGKDkmrOGgZ9rEwrhbk6sDnhL0hK4wNRclzEelH4qS/H3bf7ORE14gcUneTBCQgAQlIYFQEpiywcCTTglc3Hj3lhqOIO857FjbrqEfdFuVyqxvSf4U9JKzLtVe7mkGb4Z1PGVIfRNZy18F+LgEJSEACEhgSgakLLKJHH2ocxiBPlKfLhMh4RdgzM/GTn4/IE/VAeBDhWTXPS2FEvWdhPM7D1u1HVbaDMlgTxXToRQot6pBuU5TqeEpx26V/LVsCEpCABCRwO4GpCywY5AvBr2xETY3ugQBCUGEIIcTbz6wp+N/jPW6oTD24qfK2tCrqh/8QS5yDKc7vDPu+sB8Le+iGgohmvb0ph/I4lkfqcfcNx9S+yfMizpNf3chpx3qhwQ6X+rEEJCABCYyRgALr8oab3J+PxMLrsx2ORpDMwliMzmOyJKQuqp98OU68z02bD6knETZut8MjgvCY9JSmrFQGQhERemy5x9TJYyUgAQlIQAJVCCiwLkdw0p5Yn4rnP9eQTYKJhdn3CEvTcceC/58o4N/CHhzGFYCrlgWmaBiPZfrGeOMfw74axuesvUq+ZS0W06C04eFhD8oOJmJGfcj/32H3alkXsiGEzsOO2dtKkbUHcLNKQAISkMBwCExVYM3CRaxbQjRhPxT29RXcxkaeCJzytjFfiPfeHfZrYR+pcJ5dRfxflqGMypWiBqFE5GjduqwkMufxOcelfcPy83PcMQvVF3F8Pl1Ifby6cJeHd3+eIq2rDb7dXYI5JCABCUjgYAJTEliIBK7c4xFRdUhKa5EYtDDEAAJjGTYLY/qsLBuBc97kP+SchxzzyTiICBnp9WHcLzBPPxwv2Dbhfs2bbafnaBtCaxGWi0iOZ6H6TYdUNo65NixN01LEJ8IQc+tE34GnGP1hCCp2z8c/rMO7T1j6fuMXIo3L0VOwgRKQgAR6QmCsAovBhgF6HsaU3yMP4J2u6PunOPbPwxBTm9LL44OXFh/WuqHyAVW/9A9xEAveSSyg/4E1hSCWGHCZXiQhZtjpfdXyhAzk59nxX4nn37+D07aib4gP86sLt0XWWlZxEtnwIxu54o9dif3eiKC+NazGOrpd5/NzCUhAApMlMCaBlf7BL8Kb+0aomNojpSmwNovdyc95iLzMsx7EuirqsLzAXnUe5073AkSoIJzWJer9nuyDVZO3beRo3fFciXlo+ss48FHZwbSDyJjprgTo7wgron+HpmXDF7+bJCABCUigIoGxCCwGGQYbBp02CRHE4MLUCY8IillYurUMA84uoXDWnDM/3+viBeus2gqUNnU9JE9Zt21+XsQJ8jVQMGENVNv0gcj4uCzzC+I50ahDEv5DEObTj8eUd0gdhnAMwh6fbfojQf9m240/CiOyVa4JzNv4+Xjx6jCisCYJSEACEqhEYAwC6zxYpGjNJixMX70v7C1hCIhNAigva9O+TLM4vlxrRQRsEbZtGrGSy1oVM49ceWRq1x5T5fTcrvx5JRBF6SpM3t8WMWtT+bLu+Aqxe9GitU3dT5GHfvZbYeWWHKwPxI/04VVREZg+P+zJYazNWpc4zmjhKTzoOSQggUkQGLrAInKVL47OnYboWTaGqGqTGIiSMOFYrq7LE58jrvJIWdvpxDbnr5knv5JwXVvyc5WRo1V8uCuClx9/Hi9ykcuxlHFoKgVfXxkf2r5Djys5p3JY77cIayNCZ01evjtp/V0qx2jhoZ7xOAlIQAIFgaELrFxE0LRt/+LbOp8ITFqLxdqlFJViAEPMJXHFuZh+WbYt+MT5ysF41+BJ+/KpQqIZlNEmwQHhmRLC9Bgus4Z7EgCreI0v2giINvUdYp51fyb+NxrCTb3b+ilvN9OLfxD2bQWMB0yc8xD7hnWWgAR6SGDIAmsePPNpMDbKfHwzMB+DOhcLRAZ4XQ5uRMc4f58H/FKkIAip87ZpTIRMWq/D87ZRrNIX+4izTb4qo1g1yjymX1zkseU0LHWpMS1NuUR383tZGi28SE97bglIYDQEhiyw+AeebtSMQ9hKgW0CaqQ8isUAhMhKiXVcixonOUEZ1LPcxJPo0iZhWOZvG4maR5m52K0xSM+izHTRAahWYW0F3wnQnvQUvxtne3p2xpoCv+T8mTjPt560dZ5MAhKQwAgJDFlgpUG3iyvOyimv5Ho2aySaNaT0e1HZp2UVPo/nmxYzl2uxEJdtrigsB+n3x3FsZnpsKq9QzKdsjy17SMdzC6f8Fke1OfDn5HszILXLHxJr6yoBCUigCoGhC6xSCBGZIeqybRqsDTgEA3sycR/ClHatYWpT7kXkWTcNtG267SwqyZYXKbUdbLmnYbqy7dOFIDi03c+MA38nO3iIAvfQtqfjFvEkj0L+dbzO9wo7tnyOp2//xgj6eg0WliEBCUigCoGhCywglIKAGxj/YNihIoupR6a70mJ2zkFZmzbrrOKIjguhTcuw/KqxTdN/tHuV5d20E3xZ5XKT0FqLpfMLGd4bJ513zKpvxeOLPEq7zxYa+7QlP09ae7jP8eaVgAQkIIGMwBgEFs1hj6snZO0ikkWUhimufVIprojKpJtAt12PtM/5Tpl3n2jf9VGxF2WVaxPFOo/8+VYNtXjhyyQMb4nns1NCu+BzlT7rsv35RQWIramud7tgl3t6CUhgLATGIrCIuvxLJoaSf87iCQuu2yQGbiJXaQDnqrsfDWM3bAb4MQw68Min/zZNqT468rGQOqU2U3Nl2bUEFtxTBKdLgdGmj5w6D38QuEF5Sl1eSZn7j35BBNIkAQlIQAIHEhiLwKL5i7B8rUpCch5PNi3qTnkQaB8Me3jzRr6lQR5FGOo6rLx7wCOPNG2K9uWD+yqO2RXRYPF/vulrLVafjHIf3DSA5w85sK8P8bA8ekf9u/y+nkX5SXxPcSp2iP3DOktAAj0m0OUP9kU0e5PI2hWBKSMFZfQlfY7Q4DMeh5zy6aDUDgQSnFLKB9w2g/s8MuVbNbw+Xj+vAiTE7v2bcnier42rUHyvizjl+rN8KwgFVq+7hZWTgASGQGBsAgvmizAERHkbkE3TK6WQeGEcy81v85Qv/EZstdm6oO/+X8fpVVHpX2kqvq/A4jAuMLhXc3ytq93K3frH2Gc39ZW87R+LTI/ssFN9NMp+RFN+LXHcYXUtWgISkEC/CYx1sGKxOv/CU+QDLzDdwmLtVeYS8uWblW6LdOVTYG0Wfffb85drR/sRo/lO3st4jYCkvfl6rTZ95Z1xzE83Da+xjgdhm99ImqLb1GMI7NvUkVvh3L3JyJ0Krmhz0IF5+F6ktW5j6d8Hoqh+GP34mqbUtmtCq1fCAiUggdMSGPNgVV6BBVnEA1N8KfE6iQsWUCM4EAabUpoqLMs5rdfqn+1NUeSzs2IZbP8w7Jey99r0lbPIn4uyYxe6l+u6prZ9wCeC50MzH9Ta+qLsQbnfpnYhQf1v011LzJcgdHmhwina4jkkIIGWBNoMmi2L6mW2coCmkmnxdRm9avPDxzH8WPJPn1uXvK2XrT6sUvOmbeXUKqW1XZNDGfk6rLfE68Vh1bl9rdW/ht0jO76Njw48XS8PK9cGdrEHVi6ugNDFOXoJ9wSV4veCC294TImLRVYnOLenkIAELpjA2AUWeJdh+RQYESp+5M7D0iXwt8XzdcJinXsW8eYbwr4QNrYF17NoE4P6VUXD/zhes2VFmwTfnOWhAzb+ya92vDVef3ubCowoT/kHgb6cR2CPbWoZuZyagD2W36bj+R4RyeW3IiUig0TVP9zVSS1XAhLoF4EpCCx+7PhRywd9IivzsLTmZN9ICwMdom3X1Yn98nb72pSRE8QNa6vaDA6lKFjFcYisNsemGuKbPBLG+88Ne2P7Jowi57o1aOfRMoTQMYlyb2y+A6mcQ4XwMfUY27H0W9ZaIaTyxO8L34ttyw/GxsL2SGDyBKYgsHDyuqnC3Pn7/nOfxcEfb34wORZBMqa0bmCnfWdhbRbplrfNQVwReWkzwHBuLjyAcUptpyjH5IPUlhviSVognd57ZTx58YGNXcRx7FeWoq//HM8Rzx85sLypHwZHIq2/HJauwkxMWDOI/5ZTh2T7JTBFAlMRWPiWQb6c+ko+P2QxdhJtqyiEq67aiIeh9DEG4bRpK1eyfV1Wcdp7Fsa/8k1p1vDOo4ZtRBaDFZGrxxQFH+KfobBuU891fXefPwVJBNBn8U1KiGV8adqPAAxZXrBY01fZqw1RdR622q9Yc0tAAmMiMCWBxaCdb8mQ+/HQ6ZE08C2jsJprYy66j+UD+q9GZR4UVkZRaDMXDGya+mOahGmoPCFCz8LyDU3T5/iH/LPimH2nby+aXRfnhwlR0vIPwi6RBVOiK/gi50pEED/gQ9NuAnBkScA8jOdlH6UEmCKsxhbN3k3HHBKQwFoCUxJYAEhRpxLGoQKLH1oEBpGasazHWkRbUvSKf+O0EWHE4HLWDDQ5Pzao5ObQ6yJaeVkl8zR1kkQX5Zfp5ua8Y4oOHvpTxMD+J2HfUBSwbPpePrDD8iVhP1HkxUdw3ySKD63b2I6DNWKW/ruuX6b20j/hDlP76Nh6ge2RwJEEpiawwHUWlu/VxHvHbKzIj3ASJPzQEtUZamIqKZ+iS1ta5O1h8IFhfhNiPl82Aw3/5PPBJuezDxcGLyIvq30OGnle2MN53RWvXNX67rBHhV3ZcGBz0k81fjkv/DJyVHs1bxa5iVDR37BNKQkq+iR+sG/uhdnMEpgWgSkKLDw8D/vNsAeGsWA4v0nxIT1gEQclkcVAhjAZ4j/al0e9X9oAYDBhQN+UEGNnYc8Ju0+WiUEHBkRLeE6iHMRnvl3GNs4sDobpEBlua1eNz7aJrLz8z8QLNovlJuZErPCnPC8Tou+mKT8E1axwzFfiNYIVbkSoeFzWcJ5lSEAC0yEwVYHVhYcRBElk8WM8tDVZDDJ/FZbEUttpUwYr2n5tWNr2IvGFA8IKwUT62bCfD0u30yn9gChgO4Z8uqsLXw29THzF/TKftmdDmPJ9X9jfhSG28M8tYas9yxla9jTlx+M8bN0fB9gkIXU+ASZD86H1lcDgCCiw6rqMf8P8ODOFw6CFyBrK4EW908aeDLyHCETafxZWLsZmMEc0US5TiIiyNNDNGkZ8rrDa3h8RBkReFmG5SPhyvP5qWLrR9vZS1n+KuMBPPNJneUyi45DyLuIY+hX9CaGfiyneX5fSlN8yPsRMEpCABKoRUGBVQ/m1gubxDKGAyPp8GDugM1j1OVHnfGPPY7dFYHBbhJVXHiYGq2ZAY1BDcPHadFcCs3grRV8Qr2XkhcjgedPfOJo8+DIJsVpM8Q9GP2Zd1980r/n9SJ/VOteucmgb3y0eEU48Jk67jkVQLZt28EjdTRKQgAQ6IaDA6gTr7T/4bNx4v6b4YwVLN7W8o1QGmjS9h+CZVzohAyCDPlYuis9PkSJc74o3P9YMgJWqMKhi4EWEKkVfHhfP7521gIjSMuy8eYTbtpQECHl4/j1h92/KT0KlJiD6EUZKEbHSzymalOrO6/uG/WeTcVY8prqX4nJTvb8YH3y6qQesUp3W1adm2y1LAhKQwJ0IKLC66xAMHPyoJ+FybTxft/9TdzVoV/JZZMuvquxSDM7jXBiDJVau2cprzOAIP2ysUa4kqHIuOQN2Wf/7MFgka+fV9rlSJIg6lIJsFu+VVywyHXnP9sV3njOJTvpJ6jO7hGfnlfIEEpCABBRY3fcBfvjTmqQb4nmftnEgspRvBsqVf4vukXztDAzgSWz9eDx/eBibmq5LDJpJcK2a50O6Mi4JytTe1Pa8rflCa8QC1reECMOof/6Yi7MuomPJ1ykSBRv6AWaSgAQk0DsCCqzTuITBIG1RcFM8f1bYRf/LZhBk3RUDIynfVPQ0VNafJQ3U8/gYazNY5wNtGoDhi/HZZ8Nua17X5j5rGKZ1QbSK99L7KUK0iSnRuRR9WfagX9T2fS68NpXN7ZhYr0je3G+162J5EpCABE5GQIF1GtQMHESv0lV6DKiILB4vIjH4I654TKnLqcFj25iiPvOmzm3300rnzae1ksBKA3n+epM/4JQiN5SZv/5SvL6iZQPTVOcq8i8ba3mo2SQgAQlIYEgEFFin9RYiK7+yjtfXhdWOqmxrFUKhvKEyYu/8tCiOPhvtyIUOIoyUhFCKzPHIhrJsHrnpZt/HVIZF+eyWTlo1lkdheC+9PuY8HisBCUhAAgMioMA6vbMWcUqEVVo8zACMyDo/QVUQG+8P+67sXJz77ATn7tMpZlGZXIil19vqiEhKES58RkqPfWqbdZGABCQggR4QUGBdjBMY0BFU+VTXJ+L1r4ex0LyrdFMUnG+XMJYbVHfFy3IlIAEJSEACBxFQYB2ErdpB8yiJaFY+dYUIQvgsq53lcrSG+y0usjLfGs+fUfEcFiUBCUhAAhKQQENAgdWPrsBNltm+gQ0XU0JgMX13rNBCVLHP1Swr+9TbMfSDsrWQgAQkIAEJnIiAAutEoFuchijTWRiCKN/cEYF1HrbPZpuPjvzPC/upQlhRDacFWzjDLBKQgAQkIIFjCCiwjqHXzbFcDYfQWndrmbTQ+tb4/ANhq7D8CkSORaClK+ryGrLP1bWNWOum5pYqAQlIQAISkMDtBBRY/e0I24TWPrVmB2zWebG265TbQexTR/NKQAISkIAERkVAgdV/dzJ1OG8M0dVmk81bIh/bMbwqLG0t0P+WWkMJSEACEpDASAgosIbpSITWLCzfXJOWEKEiUqWoGqZfrbUEJCABCYyEgAJrJI60GRKQgAQkIFh+J7kAAALESURBVAEJ9IeAAqs/vrAmEpCABCQgAQmMhIACaySOtBkSkIAEJCABCfSHgAKrP76wJhKQgAQkIAEJjISAAmskjrQZEpCABCQgAQn0h4ACqz++sCYSkIAEJCABCYyEgAJrJI60GRKQgAQkIAEJ9IeAAqs/vrAmEpCABCQgAQmMhIACaySOtBkSkIAEJCABCfSHgAKrP76wJhKQgAQkIAEJjISAAmskjrQZEpCABCQgAQn0h4ACqz++sCYSkIAEJCABCYyEgAJrJI60GRKQgAQkIAEJ9IeAAqs/vrAmEpCABCQgAQmMhIACaySOtBkSkIAEJCABCfSHgAKrP76wJhKQgAQkIAEJjISAAmskjrQZEpCABCQgAQn0h4ACqz++sCYSkIAEJCABCYyEgAJrJI60GRKQgAQkIAEJ9IeAAqs/vrAmEpCABCQgAQmMhIACaySOtBkSkIAEJCABCfSHgAKrP76wJhKQgAQkIAEJjISAAmskjrQZEpCABCQgAQn0h4ACqz++sCYSkIAEJCABCYyEgAJrJI60GRKQgAQkIAEJ9IeAAqs/vrAmEpCABCQgAQmMhIACaySOtBkSkIAEJCABCfSHgAKrP76wJhKQgAQkIAEJjISAAmskjrQZEpCABCQgAQn0h4ACqz++sCYSkIAEJCABCYyEgAJrJI60GRKQgAQkIAEJ9IeAAqs/vrAmEpCABCQgAQmMhIACaySOtBkSkIAEJCABCfSHgAKrP76wJhKQgAQkIAEJjISAAmskjrQZEpCABCQgAQn0h4ACqz++sCYSkIAEJCABCYyEgAJrJI60GRKQgAQkIAEJ9IeAAqs/vrAmEpCABCQgAQmMhIACaySOtBkSkIAEJCABCfSHgAKrP76wJhKQgAQkIAEJjISAAmskjrQZEpCABCQgAQn0h4ACqz++sCYSkIAEJCABCYyEwP8Dq4PEBWY3GNYAAAAASUVORK5CYII=');
INSERT INTO public.signeddocuments VALUES (2, 12, 'text text text', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAlgAAADICAYAAAA0n5+2AAAb/klEQVR4Xu3dbag9W10H8Cua5UOa0RtJ9GgGET4kBQVSnggqtPBKUFKRR98oiHgFySjQI0IYRj4QkvTCc8GyQNArKkGE51qvrNASK0jzlAZGYiWJYcXt981ZOM49//9/n3Nm9jzsz8Bi77PP3uvhs2b2/PasNTMPuctCgAABAgQIECAwqsBDRs1NZgQIECBAgAABAncJsKwEBAgQIECAAIGRBQRYI4PKjgABAgQIECAgwLIOECBAgAABAgRGFhBgjQwqOwIECBAgQICAAMs6QIAAAQIECBAYWUCANTKo7AgQIECAAAECAizrAAECBAgQIEBgZAEB1sigsiNAgAABAgQICLCsAwQIECBAgACBkQUEWCODyo4AAQIECBAgIMCyDhAgQIAAAQIERhYQYI0MKjsCBAgQIECAgADLOkCAAAECBAgQGFlAgDUyqOwIECBAgAABAgIs6wABAgQIECBAYGQBAdbIoLIjQIAAAQIECAiwrAMECBAgQIAAgZEFBFgjg8qOAAECBAgQICDAsg4QIECAAAECBEYWEGCNDCo7AgQIECBAgIAAyzpAgAABAgQIEBhZQIA1MqjsCBAgQIAAAQICLOsAAQIECBAgQGBkAQHWyKCyI0CAAAECBAgIsKwDBAgQIECAAIGRBQRYI4PKjgABAgQIECAgwLIOECBAgAABAgRGFhBgjQwqOwIECBAgQICAAMs6QIAAAQIECBAYWUCANTKo7AgQIECAAAECAizrAAECBAgQIEBgZAEB1sigsiNAgAABAgQICLCsAwQIECBAgACBkQUEWCODyo4AAQIECBAgIMCyDhAgQIAAAQIERhYQYI0MKjsCBAgQIECAgADLOkCAAAECBAgQGFlAgDUyqOwIECBAgAABAgIs6wABAgQIECBAYGQBAdbIoLIjQIAAAQIECAiwrAMECBAgQIAAgZEFBFgjg8qOAAECBAgQICDAsg4QIECAAAECBEYWEGCNDCo7AgQIECBAgIAAyzpAgAABAgQIEBhZQIA1MqjsCBAgQIAAAQICLOsAAQIECBAgQGBkAQHWyKCyI0CAAAECBAgIsKwDBAgQIECAAIGRBQRYI4PKjgABAgQIECAgwLIOECBAgAABAgRGFhBgjQwqOwIECBAgQICAAMs6QIAAAQIECBAYWUCANTKo7AgQIECAAAECAizrAAECBAgQIEBgZAEB1sigsiNAgAABAgQICLCsAwQIECBAgACBkQUEWCODyo4AAQIECBAgIMCafx24p6rwQKW3zl8VNSBAgAABAgTGEBBgjaF4/TzeUh99ZffxV9Vj/rYQIECAAAECKxcQYM3XgSdV9Dt7xb+gnr9vvuoomQABAgQIEBhLQIA1luTV8jmtt7+u95HX1/O8ZiFAgAABAgQ2ICDA2m8nflsV95FKT+8Ve389P95vNZRGgAABAgQITCkgwJpS9xvzTnD1iUpPGBT55Pr7Yn/VUBIBAgQIECAwtYAAa2rhr+d/Vk9fNCjuo/X3D+6vCkoiQIAAAQIE9iEgwNqH8l133V3FvPeSon66XvvAfqqgFAIECBAgQGBfAgKs6aUzNPiZSnnsL/fWHyfTF68EAgQIECBAYN8CAqzpxc+qiOHQ4H/Ua0eV/n364pVAgAABAgQI7FtAgDWt+PdV9h+7pIgfrdfOpy1a7gQIECBAgMBcAgKsaeVz4dDnD4pwzatpzeVOgAABAgRmFxBgTdcFlx29uq+Ky4R3CwECBAgQILBhAQHWNJ2bCe0ZGjzqZf9X9fy4knlX05jLlQABAgQILEZAgDV+VyS4yiUZEky15bP15BmCq/Gx5UiAAAECBJYoIMAav1fOKsv+WYP/WH9nuNCRq/Gt5UiAAAECBBYpsOQA654Se6DSWxcpd3mlUuc39/6VyzEcV/r4itqgqgQIECBAgMANBZYaYPUDlVdVG99yw3bu4+MnVcg7BwW9uP4+20fhyiBAgAABAgSWI7DUAKt/a5kMrT2r0sVy2B5Uk+N6JfOu+ldrX0tguGBWVSNAgAABAusUWGqAFc3+NaSWfFuZo6przhjsB1dLru8619Sr1Tp98qRKeUzK0n/e5sPlsaUn1vN/6r03T1uf9vs277/oPjesVcvrX+sfX+4+n8/m9ZQ/vF1SK6PVsb23ldHyb3/nlktf6l5MHSwECBAgsFCBJQdY2dn8W89tiVc/Tx0/XCmT2NsiuJp+ZU9A8pxKx13gEv+HdumR0xc/Wwn/XSV/U6/0foDYgrAEXi3l0iBOrpituxRMgMAhCyw5wEq/ZO7VK7sOOq/HBFlLWs6qMv0zBu/vdvpLquNW6pJgNtbHlTKEvOTlq1W5h9+hgjm79OIKjUj7v73SYyo99gqfS4CVbefjXUrQdZVyr1CUtxIgQIBAE1h6gHVUFc2wSFuWNK/ppCrVn9SeHVf/SJa1bDyBn6qs3l3p0TfIMmd0JsjI0o72pL9yJCzL71f63d7/2/take1IUBvGa8N9wyNE+zpilG0jSx5bSp3a82fexuqis4jHn1T6XKW8ZiFAgACBkQSWHmClmWeV2lGi7LxyFKvtKEdiuHI22YllaDCPWVyl/cqEO3/gtN75uh3f/YV633sq/Uul8+4z7fGyLPp5b/EekQkgs47msaXMTesvGXbMfLEs7ShXzBzp2nGl8zYCBAhcJrCGACs7hkwib8tFPclZhfs6UnCZ2x/Viz/R/SNHRo5mrs8W1+57qlEZHo7t7ZYEAmeV3lcp68ZVltN6cwvethhgXWaRo1z9gOtp9fd3VBoGXu2zcU3gdV4pQ+AWAgQIENhBYA0BVpqRL/nn99qTs70yBDJHkJUdf7uY6Ffq+fdWutjB2lt2F+gbX/apBFVZJ85uaJ/Pt6Ojh35yQoKu40p5TBCW55fN9Yr7eaU1XQB49zXPOwkQIDCSwFoCrHzZZ0iuv3yq/vjukRx2zWZ4NO1H6oN/uuuHvW9ngbvrnbmuWJYcNWlHUb5Yz3OZgoudc7r9Gz9R/84RnCx5nvtFWr4ucFxPk7Le93/gtHec15Nsl++vNPewvX4jQIDAogTWEmAF7c8qPXugl1/ROdqxr+WiCmpDKUuacL+v9u+znOzUs0y5486tmPrLmraHffZFKyuBb9Jxbzto/8vR5LNK55Xum6NyyiRAgMCSBNa0Q/nhgvvIJXgvqNdyhGPqpT9M6XIMU2tPn3+ChOFR0SVea216ieuVEL+frPRLlR5/SRbZXvIDKAGXhQABAgcnsKYAK51zVql/3am8ll/OU99Kpz9kZVL7NjYTAdZ4/XhUWZ1UynYyvDzERb12Wilz3CwECBA4GIG1BViZfHt+yZd4XpvqIqTZefRvhbOvI2YHsxLO1FAB1jTw2V4ybJ+Aqz9J/p/r7zdVMjl+Gne5EiCwMIG1BVjhy9ycBFTDM5ymmo/VHxqcqoyFrRYHUR0B1vTdfNoFW/1tNXPqMn8x27CFAAECmxVYY4CVzjip1L+KeuugF9eTsxF7qz80mFubJLib49IQIzZJVp2AAGs/q0KOOr+x0ksHxb2lC7T2UwulECBAYM8Caw2wwpRA6rL5WGNd6T07htymJ49ZDA3ueeWcuLijrn/7xZjkPh16vBNU9S/3cN5tV360TOcuZwIEZhJYc4AVsv7wXSPMEER2lDf90s7OoN1oOqed52iWZVsCw8s0CLCm79+TKqJ/9DnXH8v15G66vU5fcyUQIEDgCgJrD7BuNen9rAwyXHjdJUOB7fY8zhq8ruLyPzcMsJ5cVb5YfrVXX8NMgm93Q0hj8qMoR4jZr75rNYAAgSaw9gAr7bhVkHWT+Vjnle9zOiRDg9vdXv6imvb9veZtYXtYS2/9dlX05b3KJrjKEURB1lp6UD0JELitwFZ2KAmyzir153dkyOE687H6v64NDW57A/p0Ne8pXRM/W49P3HZzF9e6bLP9eZQJrua+kfvikFSIAIF1CmwlwGr6wy/sv6l/5PY6u87v6A8N5obCx1f47DrXgMOu9Xk1vx2pPPSbPc+1Jgy32cyrzFFjCwECBFYtsLUAK50x/MLO37vOx2qT5jPvKsFV5oZYtisgwFpG3w5PVnET9WX0i1oQIHADgS0GWOF4W6VX9Fx2ueZOLn74W91nbjJ/6wbd4aN7FuhPcn99lX265/IV9zWBo0p/X+lhHYiheWsGAQKrF9hqgJWOyc7ydb0eul3QlC/4XPMqS04hf8nqe1YDdhEQYO2itJ/3vKeK+ZleUc7o3I+7UggQmEhgywFWyPrXssrftwqyLup/T6rkau0TrWgLzLYfVKd6roE1byf15z/ebludt5ZKJ0CAwI4CWw+wwnBeqU1kzmT3TKDNa23pB2E5g8m8qx1XnpW/7bjq/+FeGwRY83eoI4rz94EaECAwksAhBFjD62T1L9+Qq7O/t7PMHKwEW5bDEBgGWIewLSy9ZwVYS+8h9SNAYGeBQ9mpDIOsixLKRQ4/2EndX4/Z4VoOR+C0mtrm6GVo+Ohwmr7YlvYDrHdULV+22JqqGAECBO4gcCgBVhgyx+O80mM7k6/U4yMquRXOYW4m/QBLgL2MdeBzVY3v7KryyXp82jKqpRYECBC4usAhBViXBVl5za1wrr7ebOETb6xGvKZryLvr8ee30KiVt+Gs6t+u7J6h/MetvD2qT4DAAQscWoCVrn5TpVf3+jxf6rteiPSAV5XNNf13qkUv7Vr1h/X4ws21cH0NGt4E2kkn6+tDNSZAoBM4tAArw4Q5cyxzsv630kM7B0HW4W0Sp9XkNgfLRUaX0f/DSzXol2X0i1oQIHANgUMKsBJUfazSUaVMav61Su/qmfkyv8YKtOKPCLCW2Xlfrmo9sqta7geaoMtCgACB1QkcUoB1Xr3TrofVhh6GE99dqmF1q/C1K3xWn2zzfQTX12Yc/YNfrBzb3KvP1/PHj16CDAkQILAHgUMJsPoXEx1ezX0YZJn0vocVbwFF9G8wLMBaQId0Vej/EHJ253L6RU0IELiiwCEEWMdl0q7YfW89P7nEaBhkPa/e86ErWnr7ugT6O3IB1nL6rn8tLAHWcvpFTQgQuKLA1gOszLvKTZzzeKcv66N6z19X+tbO0K1TrrgyreztjmAtr8OGk9xv9YNoeTVXIwIECAwEthxgJajKbXCOK2VSe768c22d2y35TO5FmBs/ZxFkbXeTOaummYO1rP79g6rOz/WqNBzOX1Zt1YYAAQK3EdhygHVa7c5p+LlSe4Ksq9zEOe99ZudmTtY2N6G2fqR1hgiX0cefqmp8V1eVXEblqZUullE1tSBAgMDVBLYaYD23GNp9Bq/7Kzhf7O1IliDrauvVGt4twFpWLx1VdTKc35Y/ric/vqwqqg0BAgR2F9hqgJWjVrnP4Nsr5erQ11mGN4i+bqB2nbJ9ZnoBAdb0xlcp4aTe/M7eB1wy5Sp63kuAwOIEthhgteG9MS5SOAyyfOkvbhW+doX6t2XRr9dmHO2DZ5VTmxOXTN0mZzRaGREgMIfA1gKsdr2rHMHKpPaLEVCHQVZ2BDmaZVm3wGlVv90qR4A1f19mW21D8tl+s91ZCBAgsFqBLQVYd1cv5KzBLGOf/Zcv+5zW364EnyArO+U7nZW42hXjACqeG37nxt9ZXl4pw8mWeQSGl2e4r6qR7dlCgACB1QpsJcDqf0FPeUZYAqs2jJGhyARygqx1rv5TBuTrFJmv1v3tKrUY+wfSfC1TMgECByuwhQArR5faTZz38cu3vzO46HYGebSsS+CkqtsmVTuBYb6+Gx69GmPu5HytUTIBAgQ6gS0EWO2K3LteTHSMzj+tTNr8nRzByi/uq1xna4w6yONmAv0Ayxysm1ne5NPn9eE29J58HL26iabPEiCwGIG1B1htUntA933WUX8HnSArR0ES7FnWIdDvvymHldehMU8t+2dypgbvqPSyeaqiVAIECIwrsOYAq7+DnGuIp1+H9IwLko67fk6Z23Fl3m4CLsCaUvryvPtz4PKOfR6B3n9rlUiAwMEJrDXAOqqeyryrzL+6t1ICnbmW4Y4iv8rfOldllLuzgABrZ6rR35jttX9R0RRgaHB0ZhkSIDCnwBoDrARVOfKQybGZEJsd5dxn8g2DrNdWnd4wZ8cq+44CAqw7Ek3yhv6wfivAHLhJqGVKgMCcAmsMsKa4mOgYfZAd9gcqParL7LQeM/RkWaaAAGu//XJUxb2/0tMHxQqu9tsPSiNAYE8CawuwTsqlDS0scUjhGVW/HFVrS4LB7EAsyxMQYO2vT3KE982VEmS1JVdrz/bsxJD99YOSCBDYo8CaAqx8OX+ms8kcp8x1WuIyvK6PIGuJvfS1oWWT3Kftmwzn53Imw231z+u1n610MW3xcidAgMB8AmsJsPJFndvgZKe4hgsRJsg6r/TYrmvP6tH9C+dbzy8rWYA1bX9kG8jR5jz2F2dsTusudwIEFiKwlgCrzbvKqdzZMV4sxO921RBkLbuT+gGWeUDj9dWtjlplSDBDhfnhYSFAgMDmBdYQYD23euGDXU8scd7VVYKsJQ9tbn5lHzSwH2A5qnLz3j+qLHKfzgwHJsjqL/d3wdXcZ/vevJVyIECAwI4Cawiw8sv3EZV+vdLpju1a0tuGR7LszJfRO79Q1XhXV5VfrMffW0a1VleLBFPZNl9S6ZsHtc+2m202R6AtBAgQOCiBpQdYH6/eeGalNcy7ut2Kc1z/zNlSbU7WXFeeP6iV+w6N7V+7bG1HRpfQj1mnc8Tq5JLKJLBKUJXkqNUSeksdCBDYu8CSA6z88s0ZSPmyzlGgi73rjFvg8EiWIGtc36vm1tavfE6AtZtejlY9v1KGAYeT15PDJyv9ZqX8mBBY7WbqXQQIbFRgqQHWcXnnrMF8oW8pEMlRk7NKjmTNv0EJsHbvg6y3CazyOJxflVxyu6ocrcoRZwsBAgQIlMASA6x8gec+g0fdF/fJxnqqPzSVpm0pgFxTV7UzU1PnZwkOvqHrsu0dd0FVHi8LqnJk+awLrC7W1PHqSoAAgX0ILDHAyvBCfi3nkgwZhtjiUMPwSNYLqp1pt2V/AudV1HO64pa4HexP4ms/ZhJIPbvSU7vntyo/2+Vpt75ucdvcp7uyCBDYsMDSdiz9oztbDzqyQ+tPfN96e5e2GbUTKFKvpW0HU1olmMqJIy2oyo+YPL/dkpNMsq4mGQacsnfkTYDAZgSWtGPJMERuhZPHQ7mUwXDi+/Oq7R/azNq17IY80FVv7Weo3ko561bm+h13b8hjXrtsuK/l8ZV6clHpo10glWDqfNndqHYECBBYpsCSAqyzIspp3xmCOFom1yS1Sls/UenRXe6OZE3C/KBMW4CVi2C2IGQ/Jd+slDZs/oTK5se6rLIOJSV4ao+7lJJ5VC2IOu+eG/bbRc57CBAgcAeBpQRY/aHBQzxlPjvGi0qHfHZhDN7cBQjZ2d/X7fCn2IgTpOREiiw5A+5k5EIS5GR5TKXHVcp2lr7N67c6gpT/JbgZvifv76frVjVH6i460wRVSfnbQoAAAQITCCwhwOoPDR7yrWTikJ3ek7p+Pq3HDJUeynJPNTQB1nD5z3rh7yo9rFICoywJDL6l0t9WyhGoqwZjx/WZD3d5DYej2xGiBEdPrnRUqQVF7Xn7+05HjL5an334BB2YI09fqvTFSgnKhilFZl3K67FKshAgQIDAHgWWEGC9r9q79bMGd+3S7LDPK2UScpazSrmMwyEstwqwrtL22OW2SgmePl+pDXe1I0CPqte+XOmo0kmX8UU9tv9fpaw7vTdHjBIUfmFQj1t97rIgKe9tQVL7f+rb2nWnOvg/AQIECMwkMHeAddztDNP8QxwavKzbh0FWAtAEWVvfqabdb6l0d6U2VDrTZvH/dw/oHyFKPRLYJA2DnvZ3C4TmqrNyCRAgQGBBAnMGWNmhtguKHvLQ4K2CrARW7TpNGe7J5Pe2g1/QKjRJVTJMd1zpqNIPVfqfSp8atD+v58SAp1W6SUD2gfr8X1Y671rShtYmaZhMCRAgQOAwBOYMsM6KOGcNZiglO9OtH6G5zhrVjPLZ+CTIaoHAdfLb6meOqmEtfU89/69eQ1vA1B9iO63/5z6XWZy1udW1QrsIECAwo8BcAdYLq83v7trtNiW3XwEybPbK3lt43XyD6QdYhqZv7ikHAgQIEBgIzBVgZY5LJiP/cqUEEJbbC/QngOfMtgtgNxIQYN2Iz4cJECBA4E4CcwRY51WpzC3a6hW072R+3f9nXpKJ1NfV+8bPCbDGcZQLAQIECNxCYN8BliMxVsUlCPQDrJyhebaESqkDAQIECGxHYJ8BVo7AtKtnv6qeGxrcznq0tpb0Ayzr4tp6T30JECCwAoF9Blg5mysX0DQ0uIIVY+NVfGO17zVdG3+jHn9l4+3VPAIECBDYs8C+Aqz+EQNnwe25kxX3IIE31Suv7l59Qz2+lhEBAgQIEBhTYB8BVq7M/d6u0sP7vo3ZFnkR2FWgPxfQEOGuat5HgAABAjsLTB1g5Wrtn6mUR0ODO3eLN04scFr5twuNCvonxpY9AQIEDlFg6gDrvFBzSYZc9yqT3C8OEVmbFyfQD7AcwVpc96gQAQIE1i8wZYD1tuJ5RUdkJ7b+dWVLLXAEa0u9qS0ECBBYoMBYAVaGAHM7lxyhurc7WtUuyZAb6f7AAtuuSocrcF5NbzfSNkR4uOuBlhMgQGAygbECrP4O61ertrkFToIuQ4OTdZ2MbyDQX1/zg+DkBnn5KAECBAgQeJDAWAHWA72c/6GeP6X721WyrXRLFDirSr2oq5jh6yX2kDoRIEBg5QJTBFiN5P56crxyH9XfpkCOrrajVu4osM0+1ioCBAjMKjBlgPXkatnFrK1TOAECBAgQIEBgBoGpAiwTh2foTEUSIECAAAECyxAYK8A6q+a0OS2frudPXUbz1IIAAQIECBAgsH+BsQKs1Pyk0iMrvX3/zVAiAQIECBAgQGA5AmMGWMtplZoQIECAAAECBGYUEGDNiK9oAgQIECBAYJsCAqxt9qtWESBAgAABAjMKCLBmxFc0AQIECBAgsE0BAdY2+1WrCBAgQIAAgRkFBFgz4iuaAAECBAgQ2KaAAGub/apVBAgQIECAwIwCAqwZ8RVNgAABAgQIbFNAgLXNftUqAgQIECBAYEYBAdaM+IomQIAAAQIEtikgwNpmv2oVAQIECBAgMKOAAGtGfEUTIECAAAEC2xQQYG2zX7WKAAECBAgQmFFAgDUjvqIJECBAgACBbQoIsLbZr1pFgAABAgQIzCggwJoRX9EECBAgQIDANgUEWNvsV60iQIAAAQIEZhQQYM2Ir2gCBAgQIEBgmwICrG32q1YRIECAAAECMwoIsGbEVzQBAgQIECCwTQEB1jb7VasIECBAgACBGQUEWDPiK5oAAQIECBDYpoAAa5v9qlUECBAgQIDAjAICrBnxFU2AAAECBAhsU0CAtc1+1SoCBAgQIEBgRgEB1oz4iiZAgAABAgS2KSDA2ma/ahUBAgQIECAwo4AAa0Z8RRMgQIAAAQLbFBBgbbNftYoAAQIECBCYUUCANSO+ogkQIECAAIFtCgiwttmvWkWAAAECBAjMKPB/Ov999oyknLgAAAAASUVORK5CYII=');


--
-- Name: costs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.costs_id_seq', 1, false);


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.customers_id_seq', 3, true);


--
-- Name: customerservicesdevices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.customerservicesdevices_id_seq', 1, false);


--
-- Name: customertickets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.customertickets_id_seq', 6, true);


--
-- Name: devices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.devices_id_seq', 53, true);


--
-- Name: devicetypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.devicetypes_id_seq', 22, true);


--
-- Name: services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.services_id_seq', 1, false);


--
-- Name: signeddocuments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.signeddocuments_id_seq', 2, true);


--
-- Name: costs costs_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.costs
    ADD CONSTRAINT costs_pk PRIMARY KEY (id);


--
-- Name: customers customers_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pk PRIMARY KEY (id);


--
-- Name: customerservicesdevices customerservicesdevices_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customerservicesdevices
    ADD CONSTRAINT customerservicesdevices_pk PRIMARY KEY (id);


--
-- Name: customertickets customertickets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customertickets
    ADD CONSTRAINT customertickets_pkey PRIMARY KEY (id);


--
-- Name: devices devices_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_pk PRIMARY KEY (id);


--
-- Name: devicetypes devicetypes_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.devicetypes
    ADD CONSTRAINT devicetypes_pk PRIMARY KEY (id);


--
-- Name: services services_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pk PRIMARY KEY (id);


--
-- Name: signeddocuments signeddocuments_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.signeddocuments
    ADD CONSTRAINT signeddocuments_pk PRIMARY KEY (id);


--
-- Name: COSTS_services_types_INDEX; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "COSTS_services_types_INDEX" ON public.costs USING btree (service, servicedevicetype);


--
-- Name: devices_systemname_uindex; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX devices_systemname_uindex ON public.devices USING btree (systemname);


--
-- Name: devicetypes_name_uindex; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX devicetypes_name_uindex ON public.devicetypes USING btree (name);


--
-- Name: services_servicename_uindex; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX services_servicename_uindex ON public.services USING btree (servicename);


--
-- Name: costs COSTS_devices_device_FK; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.costs
    ADD CONSTRAINT "COSTS_devices_device_FK" FOREIGN KEY (device) REFERENCES public.devices(id);


--
-- Name: costs COSTS_devicetype_devicetype_FK; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.costs
    ADD CONSTRAINT "COSTS_devicetype_devicetype_FK" FOREIGN KEY (servicedevicetype) REFERENCES public.devicetypes(id);


--
-- Name: costs COSTS_services_service_FK; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.costs
    ADD CONSTRAINT "COSTS_services_service_FK" FOREIGN KEY (service) REFERENCES public.services(id) ON DELETE CASCADE;


--
-- Name: customerservicesdevices CUSTOMERSERVICESDEVICES_costs_cost_FK; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customerservicesdevices
    ADD CONSTRAINT "CUSTOMERSERVICESDEVICES_costs_cost_FK" FOREIGN KEY (cost) REFERENCES public.costs(id);


--
-- Name: customerservicesdevices CUSTOMERSERVICESDEVICES_customers_customer_FK; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customerservicesdevices
    ADD CONSTRAINT "CUSTOMERSERVICESDEVICES_customers_customer_FK" FOREIGN KEY (customer) REFERENCES public.customers(id);


--
-- Name: devices DEVICES_devicetypes_devicetype_FK; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT "DEVICES_devicetypes_devicetype_FK" FOREIGN KEY (devicetype) REFERENCES public.devicetypes(id);


--
-- Name: customertickets customertickets_customers_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customertickets
    ADD CONSTRAINT customertickets_customers_id_fk FOREIGN KEY (customer) REFERENCES public.customers(id);


--
-- PostgreSQL database dump complete
--

