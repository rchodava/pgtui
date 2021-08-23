CREATE TABLE public.endpoint (
    endpoint_id uuid DEFAULT (gen_random_uuid ()) NOT NULL,
    endpoint_name text NOT NULL,
    endpoint_key text NOT NULL,
    endpoint_options jsonb,
    endpoint_url text,
    official boolean DEFAULT (FALSE) NOT NULL,
    owner_account_id uuid,
    public boolean DEFAULT (FALSE) NOT NULL,
    created_at pg_catalog.timestamptz DEFAULT (CURRENT_TIMESTAMP) NOT NULL
);


ALTER TABLE public.endpoint OWNER TO postgres;

ALTER TABLE ONLY public.endpoint
    ADD CONSTRAINT endpoint_pkey PRIMARY KEY (endpoint_id);

ALTER TABLE ONLY public.endpoint
    ADD CONSTRAINT endpoint_owner_account_id_fkey FOREIGN KEY (owner_account_id) REFERENCES public.account (account_id);

ALTER TABLE public.endpoint ENABLE ROW LEVEL SECURITY;

