SET
statement_timeout = 0;
SET
lock_timeout = 0;
SET
idle_in_transaction_session_timeout = 0;
SET
client_encoding = 'UTF8';
SET
standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET
check_function_bodies = false;
SET
xmloption = content;
SET
client_min_messages = warning;
SET
row_security = off;

--
-- Name: fuzzystrmatch; Type: EXTENSION; Schema: -; Owner: -
--

CREATE
EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;


--
-- Name: EXTENSION fuzzystrmatch; Type: COMMENT; Schema: -; Owner: -
--

COMMENT
ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';


--
-- Name: pg_trgm; Type: EXTENSION; Schema: -; Owner: -
--

CREATE
EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;


--
-- Name: EXTENSION pg_trgm; Type: COMMENT; Schema: -; Owner: -
--

COMMENT
ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';


SET
default_tablespace = '';

SET
default_table_access_method = heap;

--
-- Name: action_text_rich_texts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.action_text_rich_texts
(
    id          bigint            NOT NULL,
    name        character varying NOT NULL,
    body        text,
    record_type character varying NOT NULL,
    record_id   bigint            NOT NULL,
    created_at  timestamp(6) without time zone NOT NULL,
    updated_at  timestamp(6) without time zone NOT NULL
);


--
-- Name: action_text_rich_texts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.action_text_rich_texts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE CACHE 1;


--
-- Name: action_text_rich_texts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.action_text_rich_texts_id_seq OWNED BY public.action_text_rich_texts.id;


--
-- Name: active_admin_comments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_admin_comments
(
    id            bigint NOT NULL,
    namespace     character varying,
    body          text,
    resource_type character varying,
    resource_id   bigint,
    author_type   character varying,
    author_id     bigint,
    created_at    timestamp(6) without time zone NOT NULL,
    updated_at    timestamp(6) without time zone NOT NULL
);


--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_admin_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE CACHE 1;


--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_admin_comments_id_seq OWNED BY public.active_admin_comments.id;


--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_attachments
(
    id          bigint            NOT NULL,
    name        character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id   bigint            NOT NULL,
    blob_id     bigint            NOT NULL,
    created_at  timestamp(6) without time zone NOT NULL
);


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE CACHE 1;


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_blobs
(
    id           bigint            NOT NULL,
    key          character varying NOT NULL,
    filename     character varying NOT NULL,
    content_type character varying,
    metadata     text,
    service_name character varying NOT NULL,
    byte_size    bigint            NOT NULL,
    checksum     character varying,
    created_at   timestamp(6) without time zone NOT NULL
);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE CACHE 1;


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: active_storage_variant_records; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_variant_records
(
    id               bigint            NOT NULL,
    blob_id          bigint            NOT NULL,
    variation_digest character varying NOT NULL
);


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_variant_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE CACHE 1;


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_variant_records_id_seq OWNED BY public.active_storage_variant_records.id;


--
-- Name: admin_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.admin_users
(
    id                     bigint NOT NULL,
    email                  character varying DEFAULT '':: character varying NOT NULL,
    encrypted_password     character varying DEFAULT '':: character varying NOT NULL,
    reset_password_token   character varying,
    reset_password_sent_at timestamp(6) without time zone,
    remember_created_at    timestamp(6) without time zone,
    created_at             timestamp(6) without time zone NOT NULL,
    updated_at             timestamp(6) without time zone NOT NULL,
    username               character varying
);


--
-- Name: admin_users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.admin_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE CACHE 1;


--
-- Name: admin_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.admin_users_id_seq OWNED BY public.admin_users.id;


--
-- Name: ahoy_events; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ahoy_events
(
    id         bigint NOT NULL,
    visit_id   bigint,
    user_id    bigint,
    name       character varying,
    properties jsonb,
    "time"     timestamp(6) without time zone
);


--
-- Name: ahoy_events_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ahoy_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE CACHE 1;


--
-- Name: ahoy_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ahoy_events_id_seq OWNED BY public.ahoy_events.id;


--
-- Name: ahoy_visits; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ahoy_visits
(
    id               bigint NOT NULL,
    visit_token      character varying,
    visitor_token    character varying,
    user_id          bigint,
    ip               character varying,
    user_agent       text,
    referrer         text,
    referring_domain character varying,
    landing_page     text,
    browser          character varying,
    os               character varying,
    device_type      character varying,
    country          character varying,
    region           character varying,
    city             character varying,
    latitude         double precision,
    longitude        double precision,
    utm_source       character varying,
    utm_medium       character varying,
    utm_term         character varying,
    utm_content      character varying,
    utm_campaign     character varying,
    app_version      character varying,
    os_version       character varying,
    platform         character varying,
    started_at       timestamp(6) without time zone
);


--
-- Name: ahoy_visits_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ahoy_visits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE CACHE 1;


--
-- Name: ahoy_visits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ahoy_visits_id_seq OWNED BY public.ahoy_visits.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata
(
    key        character varying NOT NULL,
    value      character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: author_pseudonyms; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.author_pseudonyms
(
    id         bigint NOT NULL,
    name       character varying,
    author_id  bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: author_pseudonyms_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.author_pseudonyms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE CACHE 1;


--
-- Name: author_pseudonyms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.author_pseudonyms_id_seq OWNED BY public.author_pseudonyms.id;


--
-- Name: authors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.authors
(
    id              bigint NOT NULL,
    bio             text,
    birth_date      date,
    death_date      date,
    place_of_birth  character varying,
    created_at      timestamp(6) without time zone NOT NULL,
    updated_at      timestamp(6) without time zone NOT NULL,
    short_name      character varying,
    full_name       character varying,
    photo_url       character varying,
    seo_description character varying,
    status          character varying DEFAULT 'active':: character varying NOT NULL
);


--
-- Name: authors_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.authors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE CACHE 1;


--
-- Name: authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.authors_id_seq OWNED BY public.authors.id;


--
-- Name: book_authors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.book_authors
(
    id         bigint NOT NULL,
    book_id    bigint NOT NULL,
    author_id  bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: book_authors_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.book_authors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE CACHE 1;


--
-- Name: book_authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.book_authors_id_seq OWNED BY public.book_authors.id;


--
-- Name: book_genres; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.book_genres
(
    id         bigint NOT NULL,
    book_id    bigint NOT NULL,
    genre_id   bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: book_genres_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.book_genres_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE CACHE 1;


--
-- Name: book_genres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.book_genres_id_seq OWNED BY public.book_genres.id;


--
-- Name: books; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.books
(
    id          bigint            NOT NULL,
    title       character varying NOT NULL,
    created_at  timestamp(6) without time zone NOT NULL,
    updated_at  timestamp(6) without time zone NOT NULL,
    rating      numeric(3, 2)     DEFAULT 0.0,
    description text,
    cover_url   character varying,
    searchable  tsvector GENERATED ALWAYS AS ((
            setweight(to_tsvector('russian'::regconfig, (COALESCE(title, ''::character varying))::text), 'A'::"char") ||
            setweight(to_tsvector('russian'::regconfig, COALESCE(description, ''::text)), 'B'::"char"))) STORED,
    status      character varying DEFAULT 'active':: character varying NOT NULL
);


--
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.books_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE CACHE 1;


--
-- Name: books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.books_id_seq OWNED BY public.books.id;


--
-- Name: genres; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.genres
(
    id         bigint NOT NULL,
    name_en    character varying,
    name_ru    character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    parent_id  integer,
    genre_slug character varying
);


--
-- Name: genres_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.genres_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE CACHE 1;


--
-- Name: genres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.genres_id_seq OWNED BY public.genres.id;


--
-- Name: profiles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.profiles
(
    id                    bigint NOT NULL,
    first_name            character varying,
    last_name             character varying,
    bio                   text,
    date_of_birth         date,
    country               character varying,
    city                  character varying,
    facebook_url          character varying,
    vk_url                character varying,
    twitter_url           character varying,
    instagram_url         character varying,
    notifications_enabled boolean DEFAULT true,
    user_id               bigint NOT NULL,
    created_at            timestamp(6) without time zone NOT NULL,
    updated_at            timestamp(6) without time zone NOT NULL,
    gravatar_hash         character varying
);


--
-- Name: profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE CACHE 1;


--
-- Name: profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.profiles_id_seq OWNED BY public.profiles.id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reviews
(
    id         bigint            NOT NULL,
    book_id    bigint            NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    title      character varying NOT NULL,
    user_id    bigint            NOT NULL
);


--
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.reviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE CACHE 1;


--
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations
(
    version character varying NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users
(
    id                     bigint NOT NULL,
    email                  character varying DEFAULT '':: character varying NOT NULL,
    encrypted_password     character varying DEFAULT '':: character varying NOT NULL,
    reset_password_token   character varying,
    reset_password_sent_at timestamp(6) without time zone,
    remember_created_at    timestamp(6) without time zone,
    created_at             timestamp(6) without time zone NOT NULL,
    updated_at             timestamp(6) without time zone NOT NULL,
    username               character varying DEFAULT '':: character varying NOT NULL,
    tos_agreement          boolean
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: action_text_rich_texts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.action_text_rich_texts ALTER COLUMN id SET DEFAULT nextval('public.action_text_rich_texts_id_seq'::regclass);


--
-- Name: active_admin_comments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_admin_comments ALTER COLUMN id SET DEFAULT nextval('public.active_admin_comments_id_seq'::regclass);


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: active_storage_variant_records id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_variant_records ALTER COLUMN id SET DEFAULT nextval('public.active_storage_variant_records_id_seq'::regclass);


--
-- Name: admin_users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_users ALTER COLUMN id SET DEFAULT nextval('public.admin_users_id_seq'::regclass);


--
-- Name: ahoy_events id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ahoy_events ALTER COLUMN id SET DEFAULT nextval('public.ahoy_events_id_seq'::regclass);


--
-- Name: ahoy_visits id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ahoy_visits ALTER COLUMN id SET DEFAULT nextval('public.ahoy_visits_id_seq'::regclass);


--
-- Name: author_pseudonyms id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.author_pseudonyms ALTER COLUMN id SET DEFAULT nextval('public.author_pseudonyms_id_seq'::regclass);


--
-- Name: authors id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.authors ALTER COLUMN id SET DEFAULT nextval('public.authors_id_seq'::regclass);


--
-- Name: book_authors id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.book_authors ALTER COLUMN id SET DEFAULT nextval('public.book_authors_id_seq'::regclass);


--
-- Name: book_genres id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.book_genres ALTER COLUMN id SET DEFAULT nextval('public.book_genres_id_seq'::regclass);


--
-- Name: books id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.books ALTER COLUMN id SET DEFAULT nextval('public.books_id_seq'::regclass);


--
-- Name: genres id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genres ALTER COLUMN id SET DEFAULT nextval('public.genres_id_seq'::regclass);


--
-- Name: profiles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profiles ALTER COLUMN id SET DEFAULT nextval('public.profiles_id_seq'::regclass);


--
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: action_text_rich_texts action_text_rich_texts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.action_text_rich_texts
    ADD CONSTRAINT action_text_rich_texts_pkey PRIMARY KEY (id);


--
-- Name: active_admin_comments active_admin_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_admin_comments
    ADD CONSTRAINT active_admin_comments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: active_storage_variant_records active_storage_variant_records_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT active_storage_variant_records_pkey PRIMARY KEY (id);


--
-- Name: admin_users admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- Name: ahoy_events ahoy_events_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ahoy_events
    ADD CONSTRAINT ahoy_events_pkey PRIMARY KEY (id);


--
-- Name: ahoy_visits ahoy_visits_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ahoy_visits
    ADD CONSTRAINT ahoy_visits_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: author_pseudonyms author_pseudonyms_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.author_pseudonyms
    ADD CONSTRAINT author_pseudonyms_pkey PRIMARY KEY (id);


--
-- Name: authors authors_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (id);


--
-- Name: book_authors book_authors_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.book_authors
    ADD CONSTRAINT book_authors_pkey PRIMARY KEY (id);


--
-- Name: book_genres book_genres_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.book_genres
    ADD CONSTRAINT book_genres_pkey PRIMARY KEY (id);


--
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- Name: genres genres_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (id);


--
-- Name: profiles profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (id);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_action_text_rich_texts_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_action_text_rich_texts_uniqueness ON public.action_text_rich_texts USING btree (record_type, record_id, name);


--
-- Name: index_active_admin_comments_on_author; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_active_admin_comments_on_author ON public.active_admin_comments USING btree (author_type, author_id);


--
-- Name: index_active_admin_comments_on_namespace; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_active_admin_comments_on_namespace ON public.active_admin_comments USING btree (namespace);


--
-- Name: index_active_admin_comments_on_resource; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_active_admin_comments_on_resource ON public.active_admin_comments USING btree (resource_type, resource_id);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_active_storage_attachments_on_name ON public.active_storage_attachments USING btree (name);


--
-- Name: index_active_storage_attachments_on_record_type_and_record_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_active_storage_attachments_on_record_type_and_record_id ON public.active_storage_attachments USING btree (record_type, record_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_active_storage_variant_records_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_variant_records_uniqueness ON public.active_storage_variant_records USING btree (blob_id, variation_digest);


--
-- Name: index_admin_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_admin_users_on_email ON public.admin_users USING btree (email);


--
-- Name: index_admin_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_admin_users_on_reset_password_token ON public.admin_users USING btree (reset_password_token);


--
-- Name: index_ahoy_events_on_name_and_time; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ahoy_events_on_name_and_time ON public.ahoy_events USING btree (name, "time");


--
-- Name: index_ahoy_events_on_properties; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ahoy_events_on_properties ON public.ahoy_events USING gin (properties jsonb_path_ops);


--
-- Name: index_ahoy_events_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ahoy_events_on_user_id ON public.ahoy_events USING btree (user_id);


--
-- Name: index_ahoy_events_on_visit_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ahoy_events_on_visit_id ON public.ahoy_events USING btree (visit_id);


--
-- Name: index_ahoy_visits_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ahoy_visits_on_user_id ON public.ahoy_visits USING btree (user_id);


--
-- Name: index_ahoy_visits_on_visit_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_ahoy_visits_on_visit_token ON public.ahoy_visits USING btree (visit_token);


--
-- Name: index_author_pseudonyms_on_author_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_author_pseudonyms_on_author_id ON public.author_pseudonyms USING btree (author_id);


--
-- Name: index_authors_on_full_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_authors_on_full_name ON public.authors USING btree (full_name);


--
-- Name: index_authors_on_short_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_authors_on_short_name ON public.authors USING btree (short_name);


--
-- Name: index_book_authors_on_author_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_book_authors_on_author_id ON public.book_authors USING btree (author_id);


--
-- Name: index_book_authors_on_book_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_book_authors_on_book_id ON public.book_authors USING btree (book_id);


--
-- Name: index_book_genres_on_book_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_book_genres_on_book_id ON public.book_genres USING btree (book_id);


--
-- Name: index_book_genres_on_genre_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_book_genres_on_genre_id ON public.book_genres USING btree (genre_id);


--
-- Name: index_books_on_description; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_books_on_description ON public.books USING btree (description);


--
-- Name: index_books_on_searchable; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_books_on_searchable ON public.books USING gin (searchable);


--
-- Name: index_books_on_title; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_books_on_title ON public.books USING btree (title);


--
-- Name: index_genres_on_genre_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_genres_on_genre_slug ON public.genres USING btree (genre_slug);


--
-- Name: index_genres_on_name_en; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_genres_on_name_en ON public.genres USING btree (name_en);


--
-- Name: index_genres_on_name_ru; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_genres_on_name_ru ON public.genres USING btree (name_ru);


--
-- Name: index_profiles_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_profiles_on_user_id ON public.profiles USING btree (user_id);


--
-- Name: index_reviews_on_book_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_reviews_on_book_id ON public.reviews USING btree (book_id);


--
-- Name: index_reviews_on_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_reviews_on_created_at ON public.reviews USING btree (created_at);


--
-- Name: index_reviews_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_reviews_on_user_id ON public.reviews USING btree (user_id);


--
-- Name: index_reviews_on_user_id_and_book_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_reviews_on_user_id_and_book_id ON public.reviews USING btree (user_id, book_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: index_users_on_username; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_username ON public.users USING btree (username);


--
-- Name: unique_index_on_name_en_ru; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX unique_index_on_name_en_ru ON public.genres USING btree (name_en, name_ru);


--
-- Name: book_authors fk_rails_0c0759568d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.book_authors
    ADD CONSTRAINT fk_rails_0c0759568d FOREIGN KEY (author_id) REFERENCES public.authors(id);


--
-- Name: author_pseudonyms fk_rails_0fc5d43dd1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.author_pseudonyms
    ADD CONSTRAINT fk_rails_0fc5d43dd1 FOREIGN KEY (author_id) REFERENCES public.authors(id);


--
-- Name: book_genres fk_rails_4a117802d7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.book_genres
    ADD CONSTRAINT fk_rails_4a117802d7 FOREIGN KEY (book_id) REFERENCES public.books(id);


--
-- Name: reviews fk_rails_74a66bd6c5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT fk_rails_74a66bd6c5 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: reviews fk_rails_924a0b30ca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT fk_rails_924a0b30ca FOREIGN KEY (book_id) REFERENCES public.books(id);


--
-- Name: active_storage_variant_records fk_rails_993965df05; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT fk_rails_993965df05 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: book_genres fk_rails_ac5841e6a0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.book_genres
    ADD CONSTRAINT fk_rails_ac5841e6a0 FOREIGN KEY (genre_id) REFERENCES public.genres(id);


--
-- Name: book_authors fk_rails_b23f3934c1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.book_authors
    ADD CONSTRAINT fk_rails_b23f3934c1 FOREIGN KEY (book_id) REFERENCES public.books(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: profiles fk_rails_e424190865; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT fk_rails_e424190865 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

SET
search_path TO "$user", public;

INSERT INTO "schema_migrations" (version)
VALUES ('20230211211533'),
       ('20230212070932'),
       ('20230213180047'),
       ('20230215175317'),
       ('20230215175731'),
       ('20230215180553'),
       ('20230215181232'),
       ('20230216205648'),
       ('20230216210152'),
       ('20230217115521'),
       ('20230221142211'),
       ('20230222080109'),
       ('20230222080500'),
       ('20230222080634'),
       ('20230222081130'),
       ('20230222081718'),
       ('20230222082508'),
       ('20230222082839'),
       ('20230222083850'),
       ('20230222172612'),
       ('20230226082146'),
       ('20230226113859'),
       ('20230226125258'),
       ('20230226161141'),
       ('20230227122109'),
       ('20230227125557'),
       ('20230227132322'),
       ('20230228114942'),
       ('20230228150500'),
       ('20230301101231'),
       ('20230301142427'),
       ('20230302091926'),
       ('20230302093858'),
       ('20230304080213'),
       ('20230304083316'),
       ('20230305095600'),
       ('20230305095602'),
       ('20230305112508'),
       ('20230309144349'),
       ('20230309165213'),
       ('20230311064140'),
       ('20230318132436'),
       ('20230319083606'),
       ('20230319090453'),
       ('20230319091350'),
       ('20230319093421'),
       ('20230319094648'),
       ('20230319100652'),
       ('20230319100802'),
       ('20230322080249'),
       ('20230322080517'),
       ('20230322085354'),
       ('20230322125809'),
       ('20230322131130'),
       ('20230327181418'),
       ('20230327191219'),
       ('20230328095843'),
       ('20230328131739');


