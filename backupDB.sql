--
-- PostgreSQL database dump
--

-- Dumped from database version 13.12 (Debian 13.12-1.pgdg120+1)
-- Dumped by pg_dump version 13.12 (Debian 13.12-1.pgdg120+1)

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
-- Name: autenticacion_loggeable; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.autenticacion_loggeable (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    email character varying(254) NOT NULL
);


ALTER TABLE public.autenticacion_loggeable OWNER TO postgres;

--
-- Name: autenticacion_loggeable_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.autenticacion_loggeable_groups (
    id bigint NOT NULL,
    loggeable_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.autenticacion_loggeable_groups OWNER TO postgres;

--
-- Name: autenticacion_loggeable_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.autenticacion_loggeable_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.autenticacion_loggeable_groups_id_seq OWNER TO postgres;

--
-- Name: autenticacion_loggeable_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.autenticacion_loggeable_groups_id_seq OWNED BY public.autenticacion_loggeable_groups.id;


--
-- Name: autenticacion_loggeable_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.autenticacion_loggeable_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.autenticacion_loggeable_id_seq OWNER TO postgres;

--
-- Name: autenticacion_loggeable_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.autenticacion_loggeable_id_seq OWNED BY public.autenticacion_loggeable.id;


--
-- Name: autenticacion_loggeable_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.autenticacion_loggeable_user_permissions (
    id bigint NOT NULL,
    loggeable_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.autenticacion_loggeable_user_permissions OWNER TO postgres;

--
-- Name: autenticacion_loggeable_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.autenticacion_loggeable_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.autenticacion_loggeable_user_permissions_id_seq OWNER TO postgres;

--
-- Name: autenticacion_loggeable_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.autenticacion_loggeable_user_permissions_id_seq OWNED BY public.autenticacion_loggeable_user_permissions.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: entities_administrador; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.entities_administrador (
    id bigint NOT NULL,
    loggeable_id bigint NOT NULL
);


ALTER TABLE public.entities_administrador OWNER TO postgres;

--
-- Name: entities_administrador_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.entities_administrador_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.entities_administrador_id_seq OWNER TO postgres;

--
-- Name: entities_administrador_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.entities_administrador_id_seq OWNED BY public.entities_administrador.id;


--
-- Name: entities_carrera; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.entities_carrera (
    id bigint NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE public.entities_carrera OWNER TO postgres;

--
-- Name: entities_carrera_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.entities_carrera_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.entities_carrera_id_seq OWNER TO postgres;

--
-- Name: entities_carrera_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.entities_carrera_id_seq OWNED BY public.entities_carrera.id;


--
-- Name: entities_empresa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.entities_empresa (
    id bigint NOT NULL,
    nombre character varying(150) NOT NULL,
    loggeable_id bigint NOT NULL
);


ALTER TABLE public.entities_empresa OWNER TO postgres;

--
-- Name: entities_empresa_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.entities_empresa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.entities_empresa_id_seq OWNER TO postgres;

--
-- Name: entities_empresa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.entities_empresa_id_seq OWNED BY public.entities_empresa.id;


--
-- Name: entities_estudiante; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.entities_estudiante (
    id bigint NOT NULL,
    telefonos character varying(50)[] NOT NULL,
    nombres character varying(150) NOT NULL,
    apellidos character varying(150) NOT NULL,
    habilidades_tecnicas character varying(500) NOT NULL,
    presentacion_gral character varying(500) NOT NULL,
    imagen character varying(100) NOT NULL,
    escolaridad character varying(100) NOT NULL,
    cv character varying(100) NOT NULL,
    loggeable_id bigint NOT NULL
);


ALTER TABLE public.entities_estudiante OWNER TO postgres;

--
-- Name: entities_estudiante_etiquetas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.entities_estudiante_etiquetas (
    id bigint NOT NULL,
    estudiante_id bigint NOT NULL,
    etiqueta_id bigint NOT NULL
);


ALTER TABLE public.entities_estudiante_etiquetas OWNER TO postgres;

--
-- Name: entities_estudiante_etiquetas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.entities_estudiante_etiquetas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.entities_estudiante_etiquetas_id_seq OWNER TO postgres;

--
-- Name: entities_estudiante_etiquetas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.entities_estudiante_etiquetas_id_seq OWNED BY public.entities_estudiante_etiquetas.id;


--
-- Name: entities_estudiante_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.entities_estudiante_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.entities_estudiante_id_seq OWNER TO postgres;

--
-- Name: entities_estudiante_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.entities_estudiante_id_seq OWNED BY public.entities_estudiante.id;


--
-- Name: entities_estudiante_idiomas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.entities_estudiante_idiomas (
    id bigint NOT NULL,
    estudiante_id bigint NOT NULL,
    idioma_id bigint NOT NULL
);


ALTER TABLE public.entities_estudiante_idiomas OWNER TO postgres;

--
-- Name: entities_estudiante_idiomas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.entities_estudiante_idiomas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.entities_estudiante_idiomas_id_seq OWNER TO postgres;

--
-- Name: entities_estudiante_idiomas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.entities_estudiante_idiomas_id_seq OWNED BY public.entities_estudiante_idiomas.id;


--
-- Name: entities_estudiantecarrera; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.entities_estudiantecarrera (
    id bigint NOT NULL,
    suscrito_notificaciones boolean NOT NULL,
    creditos_obtenidos integer NOT NULL,
    carrera_id bigint NOT NULL,
    estudiante_id bigint NOT NULL
);


ALTER TABLE public.entities_estudiantecarrera OWNER TO postgres;

--
-- Name: entities_estudiantecarrera_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.entities_estudiantecarrera_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.entities_estudiantecarrera_id_seq OWNER TO postgres;

--
-- Name: entities_estudiantecarrera_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.entities_estudiantecarrera_id_seq OWNED BY public.entities_estudiantecarrera.id;


--
-- Name: entities_etiqueta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.entities_etiqueta (
    id bigint NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE public.entities_etiqueta OWNER TO postgres;

--
-- Name: entities_etiqueta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.entities_etiqueta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.entities_etiqueta_id_seq OWNER TO postgres;

--
-- Name: entities_etiqueta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.entities_etiqueta_id_seq OWNED BY public.entities_etiqueta.id;


--
-- Name: entities_idioma; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.entities_idioma (
    id bigint NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE public.entities_idioma OWNER TO postgres;

--
-- Name: entities_idioma_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.entities_idioma_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.entities_idioma_id_seq OWNER TO postgres;

--
-- Name: entities_idioma_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.entities_idioma_id_seq OWNED BY public.entities_idioma.id;


--
-- Name: entities_llamado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.entities_llamado (
    id bigint NOT NULL,
    carga_horaria character varying(150) NOT NULL,
    titulo character varying(150) NOT NULL,
    salario_rango_max character varying(150) NOT NULL,
    salario_text character varying(150) NOT NULL,
    salario_exacto numeric(10,2) NOT NULL,
    requisitos_excluyentes character varying(500) NOT NULL,
    requisitos_no_excluyentes character varying(500) NOT NULL,
    anio_en_curso integer NOT NULL,
    creditos_minimos integer NOT NULL,
    tipo_de_contrato character varying(150) NOT NULL,
    tareas_a_desarrollar character varying(500) NOT NULL,
    horario character varying(150) NOT NULL,
    observaciones character varying(500) NOT NULL,
    departamento character varying(500) NOT NULL,
    modalidad integer NOT NULL,
    estado integer NOT NULL,
    fecha_finalizacion date NOT NULL,
    empresa_id bigint NOT NULL
);


ALTER TABLE public.entities_llamado OWNER TO postgres;

--
-- Name: entities_llamado_etiquetas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.entities_llamado_etiquetas (
    id bigint NOT NULL,
    llamado_id bigint NOT NULL,
    etiqueta_id bigint NOT NULL
);


ALTER TABLE public.entities_llamado_etiquetas OWNER TO postgres;

--
-- Name: entities_llamado_etiquetas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.entities_llamado_etiquetas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.entities_llamado_etiquetas_id_seq OWNER TO postgres;

--
-- Name: entities_llamado_etiquetas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.entities_llamado_etiquetas_id_seq OWNED BY public.entities_llamado_etiquetas.id;


--
-- Name: entities_llamado_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.entities_llamado_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.entities_llamado_id_seq OWNER TO postgres;

--
-- Name: entities_llamado_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.entities_llamado_id_seq OWNED BY public.entities_llamado.id;


--
-- Name: entities_llamadocarrera; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.entities_llamadocarrera (
    id bigint NOT NULL,
    carrera_id bigint NOT NULL,
    llamado_id bigint NOT NULL
);


ALTER TABLE public.entities_llamadocarrera OWNER TO postgres;

--
-- Name: entities_llamadocarrera_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.entities_llamadocarrera_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.entities_llamadocarrera_id_seq OWNER TO postgres;

--
-- Name: entities_llamadocarrera_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.entities_llamadocarrera_id_seq OWNED BY public.entities_llamadocarrera.id;


--
-- Name: entities_postulacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.entities_postulacion (
    id bigint NOT NULL,
    escolaridad character varying(100) NOT NULL,
    cv character varying(100) NOT NULL,
    estudiante_id bigint NOT NULL,
    llamado_id bigint NOT NULL
);


ALTER TABLE public.entities_postulacion OWNER TO postgres;

--
-- Name: entities_postulacion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.entities_postulacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.entities_postulacion_id_seq OWNER TO postgres;

--
-- Name: entities_postulacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.entities_postulacion_id_seq OWNED BY public.entities_postulacion.id;


--
-- Name: entities_propuestacambiollamado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.entities_propuestacambiollamado (
    id bigint NOT NULL,
    carga_horaria character varying(150) NOT NULL,
    titulo character varying(150) NOT NULL,
    salario_rango_max character varying(150) NOT NULL,
    salario_text character varying(150) NOT NULL,
    salario_exacto numeric(10,2) NOT NULL,
    requisitos_excluyentes character varying(500) NOT NULL,
    requisitos_no_excluyentes character varying(500) NOT NULL,
    anio_en_curso integer NOT NULL,
    creditos_minimos integer NOT NULL,
    tipo_de_contrato character varying(150) NOT NULL,
    tareas_a_desarrollar character varying(500) NOT NULL,
    horario character varying(150) NOT NULL,
    observaciones character varying(500) NOT NULL,
    departamento character varying(500) NOT NULL,
    modalidad integer NOT NULL,
    estado integer NOT NULL,
    llamado_id bigint NOT NULL
);


ALTER TABLE public.entities_propuestacambiollamado OWNER TO postgres;

--
-- Name: entities_propuestacambiollamado_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.entities_propuestacambiollamado_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.entities_propuestacambiollamado_id_seq OWNER TO postgres;

--
-- Name: entities_propuestacambiollamado_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.entities_propuestacambiollamado_id_seq OWNED BY public.entities_propuestacambiollamado.id;


--
-- Name: knox_authtoken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.knox_authtoken (
    digest character varying(128) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id bigint NOT NULL,
    expiry timestamp with time zone,
    token_key character varying(8) NOT NULL
);


ALTER TABLE public.knox_authtoken OWNER TO postgres;

--
-- Name: autenticacion_loggeable id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autenticacion_loggeable ALTER COLUMN id SET DEFAULT nextval('public.autenticacion_loggeable_id_seq'::regclass);


--
-- Name: autenticacion_loggeable_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autenticacion_loggeable_groups ALTER COLUMN id SET DEFAULT nextval('public.autenticacion_loggeable_groups_id_seq'::regclass);


--
-- Name: autenticacion_loggeable_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autenticacion_loggeable_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.autenticacion_loggeable_user_permissions_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: entities_administrador id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities_administrador ALTER COLUMN id SET DEFAULT nextval('public.entities_administrador_id_seq'::regclass);


--
-- Name: entities_carrera id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities_carrera ALTER COLUMN id SET DEFAULT nextval('public.entities_carrera_id_seq'::regclass);


--
-- Name: entities_empresa id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities_empresa ALTER COLUMN id SET DEFAULT nextval('public.entities_empresa_id_seq'::regclass);


--
-- Name: entities_estudiante id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities_estudiante ALTER COLUMN id SET DEFAULT nextval('public.entities_estudiante_id_seq'::regclass);


--
-- Name: entities_estudiante_etiquetas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities_estudiante_etiquetas ALTER COLUMN id SET DEFAULT nextval('public.entities_estudiante_etiquetas_id_seq'::regclass);


--
-- Name: entities_estudiante_idiomas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities_estudiante_idiomas ALTER COLUMN id SET DEFAULT nextval('public.entities_estudiante_idiomas_id_seq'::regclass);


--
-- Name: entities_estudiantecarrera id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities_estudiantecarrera ALTER COLUMN id SET DEFAULT nextval('public.entities_estudiantecarrera_id_seq'::regclass);


--
-- Name: entities_etiqueta id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities_etiqueta ALTER COLUMN id SET DEFAULT nextval('public.entities_etiqueta_id_seq'::regclass);


--
-- Name: entities_idioma id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities_idioma ALTER COLUMN id SET DEFAULT nextval('public.entities_idioma_id_seq'::regclass);


--
-- Name: entities_llamado id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities_llamado ALTER COLUMN id SET DEFAULT nextval('public.entities_llamado_id_seq'::regclass);


--
-- Name: entities_llamado_etiquetas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities_llamado_etiquetas ALTER COLUMN id SET DEFAULT nextval('public.entities_llamado_etiquetas_id_seq'::regclass);


--
-- Name: entities_llamadocarrera id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities_llamadocarrera ALTER COLUMN id SET DEFAULT nextval('public.entities_llamadocarrera_id_seq'::regclass);


--
-- Name: entities_postulacion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities_postulacion ALTER COLUMN id SET DEFAULT nextval('public.entities_postulacion_id_seq'::regclass);


--
-- Name: entities_propuestacambiollamado id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities_propuestacambiollamado ALTER COLUMN id SET DEFAULT nextval('public.entities_propuestacambiollamado_id_seq'::regclass);


--
-- Data for Name: autenticacion_loggeable; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.autenticacion_loggeable (id, password, last_login, is_superuser, is_staff, is_active, date_joined, email) FROM stdin;
\.


--
-- Data for Name: autenticacion_loggeable_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.autenticacion_loggeable_groups (id, loggeable_id, group_id) FROM stdin;
\.


--
-- Data for Name: autenticacion_loggeable_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.autenticacion_loggeable_user_permissions (id, loggeable_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add user	6	add_loggeable
22	Can change user	6	change_loggeable
23	Can delete user	6	delete_loggeable
24	Can view user	6	view_loggeable
25	Can add carrera	7	add_carrera
26	Can change carrera	7	change_carrera
27	Can delete carrera	7	delete_carrera
28	Can view carrera	7	view_carrera
29	Can add estudiante	8	add_estudiante
30	Can change estudiante	8	change_estudiante
31	Can delete estudiante	8	delete_estudiante
32	Can view estudiante	8	view_estudiante
33	Can add etiqueta	9	add_etiqueta
34	Can change etiqueta	9	change_etiqueta
35	Can delete etiqueta	9	delete_etiqueta
36	Can view etiqueta	9	view_etiqueta
37	Can add idioma	10	add_idioma
38	Can change idioma	10	change_idioma
39	Can delete idioma	10	delete_idioma
40	Can view idioma	10	view_idioma
41	Can add llamado	11	add_llamado
42	Can change llamado	11	change_llamado
43	Can delete llamado	11	delete_llamado
44	Can view llamado	11	view_llamado
45	Can add propuesta cambio l lamado	12	add_propuestacambiollamado
46	Can change propuesta cambio l lamado	12	change_propuestacambiollamado
47	Can delete propuesta cambio l lamado	12	delete_propuestacambiollamado
48	Can view propuesta cambio l lamado	12	view_propuestacambiollamado
49	Can add postulacion	13	add_postulacion
50	Can change postulacion	13	change_postulacion
51	Can delete postulacion	13	delete_postulacion
52	Can view postulacion	13	view_postulacion
53	Can add l lamado carrera	14	add_llamadocarrera
54	Can change l lamado carrera	14	change_llamadocarrera
55	Can delete l lamado carrera	14	delete_llamadocarrera
56	Can view l lamado carrera	14	view_llamadocarrera
57	Can add estudiante carrera	15	add_estudiantecarrera
58	Can change estudiante carrera	15	change_estudiantecarrera
59	Can delete estudiante carrera	15	delete_estudiantecarrera
60	Can view estudiante carrera	15	view_estudiantecarrera
61	Can add empresa	16	add_empresa
62	Can change empresa	16	change_empresa
63	Can delete empresa	16	delete_empresa
64	Can view empresa	16	view_empresa
65	Can add administrador	17	add_administrador
66	Can change administrador	17	change_administrador
67	Can delete administrador	17	delete_administrador
68	Can view administrador	17	view_administrador
69	Can add auth token	18	add_authtoken
70	Can change auth token	18	change_authtoken
71	Can delete auth token	18	delete_authtoken
72	Can view auth token	18	view_authtoken
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	autenticacion	loggeable
7	entities	carrera
8	entities	estudiante
9	entities	etiqueta
10	entities	idioma
11	entities	llamado
12	entities	propuestacambiollamado
13	entities	postulacion
14	entities	llamadocarrera
15	entities	estudiantecarrera
16	entities	empresa
17	entities	administrador
18	knox	authtoken
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2023-08-31 18:57:37.73776+00
2	contenttypes	0002_remove_content_type_name	2023-08-31 18:57:37.744567+00
3	auth	0001_initial	2023-08-31 18:57:37.778744+00
4	auth	0002_alter_permission_name_max_length	2023-08-31 18:57:37.782923+00
5	auth	0003_alter_user_email_max_length	2023-08-31 18:57:37.787631+00
6	auth	0004_alter_user_username_opts	2023-08-31 18:57:37.792185+00
7	auth	0005_alter_user_last_login_null	2023-08-31 18:57:37.796413+00
8	auth	0006_require_contenttypes_0002	2023-08-31 18:57:37.799086+00
9	auth	0007_alter_validators_add_error_messages	2023-08-31 18:57:37.806452+00
10	auth	0008_alter_user_username_max_length	2023-08-31 18:57:37.810844+00
11	auth	0009_alter_user_last_name_max_length	2023-08-31 18:57:37.816708+00
12	auth	0010_alter_group_name_max_length	2023-08-31 18:57:37.822733+00
13	auth	0011_update_proxy_permissions	2023-08-31 18:57:37.828112+00
14	auth	0012_alter_user_first_name_max_length	2023-08-31 18:57:37.833299+00
15	autenticacion	0001_initial	2023-08-31 18:57:37.865744+00
16	admin	0001_initial	2023-08-31 18:57:37.881568+00
17	admin	0002_logentry_remove_auto_add	2023-08-31 18:57:37.88828+00
18	admin	0003_logentry_add_action_flag_choices	2023-08-31 18:57:37.894995+00
19	entities	0001_initial	2023-08-31 18:57:38.043704+00
20	knox	0001_initial	2023-08-31 18:57:38.085475+00
21	knox	0002_auto_20150916_1425	2023-08-31 18:57:38.112913+00
22	knox	0003_auto_20150916_1526	2023-08-31 18:57:38.129972+00
23	knox	0004_authtoken_expires	2023-08-31 18:57:38.142392+00
24	knox	0005_authtoken_token_key	2023-08-31 18:57:38.160997+00
25	knox	0006_auto_20160818_0932	2023-08-31 18:57:38.187839+00
26	knox	0007_auto_20190111_0542	2023-08-31 18:57:38.201722+00
27	knox	0008_remove_authtoken_salt	2023-08-31 18:57:38.216511+00
28	sessions	0001_initial	2023-08-31 18:57:38.240619+00
29	entities	0002_llamado_empresa	2023-08-31 20:37:15.087787+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: entities_administrador; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.entities_administrador (id, loggeable_id) FROM stdin;
\.


--
-- Data for Name: entities_carrera; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.entities_carrera (id, nombre) FROM stdin;
\.


--
-- Data for Name: entities_empresa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.entities_empresa (id, nombre, loggeable_id) FROM stdin;
\.


--
-- Data for Name: entities_estudiante; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.entities_estudiante (id, telefonos, nombres, apellidos, habilidades_tecnicas, presentacion_gral, imagen, escolaridad, cv, loggeable_id) FROM stdin;
\.


--
-- Data for Name: entities_estudiante_etiquetas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.entities_estudiante_etiquetas (id, estudiante_id, etiqueta_id) FROM stdin;
\.


--
-- Data for Name: entities_estudiante_idiomas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.entities_estudiante_idiomas (id, estudiante_id, idioma_id) FROM stdin;
\.


--
-- Data for Name: entities_estudiantecarrera; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.entities_estudiantecarrera (id, suscrito_notificaciones, creditos_obtenidos, carrera_id, estudiante_id) FROM stdin;
\.


--
-- Data for Name: entities_etiqueta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.entities_etiqueta (id, nombre) FROM stdin;
\.


--
-- Data for Name: entities_idioma; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.entities_idioma (id, nombre) FROM stdin;
\.


--
-- Data for Name: entities_llamado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.entities_llamado (id, carga_horaria, titulo, salario_rango_max, salario_text, salario_exacto, requisitos_excluyentes, requisitos_no_excluyentes, anio_en_curso, creditos_minimos, tipo_de_contrato, tareas_a_desarrollar, horario, observaciones, departamento, modalidad, estado, fecha_finalizacion, empresa_id) FROM stdin;
\.


--
-- Data for Name: entities_llamado_etiquetas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.entities_llamado_etiquetas (id, llamado_id, etiqueta_id) FROM stdin;
\.


--
-- Data for Name: entities_llamadocarrera; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.entities_llamadocarrera (id, carrera_id, llamado_id) FROM stdin;
\.


--
-- Data for Name: entities_postulacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.entities_postulacion (id, escolaridad, cv, estudiante_id, llamado_id) FROM stdin;
\.


--
-- Data for Name: entities_propuestacambiollamado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.entities_propuestacambiollamado (id, carga_horaria, titulo, salario_rango_max, salario_text, salario_exacto, requisitos_excluyentes, requisitos_no_excluyentes, anio_en_curso, creditos_minimos, tipo_de_contrato, tareas_a_desarrollar, horario, observaciones, departamento, modalidad, estado, llamado_id) FROM stdin;
\.


--
-- Data for Name: knox_authtoken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.knox_authtoken (digest, created, user_id, expiry, token_key) FROM stdin;
\.


--
-- Name: autenticacion_loggeable_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.autenticacion_loggeable_groups_id_seq', 1, false);


--
-- Name: autenticacion_loggeable_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.autenticacion_loggeable_id_seq', 1, false);


--
-- Name: autenticacion_loggeable_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.autenticacion_loggeable_user_permissions_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 72, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 18, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 29, true);


--
-- Name: entities_administrador_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.entities_administrador_id_seq', 1, false);


--
-- Name: entities_carrera_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.entities_carrera_id_seq', 1, false);


--
-- Name: entities_empresa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.entities_empresa_id_seq', 1, false);


--
-- Name: entities_estudiante_etiquetas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.entities_estudiante_etiquetas_id_seq', 1, false);


--
-- Name: entities_estudiante_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.entities_estudiante_id_seq', 1, false);


--
-- Name: entities_estudiante_idiomas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.entities_estudiante_idiomas_id_seq', 1, false);


--
-- Name: entities_estudiantecarrera_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.entities_estudiantecarrera_id_seq', 1, false);


--
-- Name: entities_etiqueta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.entities_etiqueta_id_seq', 1, false);


--
-- Name: entities_idioma_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.entities_idioma_id_seq', 1, false);


--
-- Name: entities_llamado_etiquetas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.entities_llamado_etiquetas_id_seq', 1, false);


--
-- Name: entities_llamado_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.entities_llamado_id_seq', 2, true);


--
-- Name: entities_llamadocarrera_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.entities_llamadocarrera_id_seq', 1, false);


--
-- Name: entities_postulacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.entities_postulacion_id_seq', 1, false);


--
-- Name: entities_propuestacambiollamado_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.entities_propuestacambiollamado_id_seq', 1, false);


--
-- Name: autenticacion_loggeable_groups autenticacion_loggeable__loggeable_id_group_id_474151a6_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autenticacion_loggeable_groups
    ADD CONSTRAINT autenticacion_loggeable__loggeable_id_group_id_474151a6_uniq UNIQUE (loggeable_id, group_id);


--
-- Name: autenticacion_loggeable_user_permissions autenticacion_loggeable__loggeable_id_permission__5f1a76dc_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autenticacion_loggeable_user_permissions
    ADD CONSTRAINT autenticacion_loggeable__loggeable_id_permission__5f1a76dc_uniq UNIQUE (loggeable_id, permission_id);


--
-- Name: autenticacion_loggeable autenticacion_loggeable_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autenticacion_loggeable
    ADD CONSTRAINT autenticacion_loggeable_email_key UNIQUE (email);


--
-- Name: autenticacion_loggeable_groups autenticacion_loggeable_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autenticacion_loggeable_groups
    ADD CONSTRAINT autenticacion_loggeable_groups_pkey PRIMARY KEY (id);


--
-- Name: autenticacion_loggeable autenticacion_loggeable_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autenticacion_loggeable
    ADD CONSTRAINT autenticacion_loggeable_pkey PRIMARY KEY (id);


--
-- Name: autenticacion_loggeable_user_permissions autenticacion_loggeable_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autenticacion_loggeable_user_permissions
    ADD CONSTRAINT autenticacion_loggeable_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: entities_administrador entities_administrador_loggeable_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities_administrador
    ADD CONSTRAINT entities_administrador_loggeable_id_key UNIQUE (loggeable_id);


--
-- Name: entities_administrador entities_administrador_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities_administrador
    ADD CONSTRAINT entities_administrador_pkey PRIMARY KEY (id);


--
-- Name: entities_carrera entities_carrera_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities_carrera
    ADD CONSTRAINT entities_carrera_nombre_key UNIQUE (nombre);


--
-- Name: entities_carrera entities_carrera_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities_carrera
    ADD CONSTRAINT entities_carrera_pkey PRIMARY KEY (id);


--
-- Name: entities_empresa entities_empresa_loggeable_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities_empresa
    ADD CONSTRAINT entities_empresa_loggeable_id_key UNIQUE (loggeable_id);


--
-- Name: entities_empresa entities_empresa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities_empresa
    ADD CONSTRAINT entities_empresa_pkey PRIMARY KEY (id);


--
-- Name: entities_estudiante_etiquetas entities_estudiante_etiq_estudiante_id_etiqueta_i_05def245_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities_estudiante_etiquetas
    ADD CONSTRAINT entities_estudiante_etiq_estudiante_id_etiqueta_i_05def245_uniq UNIQUE (estudiante_id, etiqueta_id);


--
-- Name: entities_estudiante_etiquetas entities_estudiante_etiquetas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities_estudiante_etiquetas
    ADD CONSTRAINT entities_estudiante_etiquetas_pkey PRIMARY KEY (id);


--
-- Name: entities_estudiante_idiomas entities_estudiante_idio_estudiante_id_idioma_id_90cbc5b1_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities_estudiante_idiomas
    ADD CONSTRAINT entities_estudiante_idio_estudiante_id_idioma_id_90cbc5b1_uniq UNIQUE (estudiante_id, idioma_id);


--
-- Name: entities_estudiante_idiomas entities_estudiante_idiomas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities_estudiante_idiomas
    ADD CONSTRAINT entities_estudiante_idiomas_pkey PRIMARY KEY (id);


--
-- Name: entities_estudiante entities_estudiante_loggeable_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities_estudiante
    ADD CONSTRAINT entities_estudiante_loggeable_id_key UNIQUE (loggeable_id);


--
-- Name: entities_estudiante entities_estudiante_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities_estudiante
    ADD CONSTRAINT entities_estudiante_pkey PRIMARY KEY (id);


--
-- Name: entities_estudiantecarrera entities_estudiantecarrera_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities_estudiantecarrera
    ADD CONSTRAINT entities_estudiantecarrera_pkey PRIMARY KEY (id);


--
-- Name: entities_etiqueta entities_etiqueta_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities_etiqueta
    ADD CONSTRAINT entities_etiqueta_nombre_key UNIQUE (nombre);


--
-- Name: entities_etiqueta entities_etiqueta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities_etiqueta
    ADD CONSTRAINT entities_etiqueta_pkey PRIMARY KEY (id);


--
-- Name: entities_idioma entities_idioma_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities_idioma
    ADD CONSTRAINT entities_idioma_nombre_key UNIQUE (nombre);


--
-- Name: entities_idioma entities_idioma_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities_idioma
    ADD CONSTRAINT entities_idioma_pkey PRIMARY KEY (id);


--
-- Name: entities_llamado_etiquetas entities_llamado_etiquetas_llamado_id_etiqueta_id_2ab896ab_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities_llamado_etiquetas
    ADD CONSTRAINT entities_llamado_etiquetas_llamado_id_etiqueta_id_2ab896ab_uniq UNIQUE (llamado_id, etiqueta_id);


--
-- Name: entities_llamado_etiquetas entities_llamado_etiquetas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities_llamado_etiquetas
    ADD CONSTRAINT entities_llamado_etiquetas_pkey PRIMARY KEY (id);


--
-- Name: entities_llamado entities_llamado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities_llamado
    ADD CONSTRAINT entities_llamado_pkey PRIMARY KEY (id);


--
-- Name: entities_llamadocarrera entities_llamadocarrera_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities_llamadocarrera
    ADD CONSTRAINT entities_llamadocarrera_pkey PRIMARY KEY (id);


--
-- Name: entities_postulacion entities_postulacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities_postulacion
    ADD CONSTRAINT entities_postulacion_pkey PRIMARY KEY (id);


--
-- Name: entities_propuestacambiollamado entities_propuestacambiollamado_llamado_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities_propuestacambiollamado
    ADD CONSTRAINT entities_propuestacambiollamado_llamado_id_key UNIQUE (llamado_id);


--
-- Name: entities_propuestacambiollamado entities_propuestacambiollamado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities_propuestacambiollamado
    ADD CONSTRAINT entities_propuestacambiollamado_pkey PRIMARY KEY (id);


--
-- Name: knox_authtoken knox_authtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.knox_authtoken
    ADD CONSTRAINT knox_authtoken_pkey PRIMARY KEY (digest);


--
-- Name: autenticacion_loggeable_email_8bdfbe01_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX autenticacion_loggeable_email_8bdfbe01_like ON public.autenticacion_loggeable USING btree (email varchar_pattern_ops);


--
-- Name: autenticacion_loggeable_groups_group_id_d44e16d7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX autenticacion_loggeable_groups_group_id_d44e16d7 ON public.autenticacion_loggeable_groups USING btree (group_id);


--
-- Name: autenticacion_loggeable_groups_loggeable_id_c93d85d6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX autenticacion_loggeable_groups_loggeable_id_c93d85d6 ON public.autenticacion_loggeable_groups USING btree (loggeable_id);


--
-- Name: autenticacion_loggeable_user_permissions_loggeable_id_f025252e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX autenticacion_loggeable_user_permissions_loggeable_id_f025252e ON public.autenticacion_loggeable_user_permissions USING btree (loggeable_id);


--
-- Name: autenticacion_loggeable_user_permissions_permission_id_2e799aa2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX autenticacion_loggeable_user_permissions_permission_id_2e799aa2 ON public.autenticacion_loggeable_user_permissions USING btree (permission_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: entities_carrera_nombre_65dea125_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX entities_carrera_nombre_65dea125_like ON public.entities_carrera USING btree (nombre varchar_pattern_ops);


--
-- Name: entities_estudiante_etiquetas_estudiante_id_0258d962; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX entities_estudiante_etiquetas_estudiante_id_0258d962 ON public.entities_estudiante_etiquetas USING btree (estudiante_id);


--
-- Name: entities_estudiante_etiquetas_etiqueta_id_2b91d892; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX entities_estudiante_etiquetas_etiqueta_id_2b91d892 ON public.entities_estudiante_etiquetas USING btree (etiqueta_id);


--
-- Name: entities_estudiante_idiomas_estudiante_id_4aaab240; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX entities_estudiante_idiomas_estudiante_id_4aaab240 ON public.entities_estudiante_idiomas USING btree (estudiante_id);


--
-- Name: entities_estudiante_idiomas_idioma_id_180c8b21; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX entities_estudiante_idiomas_idioma_id_180c8b21 ON public.entities_estudiante_idiomas USING btree (idioma_id);


--
-- Name: entities_estudiantecarrera_carrera_id_be9fdcb0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX entities_estudiantecarrera_carrera_id_be9fdcb0 ON public.entities_estudiantecarrera USING btree (carrera_id);


--
-- Name: entities_estudiantecarrera_estudiante_id_1ecc30ff; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX entities_estudiantecarrera_estudiante_id_1ecc30ff ON public.entities_estudiantecarrera USING btree (estudiante_id);


--
-- Name: entities_etiqueta_nombre_b05bda36_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX entities_etiqueta_nombre_b05bda36_like ON public.entities_etiqueta USING btree (nombre varchar_pattern_ops);


--
-- Name: entities_idioma_nombre_6806c713_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX entities_idioma_nombre_6806c713_like ON public.entities_idioma USING btree (nombre varchar_pattern_ops);


--
-- Name: entities_llamado_empresa_id_416628db; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX entities_llamado_empresa_id_416628db ON public.entities_llamado USING btree (empresa_id);


--
-- Name: entities_llamado_etiquetas_etiqueta_id_b0413f93; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX entities_llamado_etiquetas_etiqueta_id_b0413f93 ON public.entities_llamado_etiquetas USING btree (etiqueta_id);


--
-- Name: entities_llamado_etiquetas_llamado_id_0bf81454; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX entities_llamado_etiquetas_llamado_id_0bf81454 ON public.entities_llamado_etiquetas USING btree (llamado_id);


--
-- Name: entities_llamadocarrera_carrera_id_ba9940cf; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX entities_llamadocarrera_carrera_id_ba9940cf ON public.entities_llamadocarrera USING btree (carrera_id);


--
-- Name: entities_llamadocarrera_llamado_id_fc7e1214; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX entities_llamadocarrera_llamado_id_fc7e1214 ON public.entities_llamadocarrera USING btree (llamado_id);


--
-- Name: entities_postulacion_estudiante_id_988f0964; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX entities_postulacion_estudiante_id_988f0964 ON public.entities_postulacion USING btree (estudiante_id);


--
-- Name: entities_postulacion_llamado_id_5fb1daaa; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX entities_postulacion_llamado_id_5fb1daaa ON public.entities_postulacion USING btree (llamado_id);


--
-- Name: knox_authtoken_digest_188c7e77_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX knox_authtoken_digest_188c7e77_like ON public.knox_authtoken USING btree (digest varchar_pattern_ops);


--
-- Name: knox_authtoken_token_key_8f4f7d47; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX knox_authtoken_token_key_8f4f7d47 ON public.knox_authtoken USING btree (token_key);


--
-- Name: knox_authtoken_token_key_8f4f7d47_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX knox_authtoken_token_key_8f4f7d47_like ON public.knox_authtoken USING btree (token_key varchar_pattern_ops);


--
-- Name: knox_authtoken_user_id_e5a5d899; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX knox_authtoken_user_id_e5a5d899 ON public.knox_authtoken USING btree (user_id);


--
-- Name: autenticacion_loggeable_groups autenticacion_loggea_group_id_d44e16d7_fk_auth_grou; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autenticacion_loggeable_groups
    ADD CONSTRAINT autenticacion_loggea_group_id_d44e16d7_fk_auth_grou FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: autenticacion_loggeable_groups autenticacion_loggea_loggeable_id_c93d85d6_fk_autentica; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autenticacion_loggeable_groups
    ADD CONSTRAINT autenticacion_loggea_loggeable_id_c93d85d6_fk_autentica FOREIGN KEY (loggeable_id) REFERENCES public.autenticacion_loggeable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: autenticacion_loggeable_user_permissions autenticacion_loggea_loggeable_id_f025252e_fk_autentica; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autenticacion_loggeable_user_permissions
    ADD CONSTRAINT autenticacion_loggea_loggeable_id_f025252e_fk_autentica FOREIGN KEY (loggeable_id) REFERENCES public.autenticacion_loggeable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: autenticacion_loggeable_user_permissions autenticacion_loggea_permission_id_2e799aa2_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autenticacion_loggeable_user_permissions
    ADD CONSTRAINT autenticacion_loggea_permission_id_2e799aa2_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_autenticacion_loggeable_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_autenticacion_loggeable_id FOREIGN KEY (user_id) REFERENCES public.autenticacion_loggeable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: entities_administrador entities_administrad_loggeable_id_bdaa4504_fk_autentica; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities_administrador
    ADD CONSTRAINT entities_administrad_loggeable_id_bdaa4504_fk_autentica FOREIGN KEY (loggeable_id) REFERENCES public.autenticacion_loggeable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: entities_empresa entities_empresa_loggeable_id_33d4dd18_fk_autentica; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities_empresa
    ADD CONSTRAINT entities_empresa_loggeable_id_33d4dd18_fk_autentica FOREIGN KEY (loggeable_id) REFERENCES public.autenticacion_loggeable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: entities_estudiante_etiquetas entities_estudiante__estudiante_id_0258d962_fk_entities_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities_estudiante_etiquetas
    ADD CONSTRAINT entities_estudiante__estudiante_id_0258d962_fk_entities_ FOREIGN KEY (estudiante_id) REFERENCES public.entities_estudiante(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: entities_estudiante_idiomas entities_estudiante__estudiante_id_4aaab240_fk_entities_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities_estudiante_idiomas
    ADD CONSTRAINT entities_estudiante__estudiante_id_4aaab240_fk_entities_ FOREIGN KEY (estudiante_id) REFERENCES public.entities_estudiante(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: entities_estudiante_etiquetas entities_estudiante__etiqueta_id_2b91d892_fk_entities_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities_estudiante_etiquetas
    ADD CONSTRAINT entities_estudiante__etiqueta_id_2b91d892_fk_entities_ FOREIGN KEY (etiqueta_id) REFERENCES public.entities_etiqueta(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: entities_estudiante_idiomas entities_estudiante__idioma_id_180c8b21_fk_entities_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities_estudiante_idiomas
    ADD CONSTRAINT entities_estudiante__idioma_id_180c8b21_fk_entities_ FOREIGN KEY (idioma_id) REFERENCES public.entities_idioma(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: entities_estudiante entities_estudiante_loggeable_id_eadaf480_fk_autentica; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities_estudiante
    ADD CONSTRAINT entities_estudiante_loggeable_id_eadaf480_fk_autentica FOREIGN KEY (loggeable_id) REFERENCES public.autenticacion_loggeable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: entities_estudiantecarrera entities_estudiantec_carrera_id_be9fdcb0_fk_entities_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities_estudiantecarrera
    ADD CONSTRAINT entities_estudiantec_carrera_id_be9fdcb0_fk_entities_ FOREIGN KEY (carrera_id) REFERENCES public.entities_carrera(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: entities_estudiantecarrera entities_estudiantec_estudiante_id_1ecc30ff_fk_entities_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities_estudiantecarrera
    ADD CONSTRAINT entities_estudiantec_estudiante_id_1ecc30ff_fk_entities_ FOREIGN KEY (estudiante_id) REFERENCES public.entities_estudiante(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: entities_llamado entities_llamado_empresa_id_416628db_fk_entities_empresa_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities_llamado
    ADD CONSTRAINT entities_llamado_empresa_id_416628db_fk_entities_empresa_id FOREIGN KEY (empresa_id) REFERENCES public.entities_empresa(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: entities_llamado_etiquetas entities_llamado_eti_etiqueta_id_b0413f93_fk_entities_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities_llamado_etiquetas
    ADD CONSTRAINT entities_llamado_eti_etiqueta_id_b0413f93_fk_entities_ FOREIGN KEY (etiqueta_id) REFERENCES public.entities_etiqueta(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: entities_llamado_etiquetas entities_llamado_eti_llamado_id_0bf81454_fk_entities_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities_llamado_etiquetas
    ADD CONSTRAINT entities_llamado_eti_llamado_id_0bf81454_fk_entities_ FOREIGN KEY (llamado_id) REFERENCES public.entities_llamado(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: entities_llamadocarrera entities_llamadocarr_carrera_id_ba9940cf_fk_entities_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities_llamadocarrera
    ADD CONSTRAINT entities_llamadocarr_carrera_id_ba9940cf_fk_entities_ FOREIGN KEY (carrera_id) REFERENCES public.entities_carrera(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: entities_llamadocarrera entities_llamadocarr_llamado_id_fc7e1214_fk_entities_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities_llamadocarrera
    ADD CONSTRAINT entities_llamadocarr_llamado_id_fc7e1214_fk_entities_ FOREIGN KEY (llamado_id) REFERENCES public.entities_llamado(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: entities_postulacion entities_postulacion_estudiante_id_988f0964_fk_entities_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities_postulacion
    ADD CONSTRAINT entities_postulacion_estudiante_id_988f0964_fk_entities_ FOREIGN KEY (estudiante_id) REFERENCES public.entities_estudiante(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: entities_postulacion entities_postulacion_llamado_id_5fb1daaa_fk_entities_llamado_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities_postulacion
    ADD CONSTRAINT entities_postulacion_llamado_id_5fb1daaa_fk_entities_llamado_id FOREIGN KEY (llamado_id) REFERENCES public.entities_llamado(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: entities_propuestacambiollamado entities_propuestaca_llamado_id_8460b0ab_fk_entities_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entities_propuestacambiollamado
    ADD CONSTRAINT entities_propuestaca_llamado_id_8460b0ab_fk_entities_ FOREIGN KEY (llamado_id) REFERENCES public.entities_llamado(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: knox_authtoken knox_authtoken_user_id_e5a5d899_fk_autenticacion_loggeable_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.knox_authtoken
    ADD CONSTRAINT knox_authtoken_user_id_e5a5d899_fk_autenticacion_loggeable_id FOREIGN KEY (user_id) REFERENCES public.autenticacion_loggeable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--
