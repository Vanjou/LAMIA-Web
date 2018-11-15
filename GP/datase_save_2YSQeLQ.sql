--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

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


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: vadjango
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO vadjango;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: vadjango
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO vadjango;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vadjango
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: vadjango
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO vadjango;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: vadjango
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO vadjango;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vadjango
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: vadjango
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO vadjango;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: vadjango
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO vadjango;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vadjango
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: vadjango
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


ALTER TABLE auth_user OWNER TO vadjango;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: vadjango
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO vadjango;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: vadjango
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO vadjango;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vadjango
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: vadjango
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO vadjango;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vadjango
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: vadjango
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO vadjango;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: vadjango
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO vadjango;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vadjango
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: carto_layer; Type: TABLE; Schema: public; Owner: vadjango
--

CREATE TABLE carto_layer (
    id_layer integer NOT NULL,
    name character varying(200) NOT NULL,
    ref character varying(200) NOT NULL,
    id_objet integer DEFAULT 0 NOT NULL,
    datecreation date DEFAULT ('now'::text)::date NOT NULL,
    datedestruction date,
    commentaire character varying(255),
    libelle character varying(255)
);


ALTER TABLE carto_layer OWNER TO vadjango;

--
-- Name: carto_layer_id_seq; Type: SEQUENCE; Schema: public; Owner: vadjango
--

CREATE SEQUENCE carto_layer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE carto_layer_id_seq OWNER TO vadjango;

--
-- Name: carto_layer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vadjango
--

ALTER SEQUENCE carto_layer_id_seq OWNED BY carto_layer.id_layer;


--
-- Name: data; Type: TABLE; Schema: public; Owner: vadjango
--

CREATE TABLE data (
    id integer NOT NULL,
    datecreation date NOT NULL,
    commentaire character varying(255) NOT NULL,
    libelle character varying(255) NOT NULL,
    datedestruction date
);


ALTER TABLE data OWNER TO vadjango;

--
-- Name: data_id_seq; Type: SEQUENCE; Schema: public; Owner: vadjango
--

CREATE SEQUENCE data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE data_id_seq OWNER TO vadjango;

--
-- Name: data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vadjango
--

ALTER SEQUENCE data_id_seq OWNED BY data.id;


--
-- Name: data_ressource; Type: TABLE; Schema: public; Owner: vadjango
--

CREATE TABLE data_ressource (
    id integer NOT NULL,
    datecreation date NOT NULL,
    commentaire character varying(255) NOT NULL,
    libelle character varying(255) NOT NULL,
    source character varying(255) NOT NULL,
    contactadresse character varying(255),
    contactnom character varying(255),
    contactmail character varying(255),
    contacttel1 character varying(255),
    contacttel2 character varying(255),
    file bytea NOT NULL,
    description character varying(255),
    geometry bytea NOT NULL,
    datedestruction date
);


ALTER TABLE data_ressource OWNER TO vadjango;

--
-- Name: data_ressource_id_seq; Type: SEQUENCE; Schema: public; Owner: vadjango
--

CREATE SEQUENCE data_ressource_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE data_ressource_id_seq OWNER TO vadjango;

--
-- Name: data_ressource_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vadjango
--

ALTER SEQUENCE data_ressource_id_seq OWNED BY data_ressource.id;


--
-- Name: data_systeme; Type: TABLE; Schema: public; Owner: vadjango
--

CREATE TABLE data_systeme (
    id integer NOT NULL,
    datecreation date NOT NULL,
    commentaire character varying(255) NOT NULL,
    libelle character varying(255) NOT NULL,
    importancestrat character varying(255),
    etatfonct character varying(255),
    datederniereobs date,
    qualitegeoloc numeric(999,500),
    parametres character varying(255),
    listeparametres character varying(255),
    geometry bytea NOT NULL,
    datedestruction date
);


ALTER TABLE data_systeme OWNER TO vadjango;

--
-- Name: data_systeme_id_seq; Type: SEQUENCE; Schema: public; Owner: vadjango
--

CREATE SEQUENCE data_systeme_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE data_systeme_id_seq OWNER TO vadjango;

--
-- Name: data_systeme_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vadjango
--

ALTER SEQUENCE data_systeme_id_seq OWNED BY data_systeme.id;


--
-- Name: descriptionsystem; Type: TABLE; Schema: public; Owner: vadjango
--

CREATE TABLE descriptionsystem (
    id_descriptionsystem integer NOT NULL
);


ALTER TABLE descriptionsystem OWNER TO vadjango;

--
-- Name: descriptionsystem_id_descriptionsystem_seq; Type: SEQUENCE; Schema: public; Owner: vadjango
--

CREATE SEQUENCE descriptionsystem_id_descriptionsystem_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE descriptionsystem_id_descriptionsystem_seq OWNER TO vadjango;

--
-- Name: descriptionsystem_id_descriptionsystem_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vadjango
--

ALTER SEQUENCE descriptionsystem_id_descriptionsystem_seq OWNED BY descriptionsystem.id_descriptionsystem;


--
-- Name: desordre; Type: TABLE; Schema: public; Owner: vadjango
--

CREATE TABLE desordre (
    datecreation date NOT NULL,
    commentaire character varying(255) NOT NULL,
    libelle character varying(255) NOT NULL,
    id_desordre integer NOT NULL,
    impact character varying(255),
    gravite integer NOT NULL,
    priorite integer NOT NULL,
    risques character varying(255),
    geometry bytea NOT NULL,
    id_evenement integer,
    id_objet integer NOT NULL,
    datedestruction date
);


ALTER TABLE desordre OWNER TO vadjango;

--
-- Name: desordre_id_desordre_seq; Type: SEQUENCE; Schema: public; Owner: vadjango
--

CREATE SEQUENCE desordre_id_desordre_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE desordre_id_desordre_seq OWNER TO vadjango;

--
-- Name: desordre_id_desordre_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vadjango
--

ALTER SEQUENCE desordre_id_desordre_seq OWNED BY desordre.id_desordre;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: vadjango
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


ALTER TABLE django_admin_log OWNER TO vadjango;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: vadjango
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO vadjango;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vadjango
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: vadjango
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO vadjango;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: vadjango
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO vadjango;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vadjango
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: vadjango
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO vadjango;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: vadjango
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO vadjango;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vadjango
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: vadjango
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO vadjango;

--
-- Name: environnement; Type: TABLE; Schema: public; Owner: vadjango
--

CREATE TABLE environnement (
    datecreation date NOT NULL,
    commentaire character varying(255) NOT NULL,
    libelle character varying(255) NOT NULL,
    importancestrat character varying(255),
    etatfonct character varying(255),
    datederniereobs date,
    qualitegeoloc numeric(999,500),
    parametres character varying(255),
    listeparametres character varying(255),
    geometry bytea NOT NULL,
    id_environnement integer NOT NULL,
    noeudoulineaire boolean NOT NULL,
    id_descriptionsystem integer NOT NULL,
    id_lineaire integer,
    id_noeud integer,
    id_objet integer NOT NULL,
    datedestruction date
);


ALTER TABLE environnement OWNER TO vadjango;

--
-- Name: environnement_id_environnement_seq; Type: SEQUENCE; Schema: public; Owner: vadjango
--

CREATE SEQUENCE environnement_id_environnement_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE environnement_id_environnement_seq OWNER TO vadjango;

--
-- Name: environnement_id_environnement_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vadjango
--

ALTER SEQUENCE environnement_id_environnement_seq OWNED BY environnement.id_environnement;


--
-- Name: equipement; Type: TABLE; Schema: public; Owner: vadjango
--

CREATE TABLE equipement (
    datecreation date NOT NULL,
    commentaire character varying(255) NOT NULL,
    libelle character varying(255) NOT NULL,
    importancestrat character varying(255),
    etatfonct character varying(255),
    datederniereobs date,
    qualitegeoloc numeric(999,500),
    parametres character varying(255),
    listeparametres character varying(255),
    geometry bytea NOT NULL,
    id_equipement integer NOT NULL,
    noeudoulineaire boolean NOT NULL,
    id_descriptionsystem integer NOT NULL,
    id_lineaire integer,
    id_noeud integer,
    id_objet integer NOT NULL,
    datedestruction date
);


ALTER TABLE equipement OWNER TO vadjango;

--
-- Name: equipement_id_equipement_seq; Type: SEQUENCE; Schema: public; Owner: vadjango
--

CREATE SEQUENCE equipement_id_equipement_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE equipement_id_equipement_seq OWNER TO vadjango;

--
-- Name: equipement_id_equipement_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vadjango
--

ALTER SEQUENCE equipement_id_equipement_seq OWNED BY equipement.id_equipement;


--
-- Name: etudestrategie; Type: TABLE; Schema: public; Owner: vadjango
--

CREATE TABLE etudestrategie (
    datecreation date NOT NULL,
    commentaire character varying(255) NOT NULL,
    libelle character varying(255) NOT NULL,
    id_etudestrategie integer NOT NULL,
    investissements character varying(255) NOT NULL,
    chronologie character varying(255) NOT NULL,
    note character varying(255) NOT NULL,
    id_objet integer NOT NULL,
    datedestruction date
);


ALTER TABLE etudestrategie OWNER TO vadjango;

--
-- Name: etudestrategie_id_etudestrategie_seq; Type: SEQUENCE; Schema: public; Owner: vadjango
--

CREATE SEQUENCE etudestrategie_id_etudestrategie_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE etudestrategie_id_etudestrategie_seq OWNER TO vadjango;

--
-- Name: etudestrategie_id_etudestrategie_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vadjango
--

ALTER SEQUENCE etudestrategie_id_etudestrategie_seq OWNED BY etudestrategie.id_etudestrategie;


--
-- Name: evenement; Type: TABLE; Schema: public; Owner: vadjango
--

CREATE TABLE evenement (
    datecreation date NOT NULL,
    commentaire character varying(255) NOT NULL,
    libelle character varying(255) NOT NULL,
    id_evenement integer NOT NULL,
    description character varying(255),
    gravite integer NOT NULL,
    ref character varying(255),
    listeparametres character varying(255),
    parametres character varying(255),
    id_objet integer NOT NULL,
    datedestruction date
);


ALTER TABLE evenement OWNER TO vadjango;

--
-- Name: evenement_id_evenement_seq; Type: SEQUENCE; Schema: public; Owner: vadjango
--

CREATE SEQUENCE evenement_id_evenement_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE evenement_id_evenement_seq OWNER TO vadjango;

--
-- Name: evenement_id_evenement_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vadjango
--

ALTER SEQUENCE evenement_id_evenement_seq OWNED BY evenement.id_evenement;


--
-- Name: gestionnaire; Type: TABLE; Schema: public; Owner: vadjango
--

CREATE TABLE gestionnaire (
    datecreation date NOT NULL,
    commentaire character varying(255) NOT NULL,
    libelle character varying(255) NOT NULL,
    id_gestionnaire integer NOT NULL,
    societe character varying(255),
    adresse character varying(255),
    fax character varying(255),
    tel character varying(255),
    nom character varying(255),
    id_objet integer NOT NULL,
    datedestruction date
);


ALTER TABLE gestionnaire OWNER TO vadjango;

--
-- Name: gestionnaire_id_gestionnaire_seq; Type: SEQUENCE; Schema: public; Owner: vadjango
--

CREATE SEQUENCE gestionnaire_id_gestionnaire_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE gestionnaire_id_gestionnaire_seq OWNER TO vadjango;

--
-- Name: gestionnaire_id_gestionnaire_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vadjango
--

ALTER SEQUENCE gestionnaire_id_gestionnaire_seq OWNED BY gestionnaire.id_gestionnaire;


--
-- Name: infralineaire; Type: TABLE; Schema: public; Owner: vadjango
--

CREATE TABLE infralineaire (
    datecreation date NOT NULL,
    commentaire character varying(255) NOT NULL,
    libelle character varying(255) NOT NULL,
    importancestrat character varying(255),
    etatfonct character varying(255),
    datederniereobs date,
    qualitegeoloc numeric(999,500),
    parametres character varying(255),
    listeparametres character varying(255),
    geometry bytea NOT NULL,
    id_infralineaire integer NOT NULL,
    id_descriptionsystem integer NOT NULL,
    id_objet integer NOT NULL,
    datedestruction date
);


ALTER TABLE infralineaire OWNER TO vadjango;

--
-- Name: infralineaire_id_infralineaire_seq; Type: SEQUENCE; Schema: public; Owner: vadjango
--

CREATE SEQUENCE infralineaire_id_infralineaire_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE infralineaire_id_infralineaire_seq OWNER TO vadjango;

--
-- Name: infralineaire_id_infralineaire_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vadjango
--

ALTER SEQUENCE infralineaire_id_infralineaire_seq OWNED BY infralineaire.id_infralineaire;


--
-- Name: messagetiers; Type: TABLE; Schema: public; Owner: vadjango
--

CREATE TABLE messagetiers (
    id_messagetiers integer NOT NULL,
    pub_date timestamp with time zone NOT NULL,
    objet character varying(200) NOT NULL,
    sender character varying(75) NOT NULL,
    text character varying(200) NOT NULL,
    destinataire character varying(255),
    lu boolean NOT NULL,
    id_objet integer NOT NULL
);


ALTER TABLE messagetiers OWNER TO vadjango;

--
-- Name: messagetiers_id_messagetiers_seq; Type: SEQUENCE; Schema: public; Owner: vadjango
--

CREATE SEQUENCE messagetiers_id_messagetiers_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE messagetiers_id_messagetiers_seq OWNER TO vadjango;

--
-- Name: messagetiers_id_messagetiers_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vadjango
--

ALTER SEQUENCE messagetiers_id_messagetiers_seq OWNED BY messagetiers.id_messagetiers;


--
-- Name: modele; Type: TABLE; Schema: public; Owner: vadjango
--

CREATE TABLE modele (
    datecreation date NOT NULL,
    commentaire character varying(255) NOT NULL,
    libelle character varying(255) NOT NULL,
    source character varying(255) NOT NULL,
    contactadresse character varying(255),
    contactnom character varying(255),
    contactmail character varying(255),
    contacttel1 character varying(255),
    contacttel2 character varying(255),
    file bytea NOT NULL,
    description character varying(255),
    geometry bytea NOT NULL,
    id_modele integer NOT NULL,
    logiciel character varying(255) NOT NULL,
    scenario character varying(255),
    conclusions character varying(255),
    id_objet integer NOT NULL,
    id_ressource integer NOT NULL,
    datedestruction date
);


ALTER TABLE modele OWNER TO vadjango;

--
-- Name: modele_id_modele_seq; Type: SEQUENCE; Schema: public; Owner: vadjango
--

CREATE SEQUENCE modele_id_modele_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE modele_id_modele_seq OWNER TO vadjango;

--
-- Name: modele_id_modele_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vadjango
--

ALTER SEQUENCE modele_id_modele_seq OWNED BY modele.id_modele;


--
-- Name: noeud; Type: TABLE; Schema: public; Owner: vadjango
--

CREATE TABLE noeud (
    datecreation date NOT NULL,
    datedestruction date NOT NULL,
    commentaire character varying(255) NOT NULL,
    libelle character varying(255) NOT NULL,
    importancestrat character varying(255),
    etatfonct character varying(255),
    datederniereobs date,
    qualitegeoloc numeric(999,500),
    parametres character varying(255),
    listeparametres character varying(255),
    geometry bytea NOT NULL,
    id_noeud integer NOT NULL,
    id_descriptionsystem integer NOT NULL,
    id_objet integer NOT NULL
);


ALTER TABLE noeud OWNER TO vadjango;

--
-- Name: noeud_id_noeud_seq; Type: SEQUENCE; Schema: public; Owner: vadjango
--

CREATE SEQUENCE noeud_id_noeud_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE noeud_id_noeud_seq OWNER TO vadjango;

--
-- Name: noeud_id_noeud_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vadjango
--

ALTER SEQUENCE noeud_id_noeud_seq OWNED BY noeud.id_noeud;


--
-- Name: objet; Type: TABLE; Schema: public; Owner: vadjango
--

CREATE TABLE objet (
    id_objet integer NOT NULL,
    id_projet integer NOT NULL,
    id_utilisateur integer NOT NULL
);


ALTER TABLE objet OWNER TO vadjango;

--
-- Name: objet_id_objet_seq; Type: SEQUENCE; Schema: public; Owner: vadjango
--

CREATE SEQUENCE objet_id_objet_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE objet_id_objet_seq OWNER TO vadjango;

--
-- Name: objet_id_objet_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vadjango
--

ALTER SEQUENCE objet_id_objet_seq OWNED BY objet.id_objet;


--
-- Name: observation; Type: TABLE; Schema: public; Owner: vadjango
--

CREATE TABLE observation (
    datecreation date NOT NULL,
    commentaire character varying(255) NOT NULL,
    libelle character varying(255) NOT NULL,
    id_observation integer NOT NULL,
    avis character varying(255),
    progression character varying(255),
    travauxnecessaires boolean NOT NULL,
    id_desordre integer,
    id_objet integer NOT NULL,
    datedestruction date
);


ALTER TABLE observation OWNER TO vadjango;

--
-- Name: observation_id_observation_seq; Type: SEQUENCE; Schema: public; Owner: vadjango
--

CREATE SEQUENCE observation_id_observation_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE observation_id_observation_seq OWNER TO vadjango;

--
-- Name: observation_id_observation_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vadjango
--

ALTER SEQUENCE observation_id_observation_seq OWNED BY observation.id_observation;


--
-- Name: photo; Type: TABLE; Schema: public; Owner: vadjango
--

CREATE TABLE photo (
    datecreation date NOT NULL,
    commentaire character varying(255) NOT NULL,
    libelle character varying(255) NOT NULL,
    source character varying(255) NOT NULL,
    contactadresse character varying(255),
    contactnom character varying(255),
    contactmail character varying(255),
    contacttel1 character varying(255),
    contacttel2 character varying(255),
    file bytea NOT NULL,
    description character varying(255),
    geometry bytea NOT NULL,
    id_photo integer NOT NULL,
    id_objet integer NOT NULL,
    id_ressource integer NOT NULL,
    datedestruction date
);


ALTER TABLE photo OWNER TO vadjango;

--
-- Name: photo_id_photo_seq; Type: SEQUENCE; Schema: public; Owner: vadjango
--

CREATE SEQUENCE photo_id_photo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE photo_id_photo_seq OWNER TO vadjango;

--
-- Name: photo_id_photo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vadjango
--

ALTER SEQUENCE photo_id_photo_seq OWNED BY photo.id_photo;


--
-- Name: projet; Type: TABLE; Schema: public; Owner: vadjango
--

CREATE TABLE projet (
    id_projet integer NOT NULL,
    nom character varying(255) NOT NULL,
    datatype character varying(255) NOT NULL,
    version numeric(999,500) NOT NULL,
    dateversion date NOT NULL,
    referantartelia character varying(255),
    contactartelia character varying(255),
    datecreation date NOT NULL,
    client character varying(255),
    contactclient character varying(255),
    localisation character varying(255)
);


ALTER TABLE projet OWNER TO vadjango;

--
-- Name: projet_id_projet_seq; Type: SEQUENCE; Schema: public; Owner: vadjango
--

CREATE SEQUENCE projet_id_projet_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE projet_id_projet_seq OWNER TO vadjango;

--
-- Name: projet_id_projet_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vadjango
--

ALTER SEQUENCE projet_id_projet_seq OWNED BY projet.id_projet;


--
-- Name: rapport; Type: TABLE; Schema: public; Owner: vadjango
--

CREATE TABLE rapport (
    datecreation date NOT NULL,
    commentaire character varying(255) NOT NULL,
    libelle character varying(255) NOT NULL,
    source character varying(255) NOT NULL,
    contactadresse character varying(255),
    contactnom character varying(255),
    contactmail character varying(255),
    contacttel1 character varying(255),
    contacttel2 character varying(255),
    description character varying(255),
    geometry bytea NOT NULL,
    id_rapport integer NOT NULL,
    rapport character varying(100) NOT NULL,
    nom character varying(200) NOT NULL,
    id_objet integer NOT NULL,
    id_ressource integer NOT NULL,
    datedestruction date
);


ALTER TABLE rapport OWNER TO vadjango;

--
-- Name: rapport_id_rapport_seq; Type: SEQUENCE; Schema: public; Owner: vadjango
--

CREATE SEQUENCE rapport_id_rapport_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rapport_id_rapport_seq OWNER TO vadjango;

--
-- Name: rapport_id_rapport_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vadjango
--

ALTER SEQUENCE rapport_id_rapport_seq OWNED BY rapport.id_rapport;


--
-- Name: ressource; Type: TABLE; Schema: public; Owner: vadjango
--

CREATE TABLE ressource (
    id_ressource integer NOT NULL
);


ALTER TABLE ressource OWNER TO vadjango;

--
-- Name: ressource_id_ressource_seq; Type: SEQUENCE; Schema: public; Owner: vadjango
--

CREATE SEQUENCE ressource_id_ressource_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ressource_id_ressource_seq OWNER TO vadjango;

--
-- Name: ressource_id_ressource_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vadjango
--

ALTER SEQUENCE ressource_id_ressource_seq OWNED BY ressource.id_ressource;


--
-- Name: siartelia; Type: TABLE; Schema: public; Owner: vadjango
--

CREATE TABLE siartelia (
    id_siartelia integer NOT NULL
);


ALTER TABLE siartelia OWNER TO vadjango;

--
-- Name: siartelia_id_siartelia_seq; Type: SEQUENCE; Schema: public; Owner: vadjango
--

CREATE SEQUENCE siartelia_id_siartelia_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE siartelia_id_siartelia_seq OWNER TO vadjango;

--
-- Name: siartelia_id_siartelia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vadjango
--

ALTER SEQUENCE siartelia_id_siartelia_seq OWNED BY siartelia.id_siartelia;


--
-- Name: tcdesordredescriptionsystem; Type: TABLE; Schema: public; Owner: vadjango
--

CREATE TABLE tcdesordredescriptionsystem (
    id_tcdesordredescriptionsystem integer NOT NULL,
    id_descriptionsystem integer NOT NULL,
    id_desordre integer NOT NULL
);


ALTER TABLE tcdesordredescriptionsystem OWNER TO vadjango;

--
-- Name: tcdesordredescriptionsystem_id_tcdesordredescriptionsystem_seq; Type: SEQUENCE; Schema: public; Owner: vadjango
--

CREATE SEQUENCE tcdesordredescriptionsystem_id_tcdesordredescriptionsystem_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tcdesordredescriptionsystem_id_tcdesordredescriptionsystem_seq OWNER TO vadjango;

--
-- Name: tcdesordredescriptionsystem_id_tcdesordredescriptionsystem_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vadjango
--

ALTER SEQUENCE tcdesordredescriptionsystem_id_tcdesordredescriptionsystem_seq OWNED BY tcdesordredescriptionsystem.id_tcdesordredescriptionsystem;


--
-- Name: tcetudetravaux; Type: TABLE; Schema: public; Owner: vadjango
--

CREATE TABLE tcetudetravaux (
    id_tcetudetravaux integer NOT NULL,
    dateprogrammation date NOT NULL,
    id_etudestrategie integer NOT NULL,
    id_travaux integer NOT NULL
);


ALTER TABLE tcetudetravaux OWNER TO vadjango;

--
-- Name: tcetudetravaux_id_tcetudetravaux_seq; Type: SEQUENCE; Schema: public; Owner: vadjango
--

CREATE SEQUENCE tcetudetravaux_id_tcetudetravaux_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tcetudetravaux_id_tcetudetravaux_seq OWNER TO vadjango;

--
-- Name: tcetudetravaux_id_tcetudetravaux_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vadjango
--

ALTER SEQUENCE tcetudetravaux_id_tcetudetravaux_seq OWNED BY tcetudetravaux.id_tcetudetravaux;


--
-- Name: tcobjetgestionnaire; Type: TABLE; Schema: public; Owner: vadjango
--

CREATE TABLE tcobjetgestionnaire (
    id_tcobjetgestionnaire integer NOT NULL,
    gestionnaireouproprietaireouprestataire integer NOT NULL,
    id_gestionnaire integer NOT NULL,
    id_oobjet integer NOT NULL
);


ALTER TABLE tcobjetgestionnaire OWNER TO vadjango;

--
-- Name: tcobjetgestionnaire_id_tcobjetgestionnaire_seq; Type: SEQUENCE; Schema: public; Owner: vadjango
--

CREATE SEQUENCE tcobjetgestionnaire_id_tcobjetgestionnaire_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tcobjetgestionnaire_id_tcobjetgestionnaire_seq OWNER TO vadjango;

--
-- Name: tcobjetgestionnaire_id_tcobjetgestionnaire_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vadjango
--

ALTER SEQUENCE tcobjetgestionnaire_id_tcobjetgestionnaire_seq OWNED BY tcobjetgestionnaire.id_tcobjetgestionnaire;


--
-- Name: tcobjetressource; Type: TABLE; Schema: public; Owner: vadjango
--

CREATE TABLE tcobjetressource (
    id_tcobjetressource integer NOT NULL,
    id_oobjet integer NOT NULL,
    id_ressource integer NOT NULL
);


ALTER TABLE tcobjetressource OWNER TO vadjango;

--
-- Name: tcobjetressource_id_tcobjetressource_seq; Type: SEQUENCE; Schema: public; Owner: vadjango
--

CREATE SEQUENCE tcobjetressource_id_tcobjetressource_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tcobjetressource_id_tcobjetressource_seq OWNER TO vadjango;

--
-- Name: tcobjetressource_id_tcobjetressource_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vadjango
--

ALTER SEQUENCE tcobjetressource_id_tcobjetressource_seq OWNED BY tcobjetressource.id_tcobjetressource;


--
-- Name: tcobjetzonegeo; Type: TABLE; Schema: public; Owner: vadjango
--

CREATE TABLE tcobjetzonegeo (
    id_tcobjetzonegeo integer NOT NULL,
    zonetraversee boolean NOT NULL,
    zonemenacee boolean NOT NULL,
    id_objet integer NOT NULL,
    id_zonegeo integer NOT NULL
);


ALTER TABLE tcobjetzonegeo OWNER TO vadjango;

--
-- Name: tcobjetzonegeo_id_tcobjetzonegeo_seq; Type: SEQUENCE; Schema: public; Owner: vadjango
--

CREATE SEQUENCE tcobjetzonegeo_id_tcobjetzonegeo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tcobjetzonegeo_id_tcobjetzonegeo_seq OWNER TO vadjango;

--
-- Name: tcobjetzonegeo_id_tcobjetzonegeo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vadjango
--

ALTER SEQUENCE tcobjetzonegeo_id_tcobjetzonegeo_seq OWNED BY tcobjetzonegeo.id_tcobjetzonegeo;


--
-- Name: tctravauxdescriptionsystem; Type: TABLE; Schema: public; Owner: vadjango
--

CREATE TABLE tctravauxdescriptionsystem (
    id_tctravauxdescriptionsystem integer NOT NULL,
    id_descriptionsystem integer NOT NULL,
    id_travaux integer NOT NULL
);


ALTER TABLE tctravauxdescriptionsystem OWNER TO vadjango;

--
-- Name: tctravauxdescriptionsystem_id_tctravauxdescriptionsystem_seq; Type: SEQUENCE; Schema: public; Owner: vadjango
--

CREATE SEQUENCE tctravauxdescriptionsystem_id_tctravauxdescriptionsystem_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tctravauxdescriptionsystem_id_tctravauxdescriptionsystem_seq OWNER TO vadjango;

--
-- Name: tctravauxdescriptionsystem_id_tctravauxdescriptionsystem_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vadjango
--

ALTER SEQUENCE tctravauxdescriptionsystem_id_tctravauxdescriptionsystem_seq OWNED BY tctravauxdescriptionsystem.id_tctravauxdescriptionsystem;


--
-- Name: topo; Type: TABLE; Schema: public; Owner: vadjango
--

CREATE TABLE topo (
    datecreation date NOT NULL,
    commentaire character varying(255) NOT NULL,
    libelle character varying(255) NOT NULL,
    importancestrat character varying(255),
    etatfonct character varying(255),
    datederniereobs date,
    qualitegeoloc numeric(999,500),
    parametres character varying(255),
    listeparametres character varying(255),
    geometry bytea NOT NULL,
    id_topo integer NOT NULL,
    profillongoutravers boolean NOT NULL,
    listx character varying(255),
    listy character varying(255),
    listz character varying(255),
    listpartie integer NOT NULL,
    id_descriptionsystem integer NOT NULL,
    id_objet integer NOT NULL,
    datedestruction date
);


ALTER TABLE topo OWNER TO vadjango;

--
-- Name: topo_id_topo_seq; Type: SEQUENCE; Schema: public; Owner: vadjango
--

CREATE SEQUENCE topo_id_topo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE topo_id_topo_seq OWNER TO vadjango;

--
-- Name: topo_id_topo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vadjango
--

ALTER SEQUENCE topo_id_topo_seq OWNED BY topo.id_topo;


--
-- Name: travaux; Type: TABLE; Schema: public; Owner: vadjango
--

CREATE TABLE travaux (
    datecreation date NOT NULL,
    commentaire character varying(255) NOT NULL,
    libelle character varying(255) NOT NULL,
    id_travaux integer NOT NULL,
    travauxouinterventiontiers boolean NOT NULL,
    urgence character varying(255),
    duree character varying(255),
    couts numeric(999,500),
    effectues boolean NOT NULL,
    encours boolean NOT NULL,
    programme boolean NOT NULL,
    echeance date,
    datedebut date,
    datefin date,
    id_objet integer NOT NULL,
    id_observation integer NOT NULL,
    datedestruction date
);


ALTER TABLE travaux OWNER TO vadjango;

--
-- Name: travaux_id_travaux_seq; Type: SEQUENCE; Schema: public; Owner: vadjango
--

CREATE SEQUENCE travaux_id_travaux_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE travaux_id_travaux_seq OWNER TO vadjango;

--
-- Name: travaux_id_travaux_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vadjango
--

ALTER SEQUENCE travaux_id_travaux_seq OWNED BY travaux.id_travaux;


--
-- Name: utilisateur; Type: TABLE; Schema: public; Owner: vadjango
--

CREATE TABLE utilisateur (
    id_utilisateur integer NOT NULL,
    id_projet integer NOT NULL,
    id integer NOT NULL
);


ALTER TABLE utilisateur OWNER TO vadjango;

--
-- Name: utilisateur_id_utilisateur_seq; Type: SEQUENCE; Schema: public; Owner: vadjango
--

CREATE SEQUENCE utilisateur_id_utilisateur_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE utilisateur_id_utilisateur_seq OWNER TO vadjango;

--
-- Name: utilisateur_id_utilisateur_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vadjango
--

ALTER SEQUENCE utilisateur_id_utilisateur_seq OWNED BY utilisateur.id_utilisateur;


--
-- Name: video; Type: TABLE; Schema: public; Owner: vadjango
--

CREATE TABLE video (
    datecreation date NOT NULL,
    datedestruction date,
    commentaire character varying(255) NOT NULL,
    libelle character varying(255) NOT NULL,
    source character varying(255) NOT NULL,
    contactadresse character varying(255),
    contactnom character varying(255),
    contactmail character varying(255),
    contacttel1 character varying(255),
    contacttel2 character varying(255),
    description character varying(255),
    geometry bytea NOT NULL,
    id_video integer NOT NULL,
    video character varying(100) NOT NULL,
    nom character varying(200) NOT NULL,
    id_objet integer NOT NULL,
    id_ressource integer NOT NULL
);


ALTER TABLE video OWNER TO vadjango;

--
-- Name: video_id_video_seq; Type: SEQUENCE; Schema: public; Owner: vadjango
--

CREATE SEQUENCE video_id_video_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE video_id_video_seq OWNER TO vadjango;

--
-- Name: video_id_video_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vadjango
--

ALTER SEQUENCE video_id_video_seq OWNED BY video.id_video;


--
-- Name: zonegeo; Type: TABLE; Schema: public; Owner: vadjango
--

CREATE TABLE zonegeo (
    datecreation date NOT NULL,
    commentaire character varying(255) NOT NULL,
    libelle character varying(255) NOT NULL,
    id_zonegeo integer NOT NULL,
    pays character varying(255),
    region character varying(255),
    commune character varying(255),
    nom character varying(255),
    populations character varying(255),
    contextesocioeco character varying(255),
    importancesociale integer NOT NULL,
    importanceindustrielle integer NOT NULL,
    geometry bytea NOT NULL,
    id_objet integer NOT NULL,
    datedestruction date
);


ALTER TABLE zonegeo OWNER TO vadjango;

--
-- Name: zonegeo_id_zonegeo_seq; Type: SEQUENCE; Schema: public; Owner: vadjango
--

CREATE SEQUENCE zonegeo_id_zonegeo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE zonegeo_id_zonegeo_seq OWNER TO vadjango;

--
-- Name: zonegeo_id_zonegeo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vadjango
--

ALTER SEQUENCE zonegeo_id_zonegeo_seq OWNED BY zonegeo.id_zonegeo;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: carto_layer id_layer; Type: DEFAULT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY carto_layer ALTER COLUMN id_layer SET DEFAULT nextval('carto_layer_id_seq'::regclass);


--
-- Name: data id; Type: DEFAULT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY data ALTER COLUMN id SET DEFAULT nextval('data_id_seq'::regclass);


--
-- Name: data_ressource id; Type: DEFAULT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY data_ressource ALTER COLUMN id SET DEFAULT nextval('data_ressource_id_seq'::regclass);


--
-- Name: data_systeme id; Type: DEFAULT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY data_systeme ALTER COLUMN id SET DEFAULT nextval('data_systeme_id_seq'::regclass);


--
-- Name: descriptionsystem id_descriptionsystem; Type: DEFAULT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY descriptionsystem ALTER COLUMN id_descriptionsystem SET DEFAULT nextval('descriptionsystem_id_descriptionsystem_seq'::regclass);


--
-- Name: desordre id_desordre; Type: DEFAULT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY desordre ALTER COLUMN id_desordre SET DEFAULT nextval('desordre_id_desordre_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: environnement id_environnement; Type: DEFAULT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY environnement ALTER COLUMN id_environnement SET DEFAULT nextval('environnement_id_environnement_seq'::regclass);


--
-- Name: equipement id_equipement; Type: DEFAULT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY equipement ALTER COLUMN id_equipement SET DEFAULT nextval('equipement_id_equipement_seq'::regclass);


--
-- Name: etudestrategie id_etudestrategie; Type: DEFAULT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY etudestrategie ALTER COLUMN id_etudestrategie SET DEFAULT nextval('etudestrategie_id_etudestrategie_seq'::regclass);


--
-- Name: evenement id_evenement; Type: DEFAULT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY evenement ALTER COLUMN id_evenement SET DEFAULT nextval('evenement_id_evenement_seq'::regclass);


--
-- Name: gestionnaire id_gestionnaire; Type: DEFAULT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY gestionnaire ALTER COLUMN id_gestionnaire SET DEFAULT nextval('gestionnaire_id_gestionnaire_seq'::regclass);


--
-- Name: infralineaire id_infralineaire; Type: DEFAULT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY infralineaire ALTER COLUMN id_infralineaire SET DEFAULT nextval('infralineaire_id_infralineaire_seq'::regclass);


--
-- Name: messagetiers id_messagetiers; Type: DEFAULT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY messagetiers ALTER COLUMN id_messagetiers SET DEFAULT nextval('messagetiers_id_messagetiers_seq'::regclass);


--
-- Name: modele id_modele; Type: DEFAULT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY modele ALTER COLUMN id_modele SET DEFAULT nextval('modele_id_modele_seq'::regclass);


--
-- Name: noeud id_noeud; Type: DEFAULT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY noeud ALTER COLUMN id_noeud SET DEFAULT nextval('noeud_id_noeud_seq'::regclass);


--
-- Name: objet id_objet; Type: DEFAULT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY objet ALTER COLUMN id_objet SET DEFAULT nextval('objet_id_objet_seq'::regclass);


--
-- Name: observation id_observation; Type: DEFAULT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY observation ALTER COLUMN id_observation SET DEFAULT nextval('observation_id_observation_seq'::regclass);


--
-- Name: photo id_photo; Type: DEFAULT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY photo ALTER COLUMN id_photo SET DEFAULT nextval('photo_id_photo_seq'::regclass);


--
-- Name: projet id_projet; Type: DEFAULT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY projet ALTER COLUMN id_projet SET DEFAULT nextval('projet_id_projet_seq'::regclass);


--
-- Name: rapport id_rapport; Type: DEFAULT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY rapport ALTER COLUMN id_rapport SET DEFAULT nextval('rapport_id_rapport_seq'::regclass);


--
-- Name: ressource id_ressource; Type: DEFAULT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY ressource ALTER COLUMN id_ressource SET DEFAULT nextval('ressource_id_ressource_seq'::regclass);


--
-- Name: siartelia id_siartelia; Type: DEFAULT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY siartelia ALTER COLUMN id_siartelia SET DEFAULT nextval('siartelia_id_siartelia_seq'::regclass);


--
-- Name: tcdesordredescriptionsystem id_tcdesordredescriptionsystem; Type: DEFAULT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY tcdesordredescriptionsystem ALTER COLUMN id_tcdesordredescriptionsystem SET DEFAULT nextval('tcdesordredescriptionsystem_id_tcdesordredescriptionsystem_seq'::regclass);


--
-- Name: tcetudetravaux id_tcetudetravaux; Type: DEFAULT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY tcetudetravaux ALTER COLUMN id_tcetudetravaux SET DEFAULT nextval('tcetudetravaux_id_tcetudetravaux_seq'::regclass);


--
-- Name: tcobjetgestionnaire id_tcobjetgestionnaire; Type: DEFAULT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY tcobjetgestionnaire ALTER COLUMN id_tcobjetgestionnaire SET DEFAULT nextval('tcobjetgestionnaire_id_tcobjetgestionnaire_seq'::regclass);


--
-- Name: tcobjetressource id_tcobjetressource; Type: DEFAULT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY tcobjetressource ALTER COLUMN id_tcobjetressource SET DEFAULT nextval('tcobjetressource_id_tcobjetressource_seq'::regclass);


--
-- Name: tcobjetzonegeo id_tcobjetzonegeo; Type: DEFAULT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY tcobjetzonegeo ALTER COLUMN id_tcobjetzonegeo SET DEFAULT nextval('tcobjetzonegeo_id_tcobjetzonegeo_seq'::regclass);


--
-- Name: tctravauxdescriptionsystem id_tctravauxdescriptionsystem; Type: DEFAULT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY tctravauxdescriptionsystem ALTER COLUMN id_tctravauxdescriptionsystem SET DEFAULT nextval('tctravauxdescriptionsystem_id_tctravauxdescriptionsystem_seq'::regclass);


--
-- Name: topo id_topo; Type: DEFAULT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY topo ALTER COLUMN id_topo SET DEFAULT nextval('topo_id_topo_seq'::regclass);


--
-- Name: travaux id_travaux; Type: DEFAULT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY travaux ALTER COLUMN id_travaux SET DEFAULT nextval('travaux_id_travaux_seq'::regclass);


--
-- Name: utilisateur id_utilisateur; Type: DEFAULT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY utilisateur ALTER COLUMN id_utilisateur SET DEFAULT nextval('utilisateur_id_utilisateur_seq'::regclass);


--
-- Name: video id_video; Type: DEFAULT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY video ALTER COLUMN id_video SET DEFAULT nextval('video_id_video_seq'::regclass);


--
-- Name: zonegeo id_zonegeo; Type: DEFAULT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY zonegeo ALTER COLUMN id_zonegeo SET DEFAULT nextval('zonegeo_id_zonegeo_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: vadjango
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vadjango
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: vadjango
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vadjango
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: vadjango
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add data	7	add_data
20	Can change data	7	change_data
21	Can delete data	7	delete_data
22	Can add data ressource	8	add_dataressource
23	Can change data ressource	8	change_dataressource
24	Can delete data ressource	8	delete_dataressource
25	Can add data systeme	9	add_datasysteme
26	Can change data systeme	9	change_datasysteme
27	Can delete data systeme	9	delete_datasysteme
28	Can add layer	10	add_layer
29	Can change layer	10	change_layer
30	Can delete layer	10	delete_layer
31	Can add siartelia	11	add_siartelia
32	Can change siartelia	11	change_siartelia
33	Can delete siartelia	11	delete_siartelia
34	Can add modele	12	add_modele
35	Can change modele	12	change_modele
36	Can delete modele	12	delete_modele
37	Can add projet	13	add_projet
38	Can change projet	13	change_projet
39	Can delete projet	13	delete_projet
40	Can add ressource	14	add_ressource
41	Can change ressource	14	change_ressource
42	Can delete ressource	14	delete_ressource
43	Can add noeud	15	add_noeud
44	Can change noeud	15	change_noeud
45	Can delete noeud	15	delete_noeud
46	Can add descriptionsystem	16	add_descriptionsystem
47	Can change descriptionsystem	16	change_descriptionsystem
48	Can delete descriptionsystem	16	delete_descriptionsystem
49	Can add topo	17	add_topo
50	Can change topo	17	change_topo
51	Can delete topo	17	delete_topo
52	Can add infralineaire	18	add_infralineaire
53	Can change infralineaire	18	change_infralineaire
54	Can delete infralineaire	18	delete_infralineaire
55	Can add evenement	19	add_evenement
56	Can change evenement	19	change_evenement
57	Can delete evenement	19	delete_evenement
58	Can add desordre	20	add_desordre
59	Can change desordre	20	change_desordre
60	Can delete desordre	20	delete_desordre
61	Can add environnement	21	add_environnement
62	Can change environnement	21	change_environnement
63	Can delete environnement	21	delete_environnement
64	Can add travaux	22	add_travaux
65	Can change travaux	22	change_travaux
66	Can delete travaux	22	delete_travaux
67	Can add messagetiers	23	add_messagetiers
68	Can change messagetiers	23	change_messagetiers
69	Can delete messagetiers	23	delete_messagetiers
70	Can add equipement	24	add_equipement
71	Can change equipement	24	change_equipement
72	Can delete equipement	24	delete_equipement
73	Can add gestionnaire	25	add_gestionnaire
74	Can change gestionnaire	25	change_gestionnaire
75	Can delete gestionnaire	25	delete_gestionnaire
76	Can add photo	26	add_photo
77	Can change photo	26	change_photo
78	Can delete photo	26	delete_photo
79	Can add utilisateur	27	add_utilisateur
80	Can change utilisateur	27	change_utilisateur
81	Can delete utilisateur	27	delete_utilisateur
82	Can add etudestrategie	28	add_etudestrategie
83	Can change etudestrategie	28	change_etudestrategie
84	Can delete etudestrategie	28	delete_etudestrategie
85	Can add objet	29	add_objet
86	Can change objet	29	change_objet
87	Can delete objet	29	delete_objet
88	Can add zonegeo	30	add_zonegeo
89	Can change zonegeo	30	change_zonegeo
90	Can delete zonegeo	30	delete_zonegeo
91	Can add observation	31	add_observation
92	Can change observation	31	change_observation
93	Can delete observation	31	delete_observation
94	Can add rapport	32	add_rapport
95	Can change rapport	32	change_rapport
96	Can delete rapport	32	delete_rapport
97	Can add tcetudetravaux	33	add_tcetudetravaux
98	Can change tcetudetravaux	33	change_tcetudetravaux
99	Can delete tcetudetravaux	33	delete_tcetudetravaux
100	Can add tcdesordredescriptionsystem	34	add_tcdesordredescriptionsystem
101	Can change tcdesordredescriptionsystem	34	change_tcdesordredescriptionsystem
102	Can delete tcdesordredescriptionsystem	34	delete_tcdesordredescriptionsystem
103	Can add tctravauxdescriptionsystem	35	add_tctravauxdescriptionsystem
104	Can change tctravauxdescriptionsystem	35	change_tctravauxdescriptionsystem
105	Can delete tctravauxdescriptionsystem	35	delete_tctravauxdescriptionsystem
106	Can add tcobjetgestionnaire	36	add_tcobjetgestionnaire
107	Can change tcobjetgestionnaire	36	change_tcobjetgestionnaire
108	Can delete tcobjetgestionnaire	36	delete_tcobjetgestionnaire
109	Can add tcobjetzonegeo	37	add_tcobjetzonegeo
110	Can change tcobjetzonegeo	37	change_tcobjetzonegeo
111	Can delete tcobjetzonegeo	37	delete_tcobjetzonegeo
112	Can add tcobjetressource	38	add_tcobjetressource
113	Can change tcobjetressource	38	change_tcobjetressource
114	Can delete tcobjetressource	38	delete_tcobjetressource
115	Can add video	39	add_video
116	Can change video	39	change_video
117	Can delete video	39	delete_video
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vadjango
--

SELECT pg_catalog.setval('auth_permission_id_seq', 117, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: vadjango
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$36000$jpDaxXcYmkM3$sNglxFrzHxGQUbbnC2dVwvKnxTCESmf9/QRh6vGXmmo=	\N	f	vistieur				f	t	2017-09-29 15:07:41.519526+02
1	pbkdf2_sha256$36000$SOI1ltSaRtnD$PbQapf9QW2zaDTFRK0bN8WqK8e2dRzzVLjGL7dmdx5U=	2017-10-04 10:44:48.576231+02	t	valentin.anjou	''valentin"	''anjou"	''valentin.anjou@arteliagroup.com"	t	t	2017-09-29 15:06:19.305484+02
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: vadjango
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vadjango
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vadjango
--

SELECT pg_catalog.setval('auth_user_id_seq', 2, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: vadjango
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vadjango
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: carto_layer; Type: TABLE DATA; Schema: public; Owner: vadjango
--

COPY carto_layer (id_layer, name, ref, id_objet, datecreation, datedestruction, commentaire, libelle) FROM stdin;
4	test	troncons	10	2017-10-01	\N	Resultats de la VTA des digues de Bordeaux	Res VTA
3	Tronçons de Bordeaux	troncons	11	2017-10-05	\N	Analyse des données collectées lors de la VTA des digues de Bordeaux	Analyse VTA
\.


--
-- Name: carto_layer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vadjango
--

SELECT pg_catalog.setval('carto_layer_id_seq', 4, true);


--
-- Data for Name: data; Type: TABLE DATA; Schema: public; Owner: vadjango
--

COPY data (id, datecreation, commentaire, libelle, datedestruction) FROM stdin;
\.


--
-- Name: data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vadjango
--

SELECT pg_catalog.setval('data_id_seq', 1, false);


--
-- Data for Name: data_ressource; Type: TABLE DATA; Schema: public; Owner: vadjango
--

COPY data_ressource (id, datecreation, commentaire, libelle, source, contactadresse, contactnom, contactmail, contacttel1, contacttel2, file, description, geometry, datedestruction) FROM stdin;
\.


--
-- Name: data_ressource_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vadjango
--

SELECT pg_catalog.setval('data_ressource_id_seq', 1, false);


--
-- Data for Name: data_systeme; Type: TABLE DATA; Schema: public; Owner: vadjango
--

COPY data_systeme (id, datecreation, commentaire, libelle, importancestrat, etatfonct, datederniereobs, qualitegeoloc, parametres, listeparametres, geometry, datedestruction) FROM stdin;
\.


--
-- Name: data_systeme_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vadjango
--

SELECT pg_catalog.setval('data_systeme_id_seq', 1, false);


--
-- Data for Name: descriptionsystem; Type: TABLE DATA; Schema: public; Owner: vadjango
--

COPY descriptionsystem (id_descriptionsystem) FROM stdin;
\.


--
-- Name: descriptionsystem_id_descriptionsystem_seq; Type: SEQUENCE SET; Schema: public; Owner: vadjango
--

SELECT pg_catalog.setval('descriptionsystem_id_descriptionsystem_seq', 1, false);


--
-- Data for Name: desordre; Type: TABLE DATA; Schema: public; Owner: vadjango
--

COPY desordre (datecreation, commentaire, libelle, id_desordre, impact, gravite, priorite, risques, geometry, id_evenement, id_objet, datedestruction) FROM stdin;
\.


--
-- Name: desordre_id_desordre_seq; Type: SEQUENCE SET; Schema: public; Owner: vadjango
--

SELECT pg_catalog.setval('desordre_id_desordre_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: vadjango
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2017-09-29 15:06:48.488398+02	1	Tronçons de Bordeaux	1	[{"added": {}}]	10	1
2	2017-09-29 15:06:53.868598+02	2	test	1	[{"added": {}}]	10	1
3	2017-09-29 15:07:41.535161+02	2	vistieur	1	[{"added": {}}]	4	1
4	2017-09-29 16:08:39.39264+02	1	Projet object	1	[{"added": {}}]	13	1
5	2017-09-29 16:09:13.453189+02	1	Utilisateur object	1	[{"added": {}}]	27	1
6	2017-09-29 16:12:08.145486+02	1	Objet object	1	[{"added": {}}]	29	1
7	2017-09-29 16:12:12.433943+02	1	Ressource object	1	[{"added": {}}]	14	1
8	2017-09-29 16:12:36.052345+02	2	Gantt Test	1	[{"added": {}}]	32	1
9	2017-09-29 16:40:59.954607+02	2	Gantt.xlsx	2	[{"changed": {"fields": ["nom"]}}]	32	1
10	2017-09-29 16:41:15.515416+02	2	Gantt	2	[{"changed": {"fields": ["nom"]}}]	32	1
11	2017-09-29 16:41:25.665233+02	2	Gantt	2	[]	32	1
12	2017-10-04 10:45:07.007213+02	2	Objet object	1	[{"added": {}}]	29	1
13	2017-10-04 10:45:23.539405+02	1	ceci est un test	1	[{"added": {}}]	23	1
14	2017-10-04 10:45:50.655635+02	3	Objet object	1	[{"added": {}}]	29	1
15	2017-10-04 10:45:53.738515+02	2	ceci est un test	1	[{"added": {}}]	23	1
16	2017-10-04 10:46:04.076795+02	1	ceci est un test 2	2	[{"changed": {"fields": ["question_text"]}}]	23	1
17	2017-10-04 11:28:05.776698+02	4	Objet object	1	[{"added": {}}]	29	1
18	2017-10-04 11:31:27.671379+02	5	Objet object	1	[{"added": {}}]	29	1
19	2017-10-04 11:33:26.328977+02	4	Gestionnaire object	1	[{"added": {}}]	25	1
20	2017-10-04 11:35:59.511197+02	6	Objet object	1	[{"added": {}}]	29	1
21	2017-10-04 11:36:01.1342+02	4	Gestionnaire object	2	[{"changed": {"fields": ["commentaire", "libelle", "societe", "adresse", "tel", "id_objet"]}}]	25	1
22	2017-10-04 11:42:02.418426+02	7	Objet object	1	[{"added": {}}]	29	1
23	2017-10-04 11:42:03.914957+02	5	Gestionnaire object	1	[{"added": {}}]	25	1
24	2017-10-04 13:28:34.42131+02	8	8	1	[{"added": {}}]	29	1
25	2017-10-04 13:37:21.576772+02	2	VTA	1	[{"added": {}}]	19	1
26	2017-10-04 13:37:53.079954+02	2	VTA	2	[{"changed": {"fields": ["description"]}}]	19	1
27	2017-10-04 13:52:32.801861+02	9	9	1	[{"added": {}}]	29	1
28	2017-10-04 13:52:34.183323+02	3	IT	1	[{"added": {}}]	19	1
29	2017-10-04 14:04:35.037099+02	2	test	3		10	1
30	2017-10-04 14:04:35.04979+02	1	Tronçons de Bordeaux	3		10	1
31	2017-10-04 14:28:39.310535+02	3	Tronçons de Bordeaux	1	[{"added": {}}]	10	1
32	2017-10-04 14:28:43.791528+02	4	test	1	[{"added": {}}]	10	1
33	2017-10-04 14:33:41.735103+02	10	10	1	[{"added": {}}]	29	1
34	2017-10-04 14:33:47.121953+02	11	11	1	[{"added": {}}]	29	1
35	2017-10-04 14:35:27.525741+02	4	test	2	[{"changed": {"fields": ["id_objet"]}}]	10	1
36	2017-10-04 14:35:32.604309+02	3	Tronçons de Bordeaux	2	[{"changed": {"fields": ["id_objet"]}}]	10	1
37	2017-10-05 11:30:37.874245+02	2	Gantt	2	[{"changed": {"fields": ["commentaire", "libelle"]}}]	32	1
38	2017-10-05 11:31:09.437302+02	12	12	1	[{"added": {}}]	29	1
39	2017-10-05 11:31:13.563157+02	2	2	1	[{"added": {}}]	14	1
40	2017-10-05 11:31:28.952068+02	3	Gantt.xlsx	1	[{"added": {}}]	32	1
41	2017-10-05 11:31:40.397331+02	3	Rapport final	2	[{"changed": {"fields": ["nom"]}}]	32	1
42	2017-10-05 12:39:59.873414+02	4	test	2	[{"changed": {"fields": ["commentaire", "libelle", "datecreation"]}}]	10	1
43	2017-10-05 12:40:27.296998+02	3	Tronçons de Bordeaux	2	[{"changed": {"fields": ["commentaire", "libelle"]}}]	10	1
44	2017-10-09 13:19:39.222+02	18	18	1	[{"added": {}}]	29	1
45	2017-10-09 13:19:42.741084+02	3	3	1	[{"added": {}}]	14	1
46	2017-10-09 13:21:02.631073+02	1	Video_Photogrammetrie	1	[{"added": {}}]	39	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vadjango
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 46, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: vadjango
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	carto	data
8	carto	dataressource
9	carto	datasysteme
10	carto	layer
11	carto	siartelia
12	carto	modele
13	carto	projet
14	carto	ressource
15	carto	noeud
16	carto	descriptionsystem
17	carto	topo
18	carto	infralineaire
19	carto	evenement
20	carto	desordre
21	carto	environnement
22	carto	travaux
23	carto	messagetiers
24	carto	equipement
25	carto	gestionnaire
26	carto	photo
27	carto	utilisateur
28	carto	etudestrategie
29	carto	objet
30	carto	zonegeo
31	carto	observation
32	carto	rapport
33	carto	tcetudetravaux
34	carto	tcdesordredescriptionsystem
35	carto	tctravauxdescriptionsystem
36	carto	tcobjetgestionnaire
37	carto	tcobjetzonegeo
38	carto	tcobjetressource
39	carto	video
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vadjango
--

SELECT pg_catalog.setval('django_content_type_id_seq', 39, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: vadjango
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2017-09-29 14:52:58.016412+02
2	auth	0001_initial	2017-09-29 14:52:58.163262+02
3	admin	0001_initial	2017-09-29 14:52:58.200646+02
4	admin	0002_logentry_remove_auto_add	2017-09-29 14:52:58.200646+02
5	contenttypes	0002_remove_content_type_name	2017-09-29 14:52:58.23204+02
6	auth	0002_alter_permission_name_max_length	2017-09-29 14:52:58.23204+02
7	auth	0003_alter_user_email_max_length	2017-09-29 14:52:58.23204+02
8	auth	0004_alter_user_username_opts	2017-09-29 14:52:58.247635+02
9	auth	0005_alter_user_last_login_null	2017-09-29 14:52:58.263263+02
10	auth	0006_require_contenttypes_0002	2017-09-29 14:52:58.263263+02
11	auth	0007_alter_validators_add_error_messages	2017-09-29 14:52:58.263263+02
12	auth	0008_alter_user_username_max_length	2017-09-29 14:52:58.278906+02
13	carto	0001_initial	2017-09-29 14:57:27.854034+02
14	sessions	0001_initial	2017-09-29 14:57:27.891406+02
15	carto	0002_auto_20171004_0905	2017-10-04 09:06:00.457593+02
16	carto	0003_auto_20171004_1117	2017-10-04 11:17:08.159844+02
17	carto	0004_auto_20171004_1125	2017-10-04 11:25:27.036782+02
18	carto	0005_auto_20171004_1129	2017-10-04 11:29:23.084457+02
19	carto	0006_auto_20171004_1130	2017-10-04 11:30:21.358962+02
20	carto	0007_auto_20171004_1134	2017-10-04 11:35:23.761487+02
21	carto	0008_auto_20171004_1135	2017-10-04 11:35:24.926428+02
22	carto	0009_layer_id_objet	2017-10-04 14:34:45.344162+02
23	carto	0010_remove_rapport_file	2017-10-05 09:48:36.969822+02
24	carto	0011_auto_20171005_1229	2017-10-05 12:29:11.98041+02
25	carto	0012_remove_messagetiers_question_text	2017-10-06 09:17:51.273191+02
26	carto	0013_video	2017-10-09 13:18:15.526379+02
27	carto	0014_auto_20171009_1320	2017-10-09 13:20:41.246575+02
28	carto	0015_video	2017-10-09 13:20:55.245171+02
29	carto	0016_auto_20171010_0857	2017-10-10 08:57:47.920366+02
30	carto	0017_projet_localisation	2017-10-10 09:06:38.115029+02
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vadjango
--

SELECT pg_catalog.setval('django_migrations_id_seq', 30, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: vadjango
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
8b1fccpbm2lnl6ttjfz1w29532t4ausg	MDk0Y2M1MDc5M2Q2ZmRmNWQ3MjI3N2I4YjNhMDNlNjQ0MDc1NjM0Mzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkNzQ5MTE3NGQ0NmRiMDYwMjJmNGQ4MGI1ZGRmMDIzZWQyN2VhM2UzIn0=	2017-10-18 10:44:48.578737+02
\.


--
-- Data for Name: environnement; Type: TABLE DATA; Schema: public; Owner: vadjango
--

COPY environnement (datecreation, commentaire, libelle, importancestrat, etatfonct, datederniereobs, qualitegeoloc, parametres, listeparametres, geometry, id_environnement, noeudoulineaire, id_descriptionsystem, id_lineaire, id_noeud, id_objet, datedestruction) FROM stdin;
\.


--
-- Name: environnement_id_environnement_seq; Type: SEQUENCE SET; Schema: public; Owner: vadjango
--

SELECT pg_catalog.setval('environnement_id_environnement_seq', 1, false);


--
-- Data for Name: equipement; Type: TABLE DATA; Schema: public; Owner: vadjango
--

COPY equipement (datecreation, commentaire, libelle, importancestrat, etatfonct, datederniereobs, qualitegeoloc, parametres, listeparametres, geometry, id_equipement, noeudoulineaire, id_descriptionsystem, id_lineaire, id_noeud, id_objet, datedestruction) FROM stdin;
\.


--
-- Name: equipement_id_equipement_seq; Type: SEQUENCE SET; Schema: public; Owner: vadjango
--

SELECT pg_catalog.setval('equipement_id_equipement_seq', 1, false);


--
-- Data for Name: etudestrategie; Type: TABLE DATA; Schema: public; Owner: vadjango
--

COPY etudestrategie (datecreation, commentaire, libelle, id_etudestrategie, investissements, chronologie, note, id_objet, datedestruction) FROM stdin;
\.


--
-- Name: etudestrategie_id_etudestrategie_seq; Type: SEQUENCE SET; Schema: public; Owner: vadjango
--

SELECT pg_catalog.setval('etudestrategie_id_etudestrategie_seq', 1, false);


--
-- Data for Name: evenement; Type: TABLE DATA; Schema: public; Owner: vadjango
--

COPY evenement (datecreation, commentaire, libelle, id_evenement, description, gravite, ref, listeparametres, parametres, id_objet, datedestruction) FROM stdin;
2017-10-04	VTA	VTA	2	VTA de la digue ouest	2	\N	\N	\N	8	\N
2017-10-27	Intervention Tiers	IT	3	Intervention sur le réseau téléphonique de la digue est	0	\N	\N	\N	9	\N
\.


--
-- Name: evenement_id_evenement_seq; Type: SEQUENCE SET; Schema: public; Owner: vadjango
--

SELECT pg_catalog.setval('evenement_id_evenement_seq', 3, true);


--
-- Data for Name: gestionnaire; Type: TABLE DATA; Schema: public; Owner: vadjango
--

COPY gestionnaire (datecreation, commentaire, libelle, id_gestionnaire, societe, adresse, fax, tel, nom, id_objet, datedestruction) FROM stdin;
2017-10-04	Prestataire		4	ARTELIA	6 rue de Lorraine	\N	06 73 47 83 92	test	6	\N
2017-10-04	Gestionnaire du système		5	SystemCompanie	43 rue François 1er	\N	06 73 47 83 92	XXX	7	\N
\.


--
-- Name: gestionnaire_id_gestionnaire_seq; Type: SEQUENCE SET; Schema: public; Owner: vadjango
--

SELECT pg_catalog.setval('gestionnaire_id_gestionnaire_seq', 5, true);


--
-- Data for Name: infralineaire; Type: TABLE DATA; Schema: public; Owner: vadjango
--

COPY infralineaire (datecreation, commentaire, libelle, importancestrat, etatfonct, datederniereobs, qualitegeoloc, parametres, listeparametres, geometry, id_infralineaire, id_descriptionsystem, id_objet, datedestruction) FROM stdin;
\.


--
-- Name: infralineaire_id_infralineaire_seq; Type: SEQUENCE SET; Schema: public; Owner: vadjango
--

SELECT pg_catalog.setval('infralineaire_id_infralineaire_seq', 1, false);


--
-- Data for Name: messagetiers; Type: TABLE DATA; Schema: public; Owner: vadjango
--

COPY messagetiers (id_messagetiers, pub_date, objet, sender, text, destinataire, lu, id_objet) FROM stdin;
1	2017-10-04 10:45:20+02	Bienvenue	ARTELIA	Bienvenue sur votre space de gestion patrimoniale. Vous pourrez retrouver ici l'ensemble des outils pour mieux piloter vos ouvrages et préparer efficacement demain dès aujourd'hui.	\N	t	2
3	2017-10-06 12:19:01.012171+02	Bienvenue	te	tesdgesrd"z	Demonstrateur	f	15
4	2017-10-06 12:19:09.691106+02	Bienvenue	hd	Bienvenue sur votre space de gestion patrimoniale. Vous pourrez retrouver ici l'ensemble des outils pour mieux piloter vos ouvrages et préparer efficacement demain dès aujourd'hui.	Demonstrateur	t	16
5	2017-10-06 12:19:57.842909+02	Découvrez plus de fonctionnalités	ARTELIA	tesdgesrd"z	Demonstrateur	f	17
\.


--
-- Name: messagetiers_id_messagetiers_seq; Type: SEQUENCE SET; Schema: public; Owner: vadjango
--

SELECT pg_catalog.setval('messagetiers_id_messagetiers_seq', 5, true);


--
-- Data for Name: modele; Type: TABLE DATA; Schema: public; Owner: vadjango
--

COPY modele (datecreation, commentaire, libelle, source, contactadresse, contactnom, contactmail, contacttel1, contacttel2, file, description, geometry, id_modele, logiciel, scenario, conclusions, id_objet, id_ressource, datedestruction) FROM stdin;
\.


--
-- Name: modele_id_modele_seq; Type: SEQUENCE SET; Schema: public; Owner: vadjango
--

SELECT pg_catalog.setval('modele_id_modele_seq', 1, false);


--
-- Data for Name: noeud; Type: TABLE DATA; Schema: public; Owner: vadjango
--

COPY noeud (datecreation, datedestruction, commentaire, libelle, importancestrat, etatfonct, datederniereobs, qualitegeoloc, parametres, listeparametres, geometry, id_noeud, id_descriptionsystem, id_objet) FROM stdin;
\.


--
-- Name: noeud_id_noeud_seq; Type: SEQUENCE SET; Schema: public; Owner: vadjango
--

SELECT pg_catalog.setval('noeud_id_noeud_seq', 1, false);


--
-- Data for Name: objet; Type: TABLE DATA; Schema: public; Owner: vadjango
--

COPY objet (id_objet, id_projet, id_utilisateur) FROM stdin;
1	1	1
2	1	1
3	1	1
4	1	1
5	1	1
6	1	1
7	1	1
8	1	1
9	1	1
10	1	1
11	1	1
12	1	1
15	1	1
16	1	1
17	1	1
18	1	1
\.


--
-- Name: objet_id_objet_seq; Type: SEQUENCE SET; Schema: public; Owner: vadjango
--

SELECT pg_catalog.setval('objet_id_objet_seq', 18, true);


--
-- Data for Name: observation; Type: TABLE DATA; Schema: public; Owner: vadjango
--

COPY observation (datecreation, commentaire, libelle, id_observation, avis, progression, travauxnecessaires, id_desordre, id_objet, datedestruction) FROM stdin;
\.


--
-- Name: observation_id_observation_seq; Type: SEQUENCE SET; Schema: public; Owner: vadjango
--

SELECT pg_catalog.setval('observation_id_observation_seq', 1, false);


--
-- Data for Name: photo; Type: TABLE DATA; Schema: public; Owner: vadjango
--

COPY photo (datecreation, commentaire, libelle, source, contactadresse, contactnom, contactmail, contacttel1, contacttel2, file, description, geometry, id_photo, id_objet, id_ressource, datedestruction) FROM stdin;
\.


--
-- Name: photo_id_photo_seq; Type: SEQUENCE SET; Schema: public; Owner: vadjango
--

SELECT pg_catalog.setval('photo_id_photo_seq', 1, false);


--
-- Data for Name: projet; Type: TABLE DATA; Schema: public; Owner: vadjango
--

COPY projet (id_projet, nom, datatype, version, dateversion, referantartelia, contactartelia, datecreation, client, contactclient, localisation) FROM stdin;
1	Demonstrateur	digues	0.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006	2017-09-29	Valentin Anjou	valentin.anjou@arteliagroup.com	2017-09-29	SMAAA	mairie.lugnylescharolles@ozone.net	Arconce, Bourgogne-Franche-Comté
\.


--
-- Name: projet_id_projet_seq; Type: SEQUENCE SET; Schema: public; Owner: vadjango
--

SELECT pg_catalog.setval('projet_id_projet_seq', 1, true);


--
-- Data for Name: rapport; Type: TABLE DATA; Schema: public; Owner: vadjango
--

COPY rapport (datecreation, commentaire, libelle, source, contactadresse, contactnom, contactmail, contacttel1, contacttel2, description, geometry, id_rapport, rapport, nom, id_objet, id_ressource, datedestruction) FROM stdin;
2017-09-29	Rapport de première analyse des résultats de la VTA	Rapport préliminaire	V.Anjou	\N	\N	\N	\N	\N	\N	\\x	2	Gantt_2rkv4xG.xlsx	Gantt	1	1	\N
2017-10-05	Rapport final de VTA ouest	Rapport final	V.Anjou	\N	\N	\N	\N	\N	\N	\\x	3	Gantt_I7DQwRN.xlsx	Rapport final	12	2	\N
\.


--
-- Name: rapport_id_rapport_seq; Type: SEQUENCE SET; Schema: public; Owner: vadjango
--

SELECT pg_catalog.setval('rapport_id_rapport_seq', 3, true);


--
-- Data for Name: ressource; Type: TABLE DATA; Schema: public; Owner: vadjango
--

COPY ressource (id_ressource) FROM stdin;
1
2
3
\.


--
-- Name: ressource_id_ressource_seq; Type: SEQUENCE SET; Schema: public; Owner: vadjango
--

SELECT pg_catalog.setval('ressource_id_ressource_seq', 3, true);


--
-- Data for Name: siartelia; Type: TABLE DATA; Schema: public; Owner: vadjango
--

COPY siartelia (id_siartelia) FROM stdin;
\.


--
-- Name: siartelia_id_siartelia_seq; Type: SEQUENCE SET; Schema: public; Owner: vadjango
--

SELECT pg_catalog.setval('siartelia_id_siartelia_seq', 1, false);


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Data for Name: tcdesordredescriptionsystem; Type: TABLE DATA; Schema: public; Owner: vadjango
--

COPY tcdesordredescriptionsystem (id_tcdesordredescriptionsystem, id_descriptionsystem, id_desordre) FROM stdin;
\.


--
-- Name: tcdesordredescriptionsystem_id_tcdesordredescriptionsystem_seq; Type: SEQUENCE SET; Schema: public; Owner: vadjango
--

SELECT pg_catalog.setval('tcdesordredescriptionsystem_id_tcdesordredescriptionsystem_seq', 1, false);


--
-- Data for Name: tcetudetravaux; Type: TABLE DATA; Schema: public; Owner: vadjango
--

COPY tcetudetravaux (id_tcetudetravaux, dateprogrammation, id_etudestrategie, id_travaux) FROM stdin;
\.


--
-- Name: tcetudetravaux_id_tcetudetravaux_seq; Type: SEQUENCE SET; Schema: public; Owner: vadjango
--

SELECT pg_catalog.setval('tcetudetravaux_id_tcetudetravaux_seq', 1, false);


--
-- Data for Name: tcobjetgestionnaire; Type: TABLE DATA; Schema: public; Owner: vadjango
--

COPY tcobjetgestionnaire (id_tcobjetgestionnaire, gestionnaireouproprietaireouprestataire, id_gestionnaire, id_oobjet) FROM stdin;
\.


--
-- Name: tcobjetgestionnaire_id_tcobjetgestionnaire_seq; Type: SEQUENCE SET; Schema: public; Owner: vadjango
--

SELECT pg_catalog.setval('tcobjetgestionnaire_id_tcobjetgestionnaire_seq', 1, false);


--
-- Data for Name: tcobjetressource; Type: TABLE DATA; Schema: public; Owner: vadjango
--

COPY tcobjetressource (id_tcobjetressource, id_oobjet, id_ressource) FROM stdin;
\.


--
-- Name: tcobjetressource_id_tcobjetressource_seq; Type: SEQUENCE SET; Schema: public; Owner: vadjango
--

SELECT pg_catalog.setval('tcobjetressource_id_tcobjetressource_seq', 1, false);


--
-- Data for Name: tcobjetzonegeo; Type: TABLE DATA; Schema: public; Owner: vadjango
--

COPY tcobjetzonegeo (id_tcobjetzonegeo, zonetraversee, zonemenacee, id_objet, id_zonegeo) FROM stdin;
\.


--
-- Name: tcobjetzonegeo_id_tcobjetzonegeo_seq; Type: SEQUENCE SET; Schema: public; Owner: vadjango
--

SELECT pg_catalog.setval('tcobjetzonegeo_id_tcobjetzonegeo_seq', 1, false);


--
-- Data for Name: tctravauxdescriptionsystem; Type: TABLE DATA; Schema: public; Owner: vadjango
--

COPY tctravauxdescriptionsystem (id_tctravauxdescriptionsystem, id_descriptionsystem, id_travaux) FROM stdin;
\.


--
-- Name: tctravauxdescriptionsystem_id_tctravauxdescriptionsystem_seq; Type: SEQUENCE SET; Schema: public; Owner: vadjango
--

SELECT pg_catalog.setval('tctravauxdescriptionsystem_id_tctravauxdescriptionsystem_seq', 1, false);


--
-- Data for Name: topo; Type: TABLE DATA; Schema: public; Owner: vadjango
--

COPY topo (datecreation, commentaire, libelle, importancestrat, etatfonct, datederniereobs, qualitegeoloc, parametres, listeparametres, geometry, id_topo, profillongoutravers, listx, listy, listz, listpartie, id_descriptionsystem, id_objet, datedestruction) FROM stdin;
\.


--
-- Name: topo_id_topo_seq; Type: SEQUENCE SET; Schema: public; Owner: vadjango
--

SELECT pg_catalog.setval('topo_id_topo_seq', 1, false);


--
-- Data for Name: travaux; Type: TABLE DATA; Schema: public; Owner: vadjango
--

COPY travaux (datecreation, commentaire, libelle, id_travaux, travauxouinterventiontiers, urgence, duree, couts, effectues, encours, programme, echeance, datedebut, datefin, id_objet, id_observation, datedestruction) FROM stdin;
\.


--
-- Name: travaux_id_travaux_seq; Type: SEQUENCE SET; Schema: public; Owner: vadjango
--

SELECT pg_catalog.setval('travaux_id_travaux_seq', 1, false);


--
-- Data for Name: utilisateur; Type: TABLE DATA; Schema: public; Owner: vadjango
--

COPY utilisateur (id_utilisateur, id_projet, id) FROM stdin;
1	1	1
2	1	2
\.


--
-- Name: utilisateur_id_utilisateur_seq; Type: SEQUENCE SET; Schema: public; Owner: vadjango
--

SELECT pg_catalog.setval('utilisateur_id_utilisateur_seq', 1, true);


--
-- Data for Name: video; Type: TABLE DATA; Schema: public; Owner: vadjango
--

COPY video (datecreation, datedestruction, commentaire, libelle, source, contactadresse, contactnom, contactmail, contacttel1, contacttel2, description, geometry, id_video, video, nom, id_objet, id_ressource) FROM stdin;
2017-10-09	\N	Video photogrammétrie	Video_Photogrammetrie	ARTEDRONES	\N	\N	\N	\N	\N	Video de présentation de la photogrammétrie et de l'usage des drones	\\x	1	teaser_artelia_juin_iHHDhhd.mp4	Video_Photogrammetrie	18	3
\.


--
-- Name: video_id_video_seq; Type: SEQUENCE SET; Schema: public; Owner: vadjango
--

SELECT pg_catalog.setval('video_id_video_seq', 1, true);


--
-- Data for Name: zonegeo; Type: TABLE DATA; Schema: public; Owner: vadjango
--

COPY zonegeo (datecreation, commentaire, libelle, id_zonegeo, pays, region, commune, nom, populations, contextesocioeco, importancesociale, importanceindustrielle, geometry, id_objet, datedestruction) FROM stdin;
\.


--
-- Name: zonegeo_id_zonegeo_seq; Type: SEQUENCE SET; Schema: public; Owner: vadjango
--

SELECT pg_catalog.setval('zonegeo_id_zonegeo_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: carto_layer carto_layer_pkey; Type: CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY carto_layer
    ADD CONSTRAINT carto_layer_pkey PRIMARY KEY (id_layer);


--
-- Name: data data_pkey; Type: CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY data
    ADD CONSTRAINT data_pkey PRIMARY KEY (id);


--
-- Name: data_ressource data_ressource_pkey; Type: CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY data_ressource
    ADD CONSTRAINT data_ressource_pkey PRIMARY KEY (id);


--
-- Name: data_systeme data_systeme_pkey; Type: CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY data_systeme
    ADD CONSTRAINT data_systeme_pkey PRIMARY KEY (id);


--
-- Name: descriptionsystem descriptionsystem_pkey; Type: CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY descriptionsystem
    ADD CONSTRAINT descriptionsystem_pkey PRIMARY KEY (id_descriptionsystem);


--
-- Name: desordre desordre_pkey; Type: CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY desordre
    ADD CONSTRAINT desordre_pkey PRIMARY KEY (id_desordre);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: environnement environnement_pkey; Type: CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY environnement
    ADD CONSTRAINT environnement_pkey PRIMARY KEY (id_environnement);


--
-- Name: equipement equipement_pkey; Type: CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY equipement
    ADD CONSTRAINT equipement_pkey PRIMARY KEY (id_equipement);


--
-- Name: etudestrategie etudestrategie_pkey; Type: CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY etudestrategie
    ADD CONSTRAINT etudestrategie_pkey PRIMARY KEY (id_etudestrategie);


--
-- Name: evenement evenement_pkey; Type: CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY evenement
    ADD CONSTRAINT evenement_pkey PRIMARY KEY (id_evenement);


--
-- Name: gestionnaire gestionnaire_pkey; Type: CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY gestionnaire
    ADD CONSTRAINT gestionnaire_pkey PRIMARY KEY (id_gestionnaire);


--
-- Name: infralineaire infralineaire_pkey; Type: CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY infralineaire
    ADD CONSTRAINT infralineaire_pkey PRIMARY KEY (id_infralineaire);


--
-- Name: messagetiers messagetiers_pkey; Type: CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY messagetiers
    ADD CONSTRAINT messagetiers_pkey PRIMARY KEY (id_messagetiers);


--
-- Name: modele modele_pkey; Type: CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY modele
    ADD CONSTRAINT modele_pkey PRIMARY KEY (id_modele);


--
-- Name: noeud noeud_pkey; Type: CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY noeud
    ADD CONSTRAINT noeud_pkey PRIMARY KEY (id_noeud);


--
-- Name: objet objet_pkey; Type: CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY objet
    ADD CONSTRAINT objet_pkey PRIMARY KEY (id_objet);


--
-- Name: observation observation_pkey; Type: CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY observation
    ADD CONSTRAINT observation_pkey PRIMARY KEY (id_observation);


--
-- Name: photo photo_pkey; Type: CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY photo
    ADD CONSTRAINT photo_pkey PRIMARY KEY (id_photo);


--
-- Name: projet projet_pkey; Type: CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY projet
    ADD CONSTRAINT projet_pkey PRIMARY KEY (id_projet);


--
-- Name: rapport rapport_pkey; Type: CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY rapport
    ADD CONSTRAINT rapport_pkey PRIMARY KEY (id_rapport);


--
-- Name: ressource ressource_pkey; Type: CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY ressource
    ADD CONSTRAINT ressource_pkey PRIMARY KEY (id_ressource);


--
-- Name: siartelia siartelia_pkey; Type: CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY siartelia
    ADD CONSTRAINT siartelia_pkey PRIMARY KEY (id_siartelia);


--
-- Name: tcdesordredescriptionsystem tcdesordredescriptionsystem_pkey; Type: CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY tcdesordredescriptionsystem
    ADD CONSTRAINT tcdesordredescriptionsystem_pkey PRIMARY KEY (id_tcdesordredescriptionsystem);


--
-- Name: tcetudetravaux tcetudetravaux_pkey; Type: CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY tcetudetravaux
    ADD CONSTRAINT tcetudetravaux_pkey PRIMARY KEY (id_tcetudetravaux);


--
-- Name: tcobjetgestionnaire tcobjetgestionnaire_pkey; Type: CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY tcobjetgestionnaire
    ADD CONSTRAINT tcobjetgestionnaire_pkey PRIMARY KEY (id_tcobjetgestionnaire);


--
-- Name: tcobjetressource tcobjetressource_pkey; Type: CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY tcobjetressource
    ADD CONSTRAINT tcobjetressource_pkey PRIMARY KEY (id_tcobjetressource);


--
-- Name: tcobjetzonegeo tcobjetzonegeo_pkey; Type: CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY tcobjetzonegeo
    ADD CONSTRAINT tcobjetzonegeo_pkey PRIMARY KEY (id_tcobjetzonegeo);


--
-- Name: tctravauxdescriptionsystem tctravauxdescriptionsystem_pkey; Type: CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY tctravauxdescriptionsystem
    ADD CONSTRAINT tctravauxdescriptionsystem_pkey PRIMARY KEY (id_tctravauxdescriptionsystem);


--
-- Name: topo topo_pkey; Type: CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY topo
    ADD CONSTRAINT topo_pkey PRIMARY KEY (id_topo);


--
-- Name: travaux travaux_pkey; Type: CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY travaux
    ADD CONSTRAINT travaux_pkey PRIMARY KEY (id_travaux);


--
-- Name: utilisateur utilisateur_pkey; Type: CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY utilisateur
    ADD CONSTRAINT utilisateur_pkey PRIMARY KEY (id_utilisateur);


--
-- Name: video video_pkey; Type: CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY video
    ADD CONSTRAINT video_pkey PRIMARY KEY (id_video);


--
-- Name: zonegeo zonegeo_pkey; Type: CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY zonegeo
    ADD CONSTRAINT zonegeo_pkey PRIMARY KEY (id_zonegeo);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX auth_user_groups_group_id_97559544 ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: desordre_id_evenement_58eaef6f; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX desordre_id_evenement_58eaef6f ON desordre USING btree (id_evenement);


--
-- Name: desordre_id_objet_4935646c; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX desordre_id_objet_4935646c ON desordre USING btree (id_objet);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX django_session_expire_date_a5c62663 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: environnement_id_descriptionsystem_53e74046; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX environnement_id_descriptionsystem_53e74046 ON environnement USING btree (id_descriptionsystem);


--
-- Name: environnement_id_lineaire_fe407f61; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX environnement_id_lineaire_fe407f61 ON environnement USING btree (id_lineaire);


--
-- Name: environnement_id_noeud_9e283268; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX environnement_id_noeud_9e283268 ON environnement USING btree (id_noeud);


--
-- Name: environnement_id_objet_187ea580; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX environnement_id_objet_187ea580 ON environnement USING btree (id_objet);


--
-- Name: equipement_id_descriptionsystem_88827106; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX equipement_id_descriptionsystem_88827106 ON equipement USING btree (id_descriptionsystem);


--
-- Name: equipement_id_lineaire_b8d2f9e4; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX equipement_id_lineaire_b8d2f9e4 ON equipement USING btree (id_lineaire);


--
-- Name: equipement_id_noeud_c9e2bee4; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX equipement_id_noeud_c9e2bee4 ON equipement USING btree (id_noeud);


--
-- Name: equipement_id_objet_4a9dd239; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX equipement_id_objet_4a9dd239 ON equipement USING btree (id_objet);


--
-- Name: etudestrategie_id_objet_c2e905de; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX etudestrategie_id_objet_c2e905de ON etudestrategie USING btree (id_objet);


--
-- Name: evenement_id_objet_4cb0787d; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX evenement_id_objet_4cb0787d ON evenement USING btree (id_objet);


--
-- Name: gestionnaire_id_objet_9a77b4dd; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX gestionnaire_id_objet_9a77b4dd ON gestionnaire USING btree (id_objet);


--
-- Name: infralineaire_id_descriptionsystem_bce54a86; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX infralineaire_id_descriptionsystem_bce54a86 ON infralineaire USING btree (id_descriptionsystem);


--
-- Name: infralineaire_id_objet_e75ceac4; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX infralineaire_id_objet_e75ceac4 ON infralineaire USING btree (id_objet);


--
-- Name: messagetiers_id_objet_3192c772; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX messagetiers_id_objet_3192c772 ON messagetiers USING btree (id_objet);


--
-- Name: modele_id_objet_886334c9; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX modele_id_objet_886334c9 ON modele USING btree (id_objet);


--
-- Name: modele_id_ressource_11e495d0; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX modele_id_ressource_11e495d0 ON modele USING btree (id_ressource);


--
-- Name: noeud_id_descriptionsystem_85a0b5ad; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX noeud_id_descriptionsystem_85a0b5ad ON noeud USING btree (id_descriptionsystem);


--
-- Name: noeud_id_objet_2f41ee9c; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX noeud_id_objet_2f41ee9c ON noeud USING btree (id_objet);


--
-- Name: objet_id_projet_46fe87ac; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX objet_id_projet_46fe87ac ON objet USING btree (id_projet);


--
-- Name: objet_id_utilisateur_a7ec91b4; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX objet_id_utilisateur_a7ec91b4 ON objet USING btree (id_utilisateur);


--
-- Name: observation_id_desordre_53c40f4a; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX observation_id_desordre_53c40f4a ON observation USING btree (id_desordre);


--
-- Name: observation_id_objet_46ca203e; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX observation_id_objet_46ca203e ON observation USING btree (id_objet);


--
-- Name: photo_id_objet_1e3ca50e; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX photo_id_objet_1e3ca50e ON photo USING btree (id_objet);


--
-- Name: photo_id_ressource_4226b5bf; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX photo_id_ressource_4226b5bf ON photo USING btree (id_ressource);


--
-- Name: rapport_id_objet_476d3896; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX rapport_id_objet_476d3896 ON rapport USING btree (id_objet);


--
-- Name: rapport_id_ressource_94a95928; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX rapport_id_ressource_94a95928 ON rapport USING btree (id_ressource);


--
-- Name: tcdesordredescriptionsystem_id_descriptionsystem_b21dc0fa; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX tcdesordredescriptionsystem_id_descriptionsystem_b21dc0fa ON tcdesordredescriptionsystem USING btree (id_descriptionsystem);


--
-- Name: tcdesordredescriptionsystem_id_desordre_fa12e430; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX tcdesordredescriptionsystem_id_desordre_fa12e430 ON tcdesordredescriptionsystem USING btree (id_desordre);


--
-- Name: tcetudetravaux_id_etudestrategie_cd51c5e1; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX tcetudetravaux_id_etudestrategie_cd51c5e1 ON tcetudetravaux USING btree (id_etudestrategie);


--
-- Name: tcetudetravaux_id_travaux_91d77a24; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX tcetudetravaux_id_travaux_91d77a24 ON tcetudetravaux USING btree (id_travaux);


--
-- Name: tcobjetgestionnaire_id_gestionnaire_4eccade3; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX tcobjetgestionnaire_id_gestionnaire_4eccade3 ON tcobjetgestionnaire USING btree (id_gestionnaire);


--
-- Name: tcobjetgestionnaire_id_oobjet_fda5346e; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX tcobjetgestionnaire_id_oobjet_fda5346e ON tcobjetgestionnaire USING btree (id_oobjet);


--
-- Name: tcobjetressource_id_oobjet_4911921f; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX tcobjetressource_id_oobjet_4911921f ON tcobjetressource USING btree (id_oobjet);


--
-- Name: tcobjetressource_id_ressource_04dbcbd1; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX tcobjetressource_id_ressource_04dbcbd1 ON tcobjetressource USING btree (id_ressource);


--
-- Name: tcobjetzonegeo_id_objet_4b224445; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX tcobjetzonegeo_id_objet_4b224445 ON tcobjetzonegeo USING btree (id_objet);


--
-- Name: tcobjetzonegeo_id_zonegeo_b7ec629c; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX tcobjetzonegeo_id_zonegeo_b7ec629c ON tcobjetzonegeo USING btree (id_zonegeo);


--
-- Name: tctravauxdescriptionsystem_id_descriptionsystem_61ed5a92; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX tctravauxdescriptionsystem_id_descriptionsystem_61ed5a92 ON tctravauxdescriptionsystem USING btree (id_descriptionsystem);


--
-- Name: tctravauxdescriptionsystem_id_travaux_3a35bb07; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX tctravauxdescriptionsystem_id_travaux_3a35bb07 ON tctravauxdescriptionsystem USING btree (id_travaux);


--
-- Name: topo_id_descriptionsystem_9f4254a7; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX topo_id_descriptionsystem_9f4254a7 ON topo USING btree (id_descriptionsystem);


--
-- Name: topo_id_objet_9874bbf2; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX topo_id_objet_9874bbf2 ON topo USING btree (id_objet);


--
-- Name: travaux_id_objet_14fdea4d; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX travaux_id_objet_14fdea4d ON travaux USING btree (id_objet);


--
-- Name: travaux_id_observation_e4065803; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX travaux_id_observation_e4065803 ON travaux USING btree (id_observation);


--
-- Name: utilisateur_id_b8cab2c1; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX utilisateur_id_b8cab2c1 ON utilisateur USING btree (id);


--
-- Name: utilisateur_id_projet_9a7d97a5; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX utilisateur_id_projet_9a7d97a5 ON utilisateur USING btree (id_projet);


--
-- Name: video_id_objet_2aff7fef; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX video_id_objet_2aff7fef ON video USING btree (id_objet);


--
-- Name: video_id_ressource_4e1b7a9e; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX video_id_ressource_4e1b7a9e ON video USING btree (id_ressource);


--
-- Name: zonegeo_id_objet_3c53237f; Type: INDEX; Schema: public; Owner: vadjango
--

CREATE INDEX zonegeo_id_objet_3c53237f ON zonegeo USING btree (id_objet);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: desordre desordre_id_evenement_58eaef6f_fk_evenement_id_evenement; Type: FK CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY desordre
    ADD CONSTRAINT desordre_id_evenement_58eaef6f_fk_evenement_id_evenement FOREIGN KEY (id_evenement) REFERENCES evenement(id_evenement) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: desordre desordre_id_objet_4935646c_fk_objet_id_objet; Type: FK CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY desordre
    ADD CONSTRAINT desordre_id_objet_4935646c_fk_objet_id_objet FOREIGN KEY (id_objet) REFERENCES objet(id_objet) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: environnement environnement_id_descriptionsystem_53e74046_fk_descripti; Type: FK CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY environnement
    ADD CONSTRAINT environnement_id_descriptionsystem_53e74046_fk_descripti FOREIGN KEY (id_descriptionsystem) REFERENCES descriptionsystem(id_descriptionsystem) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: environnement environnement_id_lineaire_fe407f61_fk_infraline; Type: FK CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY environnement
    ADD CONSTRAINT environnement_id_lineaire_fe407f61_fk_infraline FOREIGN KEY (id_lineaire) REFERENCES infralineaire(id_infralineaire) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: environnement environnement_id_noeud_9e283268_fk_noeud_id_noeud; Type: FK CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY environnement
    ADD CONSTRAINT environnement_id_noeud_9e283268_fk_noeud_id_noeud FOREIGN KEY (id_noeud) REFERENCES noeud(id_noeud) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: environnement environnement_id_objet_187ea580_fk_objet_id_objet; Type: FK CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY environnement
    ADD CONSTRAINT environnement_id_objet_187ea580_fk_objet_id_objet FOREIGN KEY (id_objet) REFERENCES objet(id_objet) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: equipement equipement_id_descriptionsystem_88827106_fk_descripti; Type: FK CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY equipement
    ADD CONSTRAINT equipement_id_descriptionsystem_88827106_fk_descripti FOREIGN KEY (id_descriptionsystem) REFERENCES descriptionsystem(id_descriptionsystem) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: equipement equipement_id_lineaire_b8d2f9e4_fk_infraline; Type: FK CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY equipement
    ADD CONSTRAINT equipement_id_lineaire_b8d2f9e4_fk_infraline FOREIGN KEY (id_lineaire) REFERENCES infralineaire(id_infralineaire) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: equipement equipement_id_noeud_c9e2bee4_fk_noeud_id_noeud; Type: FK CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY equipement
    ADD CONSTRAINT equipement_id_noeud_c9e2bee4_fk_noeud_id_noeud FOREIGN KEY (id_noeud) REFERENCES noeud(id_noeud) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: equipement equipement_id_objet_4a9dd239_fk_objet_id_objet; Type: FK CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY equipement
    ADD CONSTRAINT equipement_id_objet_4a9dd239_fk_objet_id_objet FOREIGN KEY (id_objet) REFERENCES objet(id_objet) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: etudestrategie etudestrategie_id_objet_c2e905de_fk_objet_id_objet; Type: FK CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY etudestrategie
    ADD CONSTRAINT etudestrategie_id_objet_c2e905de_fk_objet_id_objet FOREIGN KEY (id_objet) REFERENCES objet(id_objet) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: evenement evenement_id_objet_4cb0787d_fk_objet_id_objet; Type: FK CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY evenement
    ADD CONSTRAINT evenement_id_objet_4cb0787d_fk_objet_id_objet FOREIGN KEY (id_objet) REFERENCES objet(id_objet) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: gestionnaire gestionnaire_id_objet_9a77b4dd_fk_objet_id_objet; Type: FK CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY gestionnaire
    ADD CONSTRAINT gestionnaire_id_objet_9a77b4dd_fk_objet_id_objet FOREIGN KEY (id_objet) REFERENCES objet(id_objet) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: infralineaire infralineaire_id_descriptionsystem_bce54a86_fk_descripti; Type: FK CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY infralineaire
    ADD CONSTRAINT infralineaire_id_descriptionsystem_bce54a86_fk_descripti FOREIGN KEY (id_descriptionsystem) REFERENCES descriptionsystem(id_descriptionsystem) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: infralineaire infralineaire_id_objet_e75ceac4_fk_objet_id_objet; Type: FK CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY infralineaire
    ADD CONSTRAINT infralineaire_id_objet_e75ceac4_fk_objet_id_objet FOREIGN KEY (id_objet) REFERENCES objet(id_objet) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: messagetiers messagetiers_id_objet_3192c772_fk_objet_id_objet; Type: FK CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY messagetiers
    ADD CONSTRAINT messagetiers_id_objet_3192c772_fk_objet_id_objet FOREIGN KEY (id_objet) REFERENCES objet(id_objet) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: modele modele_id_objet_886334c9_fk_objet_id_objet; Type: FK CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY modele
    ADD CONSTRAINT modele_id_objet_886334c9_fk_objet_id_objet FOREIGN KEY (id_objet) REFERENCES objet(id_objet) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: modele modele_id_ressource_11e495d0_fk_ressource_id_ressource; Type: FK CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY modele
    ADD CONSTRAINT modele_id_ressource_11e495d0_fk_ressource_id_ressource FOREIGN KEY (id_ressource) REFERENCES ressource(id_ressource) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: noeud noeud_id_descriptionsystem_85a0b5ad_fk_descripti; Type: FK CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY noeud
    ADD CONSTRAINT noeud_id_descriptionsystem_85a0b5ad_fk_descripti FOREIGN KEY (id_descriptionsystem) REFERENCES descriptionsystem(id_descriptionsystem) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: noeud noeud_id_objet_2f41ee9c_fk_objet_id_objet; Type: FK CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY noeud
    ADD CONSTRAINT noeud_id_objet_2f41ee9c_fk_objet_id_objet FOREIGN KEY (id_objet) REFERENCES objet(id_objet) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: objet objet_id_projet_46fe87ac_fk_projet_id_projet; Type: FK CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY objet
    ADD CONSTRAINT objet_id_projet_46fe87ac_fk_projet_id_projet FOREIGN KEY (id_projet) REFERENCES projet(id_projet) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: objet objet_id_utilisateur_a7ec91b4_fk_utilisateur_id_utilisateur; Type: FK CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY objet
    ADD CONSTRAINT objet_id_utilisateur_a7ec91b4_fk_utilisateur_id_utilisateur FOREIGN KEY (id_utilisateur) REFERENCES utilisateur(id_utilisateur) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: observation observation_id_desordre_53c40f4a_fk_desordre_id_desordre; Type: FK CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY observation
    ADD CONSTRAINT observation_id_desordre_53c40f4a_fk_desordre_id_desordre FOREIGN KEY (id_desordre) REFERENCES desordre(id_desordre) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: observation observation_id_objet_46ca203e_fk_objet_id_objet; Type: FK CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY observation
    ADD CONSTRAINT observation_id_objet_46ca203e_fk_objet_id_objet FOREIGN KEY (id_objet) REFERENCES objet(id_objet) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: photo photo_id_objet_1e3ca50e_fk_objet_id_objet; Type: FK CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY photo
    ADD CONSTRAINT photo_id_objet_1e3ca50e_fk_objet_id_objet FOREIGN KEY (id_objet) REFERENCES objet(id_objet) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: photo photo_id_ressource_4226b5bf_fk_ressource_id_ressource; Type: FK CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY photo
    ADD CONSTRAINT photo_id_ressource_4226b5bf_fk_ressource_id_ressource FOREIGN KEY (id_ressource) REFERENCES ressource(id_ressource) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rapport rapport_id_objet_476d3896_fk_objet_id_objet; Type: FK CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY rapport
    ADD CONSTRAINT rapport_id_objet_476d3896_fk_objet_id_objet FOREIGN KEY (id_objet) REFERENCES objet(id_objet) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: rapport rapport_id_ressource_94a95928_fk_ressource_id_ressource; Type: FK CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY rapport
    ADD CONSTRAINT rapport_id_ressource_94a95928_fk_ressource_id_ressource FOREIGN KEY (id_ressource) REFERENCES ressource(id_ressource) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tcdesordredescriptionsystem tcdesordredescriptio_id_descriptionsystem_b21dc0fa_fk_descripti; Type: FK CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY tcdesordredescriptionsystem
    ADD CONSTRAINT tcdesordredescriptio_id_descriptionsystem_b21dc0fa_fk_descripti FOREIGN KEY (id_descriptionsystem) REFERENCES descriptionsystem(id_descriptionsystem) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tcdesordredescriptionsystem tcdesordredescriptio_id_desordre_fa12e430_fk_desordre_; Type: FK CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY tcdesordredescriptionsystem
    ADD CONSTRAINT tcdesordredescriptio_id_desordre_fa12e430_fk_desordre_ FOREIGN KEY (id_desordre) REFERENCES desordre(id_desordre) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tcetudetravaux tcetudetravaux_id_etudestrategie_cd51c5e1_fk_etudestra; Type: FK CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY tcetudetravaux
    ADD CONSTRAINT tcetudetravaux_id_etudestrategie_cd51c5e1_fk_etudestra FOREIGN KEY (id_etudestrategie) REFERENCES etudestrategie(id_etudestrategie) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tcetudetravaux tcetudetravaux_id_travaux_91d77a24_fk_travaux_id_travaux; Type: FK CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY tcetudetravaux
    ADD CONSTRAINT tcetudetravaux_id_travaux_91d77a24_fk_travaux_id_travaux FOREIGN KEY (id_travaux) REFERENCES travaux(id_travaux) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tcobjetgestionnaire tcobjetgestionnaire_id_gestionnaire_4eccade3_fk_gestionna; Type: FK CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY tcobjetgestionnaire
    ADD CONSTRAINT tcobjetgestionnaire_id_gestionnaire_4eccade3_fk_gestionna FOREIGN KEY (id_gestionnaire) REFERENCES gestionnaire(id_gestionnaire) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tcobjetgestionnaire tcobjetgestionnaire_id_oobjet_fda5346e_fk_objet_id_objet; Type: FK CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY tcobjetgestionnaire
    ADD CONSTRAINT tcobjetgestionnaire_id_oobjet_fda5346e_fk_objet_id_objet FOREIGN KEY (id_oobjet) REFERENCES objet(id_objet) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tcobjetressource tcobjetressource_id_oobjet_4911921f_fk_objet_id_objet; Type: FK CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY tcobjetressource
    ADD CONSTRAINT tcobjetressource_id_oobjet_4911921f_fk_objet_id_objet FOREIGN KEY (id_oobjet) REFERENCES objet(id_objet) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tcobjetressource tcobjetressource_id_ressource_04dbcbd1_fk_ressource; Type: FK CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY tcobjetressource
    ADD CONSTRAINT tcobjetressource_id_ressource_04dbcbd1_fk_ressource FOREIGN KEY (id_ressource) REFERENCES ressource(id_ressource) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tcobjetzonegeo tcobjetzonegeo_id_objet_4b224445_fk_objet_id_objet; Type: FK CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY tcobjetzonegeo
    ADD CONSTRAINT tcobjetzonegeo_id_objet_4b224445_fk_objet_id_objet FOREIGN KEY (id_objet) REFERENCES objet(id_objet) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tcobjetzonegeo tcobjetzonegeo_id_zonegeo_b7ec629c_fk_zonegeo_id_zonegeo; Type: FK CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY tcobjetzonegeo
    ADD CONSTRAINT tcobjetzonegeo_id_zonegeo_b7ec629c_fk_zonegeo_id_zonegeo FOREIGN KEY (id_zonegeo) REFERENCES zonegeo(id_zonegeo) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tctravauxdescriptionsystem tctravauxdescription_id_descriptionsystem_61ed5a92_fk_descripti; Type: FK CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY tctravauxdescriptionsystem
    ADD CONSTRAINT tctravauxdescription_id_descriptionsystem_61ed5a92_fk_descripti FOREIGN KEY (id_descriptionsystem) REFERENCES descriptionsystem(id_descriptionsystem) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tctravauxdescriptionsystem tctravauxdescription_id_travaux_3a35bb07_fk_travaux_i; Type: FK CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY tctravauxdescriptionsystem
    ADD CONSTRAINT tctravauxdescription_id_travaux_3a35bb07_fk_travaux_i FOREIGN KEY (id_travaux) REFERENCES travaux(id_travaux) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: topo topo_id_descriptionsystem_9f4254a7_fk_descripti; Type: FK CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY topo
    ADD CONSTRAINT topo_id_descriptionsystem_9f4254a7_fk_descripti FOREIGN KEY (id_descriptionsystem) REFERENCES descriptionsystem(id_descriptionsystem) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: topo topo_id_objet_9874bbf2_fk_objet_id_objet; Type: FK CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY topo
    ADD CONSTRAINT topo_id_objet_9874bbf2_fk_objet_id_objet FOREIGN KEY (id_objet) REFERENCES objet(id_objet) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: travaux travaux_id_objet_14fdea4d_fk_objet_id_objet; Type: FK CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY travaux
    ADD CONSTRAINT travaux_id_objet_14fdea4d_fk_objet_id_objet FOREIGN KEY (id_objet) REFERENCES objet(id_objet) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: travaux travaux_id_observation_e4065803_fk_observation_id_observation; Type: FK CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY travaux
    ADD CONSTRAINT travaux_id_observation_e4065803_fk_observation_id_observation FOREIGN KEY (id_observation) REFERENCES observation(id_observation) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: utilisateur utilisateur_id_b8cab2c1_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY utilisateur
    ADD CONSTRAINT utilisateur_id_b8cab2c1_fk_auth_user_id FOREIGN KEY (id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: utilisateur utilisateur_id_projet_9a7d97a5_fk_projet_id_projet; Type: FK CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY utilisateur
    ADD CONSTRAINT utilisateur_id_projet_9a7d97a5_fk_projet_id_projet FOREIGN KEY (id_projet) REFERENCES projet(id_projet) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: video video_id_objet_2aff7fef_fk_objet_id_objet; Type: FK CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY video
    ADD CONSTRAINT video_id_objet_2aff7fef_fk_objet_id_objet FOREIGN KEY (id_objet) REFERENCES objet(id_objet) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: video video_id_ressource_4e1b7a9e_fk_ressource_id_ressource; Type: FK CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY video
    ADD CONSTRAINT video_id_ressource_4e1b7a9e_fk_ressource_id_ressource FOREIGN KEY (id_ressource) REFERENCES ressource(id_ressource) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: zonegeo zonegeo_id_objet_3c53237f_fk_objet_id_objet; Type: FK CONSTRAINT; Schema: public; Owner: vadjango
--

ALTER TABLE ONLY zonegeo
    ADD CONSTRAINT zonegeo_id_objet_3c53237f_fk_objet_id_objet FOREIGN KEY (id_objet) REFERENCES objet(id_objet) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

