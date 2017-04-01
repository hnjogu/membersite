--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.1
-- Dumped by pg_dump version 9.6.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: blog_comment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE blog_comment (
    id integer NOT NULL,
    author character varying(200) NOT NULL,
    text text NOT NULL,
    created_date timestamp with time zone NOT NULL,
    approved_comment boolean NOT NULL,
    post_id integer NOT NULL
);


ALTER TABLE blog_comment OWNER TO postgres;

--
-- Name: blog_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE blog_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE blog_comment_id_seq OWNER TO postgres;

--
-- Name: blog_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE blog_comment_id_seq OWNED BY blog_comment.id;


--
-- Name: blog_post; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE blog_post (
    id integer NOT NULL,
    title character varying(200) NOT NULL,
    text text NOT NULL,
    created_date timestamp with time zone NOT NULL,
    published_date timestamp with time zone,
    author_id integer NOT NULL
);


ALTER TABLE blog_post OWNER TO postgres;

--
-- Name: blog_post_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE blog_post_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE blog_post_id_seq OWNER TO postgres;

--
-- Name: blog_post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE blog_post_id_seq OWNED BY blog_post.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO postgres;

--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: blog_comment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_comment ALTER COLUMN id SET DEFAULT nextval('blog_comment_id_seq'::regclass);


--
-- Name: blog_post id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_post ALTER COLUMN id SET DEFAULT nextval('blog_post_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO auth_permission VALUES (1, 'Can add group', 1, 'add_group');
INSERT INTO auth_permission VALUES (2, 'Can change group', 1, 'change_group');
INSERT INTO auth_permission VALUES (3, 'Can delete group', 1, 'delete_group');
INSERT INTO auth_permission VALUES (4, 'Can add permission', 2, 'add_permission');
INSERT INTO auth_permission VALUES (5, 'Can change permission', 2, 'change_permission');
INSERT INTO auth_permission VALUES (6, 'Can delete permission', 2, 'delete_permission');
INSERT INTO auth_permission VALUES (7, 'Can add user', 3, 'add_user');
INSERT INTO auth_permission VALUES (8, 'Can change user', 3, 'change_user');
INSERT INTO auth_permission VALUES (9, 'Can delete user', 3, 'delete_user');
INSERT INTO auth_permission VALUES (10, 'Can add content type', 4, 'add_contenttype');
INSERT INTO auth_permission VALUES (11, 'Can change content type', 4, 'change_contenttype');
INSERT INTO auth_permission VALUES (12, 'Can delete content type', 4, 'delete_contenttype');
INSERT INTO auth_permission VALUES (13, 'Can add comment', 5, 'add_comment');
INSERT INTO auth_permission VALUES (14, 'Can change comment', 5, 'change_comment');
INSERT INTO auth_permission VALUES (15, 'Can delete comment', 5, 'delete_comment');
INSERT INTO auth_permission VALUES (16, 'Can add post', 6, 'add_post');
INSERT INTO auth_permission VALUES (17, 'Can change post', 6, 'change_post');
INSERT INTO auth_permission VALUES (18, 'Can delete post', 6, 'delete_post');
INSERT INTO auth_permission VALUES (19, 'Can add log entry', 7, 'add_logentry');
INSERT INTO auth_permission VALUES (20, 'Can change log entry', 7, 'change_logentry');
INSERT INTO auth_permission VALUES (21, 'Can delete log entry', 7, 'delete_logentry');
INSERT INTO auth_permission VALUES (22, 'Can add session', 8, 'add_session');
INSERT INTO auth_permission VALUES (23, 'Can change session', 8, 'change_session');
INSERT INTO auth_permission VALUES (24, 'Can delete session', 8, 'delete_session');


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_permission_id_seq', 24, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO auth_user VALUES (3, 'pbkdf2_sha256$30000$owNzVvLErwKs$OMwK/HyA0Kc9QH8NzO9fkiPJ4vENbauy2Vte3gQcxUA=', '2017-03-28 16:58:56.209+03', true, 'harrugg', 'harri', 'stars', 'harr@gmail.com', true, true, '2017-02-22 20:21:34.431+03');
INSERT INTO auth_user VALUES (12, 'pbkdf2_sha256$30000$QuWVKmTQ9N05$eueC2FYzhXFw34McTx+wokoNnnbGmUb01gDYzIFtG4g=', '2017-03-02 14:39:14.539+03', false, 'tim', 'tim', 'tim', 'tim@gmail.com', false, true, '2017-03-01 16:01:56+03');
INSERT INTO auth_user VALUES (4, 'pbkdf2_sha256$30000$E7ImGqSTMKi8$+yFUUSxmENDvAtnDkcL//Q2ZtStEMxC8cfNmoZgGFHg=', '2017-02-28 16:16:40.769+03', false, 'harr', '', '', '', false, true, '2017-02-28 15:31:12.832+03');
INSERT INTO auth_user VALUES (5, 'pbkdf2_sha256$30000$rQkigcxY9gS0$TbgHQapH0DwbsDYx93qyhfrxDmMqD5lAVufon+JvAyE=', NULL, false, 'daa', '', '', '', false, true, '2017-02-28 16:18:37.225+03');
INSERT INTO auth_user VALUES (15, 'pbkdf2_sha256$30000$CL4ljjAfF85e$WqKHFsJK+vUwXceYHFPMmJzy4KtgpKf+NPoRSEiOsiw=', NULL, false, 'test2', 'test2', 'test2', 'test2@gmail.com', false, true, '2017-03-01 17:10:33.465+03');
INSERT INTO auth_user VALUES (6, 'pbkdf2_sha256$30000$fKCqSi1hX1X0$6Uh0q+TdvAqNDqS48t9YtyFdubCIZowdqRmY/yRc5nE=', NULL, false, 'harri', '', '', '', false, true, '2017-03-01 13:55:31.98+03');
INSERT INTO auth_user VALUES (7, 'pbkdf2_sha256$30000$dzu2lVhNifsN$OlaCuELLVqra9yfpuP8Y7VfRjC+I6PIOBxHLW0WCALk=', NULL, false, 'dsa', '', '', '', false, true, '2017-03-01 14:01:36.626+03');
INSERT INTO auth_user VALUES (8, 'pbkdf2_sha256$30000$RHXgUVViMhI9$jkP9sw7MVestiUxftF9nmsubKuyjesumOjNWr2JK3Bw=', NULL, false, 'lamp', '', '', '', false, true, '2017-03-01 14:56:30.424+03');
INSERT INTO auth_user VALUES (9, 'pbkdf2_sha256$30000$2Ykv6o9154kl$WpEwIWtvZfoMxyq3WizrDh3bDsHEHp/S2uniifSDmPg=', NULL, false, 'xampp', '', '', '', false, true, '2017-03-01 15:03:30.114+03');
INSERT INTO auth_user VALUES (10, 'pbkdf2_sha256$30000$ZUa5dCxnbVdg$O+CsR5SSwEDneUh+3IrcC0SYoD4cq8EDraSM02w7jkA=', NULL, false, 'man', '', '', '', false, true, '2017-03-01 15:05:58.791+03');
INSERT INTO auth_user VALUES (11, 'pbkdf2_sha256$30000$0oIO9XMUSLH9$xUqhmpOpHkRW4sus+4cYLXer6PhGsFkcCYwG431muxQ=', NULL, false, 'wan', '', '', '', false, true, '2017-03-01 15:20:00.695+03');
INSERT INTO auth_user VALUES (13, 'pbkdf2_sha256$30000$6Y7lE4KFdS6M$TOxxzlfyAoT+MWYUA41TVokWx79KG4aWFvOycbCg584=', NULL, false, 'shiru', 'shiru', 'shiru', 'shiru@gmail.com', false, true, '2017-03-01 17:02:24.51+03');
INSERT INTO auth_user VALUES (14, 'pbkdf2_sha256$30000$XARwhvSnXLcj$c8N71mgwBCDizpAKQMBmi2sU8EK0KgdTG9cwv102yhY=', '2017-03-01 17:11:15.011+03', false, 'test1', 'test1', 'test1', 'test1@gmail.com', false, true, '2017-03-01 17:08:46.7+03');


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_id_seq', 15, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: blog_comment; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO blog_comment VALUES (1, 'harrugg', 'it''s cool', '2017-02-25 23:06:59.939+03', true, 1);


--
-- Name: blog_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('blog_comment_id_seq', 1, true);


--
-- Data for Name: blog_post; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO blog_post VALUES (1, 'welkam', 'welkam to the django forum system', '2017-02-25 23:06:14.654+03', '2017-02-27 12:42:47.071+03', 3);
INSERT INTO blog_post VALUES (2, 'test', 'test prove.com', '2017-02-27 12:33:26.124+03', '2017-02-27 12:42:57.681+03', 3);
INSERT INTO blog_post VALUES (3, 'good', 'i have tried', '2017-03-27 13:54:52.043+03', NULL, 3);


--
-- Name: blog_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('blog_post_id_seq', 3, true);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1, false);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO django_content_type VALUES (1, 'auth', 'group');
INSERT INTO django_content_type VALUES (2, 'auth', 'permission');
INSERT INTO django_content_type VALUES (3, 'auth', 'user');
INSERT INTO django_content_type VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO django_content_type VALUES (5, 'blog', 'comment');
INSERT INTO django_content_type VALUES (6, 'blog', 'post');
INSERT INTO django_content_type VALUES (7, 'admin', 'logentry');
INSERT INTO django_content_type VALUES (8, 'sessions', 'session');


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_content_type_id_seq', 8, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO django_migrations VALUES (1, 'contenttypes', '0001_initial', '2017-02-22 19:55:27.816+03');
INSERT INTO django_migrations VALUES (2, 'auth', '0001_initial', '2017-02-22 19:55:28.976+03');
INSERT INTO django_migrations VALUES (3, 'blog', '0001_initial', '2017-02-22 19:55:29.191+03');
INSERT INTO django_migrations VALUES (4, 'blog', '0002_comment', '2017-02-22 19:55:29.346+03');
INSERT INTO django_migrations VALUES (5, 'blog', '0003_auto_20170222_1938', '2017-02-22 19:55:29.551+03');
INSERT INTO django_migrations VALUES (6, 'admin', '0001_initial', '2017-02-22 20:20:03.877+03');
INSERT INTO django_migrations VALUES (7, 'admin', '0002_logentry_remove_auto_add', '2017-02-22 20:20:03.917+03');
INSERT INTO django_migrations VALUES (8, 'contenttypes', '0002_remove_content_type_name', '2017-02-22 20:20:04.112+03');
INSERT INTO django_migrations VALUES (9, 'auth', '0002_alter_permission_name_max_length', '2017-02-22 20:20:04.157+03');
INSERT INTO django_migrations VALUES (10, 'auth', '0003_alter_user_email_max_length', '2017-02-22 20:20:04.182+03');
INSERT INTO django_migrations VALUES (11, 'auth', '0004_alter_user_username_opts', '2017-02-22 20:20:04.217+03');
INSERT INTO django_migrations VALUES (12, 'auth', '0005_alter_user_last_login_null', '2017-02-22 20:20:04.272+03');
INSERT INTO django_migrations VALUES (13, 'auth', '0006_require_contenttypes_0002', '2017-02-22 20:20:04.302+03');
INSERT INTO django_migrations VALUES (14, 'auth', '0007_alter_validators_add_error_messages', '2017-02-22 20:20:04.352+03');
INSERT INTO django_migrations VALUES (15, 'auth', '0008_alter_user_username_max_length', '2017-02-22 20:20:04.437+03');
INSERT INTO django_migrations VALUES (16, 'sessions', '0001_initial', '2017-02-22 20:20:04.612+03');


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_migrations_id_seq', 16, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO django_session VALUES ('1la3oxhbc3plz0n43r41u325oc1enkdo', 'NmZhOWFmZDcxYzM0N2JhMmEyYTdhMTFlY2ZiYjA2MzI5OTFhZjE0Yzp7Il9hdXRoX3VzZXJfaGFzaCI6IjJmODc5MmRmODM0MmZlNTMxMjlmNzg1ZDM0YjA0NmQ5YTJhOTY5OGEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=', '2017-03-14 16:03:10.462+03');
INSERT INTO django_session VALUES ('phvkcm6hhjilgl0ozwx59aqdvxbktgji', 'NjA2ZmI0NTllZDE0ZmFkODk0NjM1NGQzOTRjZDEzMjc1MjQ5YTNiNjp7fQ==', '2017-04-11 15:28:46.866+03');
INSERT INTO django_session VALUES ('m25wmcb2ho9rrdgxnyhz1rpgr2bp62kj', 'NjA2ZmI0NTllZDE0ZmFkODk0NjM1NGQzOTRjZDEzMjc1MjQ5YTNiNjp7fQ==', '2017-04-11 15:29:28.142+03');
INSERT INTO django_session VALUES ('r38nx0rcgcm5ritgn3fzsj5xh68je8ju', 'NjA2ZmI0NTllZDE0ZmFkODk0NjM1NGQzOTRjZDEzMjc1MjQ5YTNiNjp7fQ==', '2017-04-11 15:33:25.125+03');
INSERT INTO django_session VALUES ('iftodxzt7bdftu61fw0vt7ub1wgdz0zw', 'NjA2ZmI0NTllZDE0ZmFkODk0NjM1NGQzOTRjZDEzMjc1MjQ5YTNiNjp7fQ==', '2017-04-11 15:33:32.336+03');
INSERT INTO django_session VALUES ('lc59tj55nu7uk4atsdkxies6ygq3umns', 'NjA2ZmI0NTllZDE0ZmFkODk0NjM1NGQzOTRjZDEzMjc1MjQ5YTNiNjp7fQ==', '2017-04-11 15:35:40.029+03');
INSERT INTO django_session VALUES ('he8epww0pbvrf1jnr0ku0a3o2143ypvv', 'NjA2ZmI0NTllZDE0ZmFkODk0NjM1NGQzOTRjZDEzMjc1MjQ5YTNiNjp7fQ==', '2017-04-11 15:39:11.078+03');
INSERT INTO django_session VALUES ('dw0oan9zmkh1woqwkwvei2fr80rq109j', 'NjA2ZmI0NTllZDE0ZmFkODk0NjM1NGQzOTRjZDEzMjc1MjQ5YTNiNjp7fQ==', '2017-04-11 15:40:06.458+03');
INSERT INTO django_session VALUES ('ulfxne9vocwzg4kouv5pupc7e81pszdq', 'NjA2ZmI0NTllZDE0ZmFkODk0NjM1NGQzOTRjZDEzMjc1MjQ5YTNiNjp7fQ==', '2017-04-11 15:40:47.378+03');


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: blog_comment blog_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_comment
    ADD CONSTRAINT blog_comment_pkey PRIMARY KEY (id);


--
-- Name: blog_comment blog_comment_text_d21be499_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_comment
    ADD CONSTRAINT blog_comment_text_d21be499_uniq UNIQUE (text);


--
-- Name: blog_post blog_post_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_post
    ADD CONSTRAINT blog_post_pkey PRIMARY KEY (id);


--
-- Name: blog_post blog_post_title_36da7df3_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_post
    ADD CONSTRAINT blog_post_title_36da7df3_uniq UNIQUE (title, text);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: blog_comment_f3aa1999; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX blog_comment_f3aa1999 ON blog_comment USING btree (post_id);


--
-- Name: blog_post_4f331e2f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX blog_post_4f331e2f ON blog_post USING btree (author_id);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_comment blog_comment_post_id_580e96ef_fk_blog_post_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_comment
    ADD CONSTRAINT blog_comment_post_id_580e96ef_fk_blog_post_id FOREIGN KEY (post_id) REFERENCES blog_post(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_post blog_post_author_id_dd7a8485_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_post
    ADD CONSTRAINT blog_post_author_id_dd7a8485_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_content_type_id_c4bce8eb_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_c4bce8eb_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

