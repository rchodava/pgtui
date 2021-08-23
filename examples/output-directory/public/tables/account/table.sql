CREATE TABLE public.account (
    account_id uuid DEFAULT (gen_random_uuid ()) NOT NULL,
    account_num int NOT NULL,
    account_name text NOT NULL,
    email text,
    auth0_id text,
    last_active_at pg_catalog.timestamptz DEFAULT (CURRENT_TIMESTAMP) NOT NULL,
    created_at pg_catalog.timestamptz DEFAULT (CURRENT_TIMESTAMP) NOT NULL
);


ALTER TABLE public.account OWNER TO postgres;

ALTER TABLE ONLY public.account
    ALTER COLUMN account_num SET DEFAULT nextval('public.account_account_num_seq'::regclass);

ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_account_name_key UNIQUE (account_name);

ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_account_num_key UNIQUE (account_num);

ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_email_key UNIQUE (email);

ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_pkey PRIMARY KEY (account_id);

ALTER TABLE public.account ENABLE ROW LEVEL SECURITY;

