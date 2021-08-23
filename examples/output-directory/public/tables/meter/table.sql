CREATE TABLE public.meter (
    meter_id uuid DEFAULT (gen_random_uuid ()) NOT NULL,
    account_id uuid NOT NULL,
    endpoint_id uuid,
    endpoint_name text,
    meter_name text NOT NULL,
    meter_key text NOT NULL,
    description text NOT NULL,
    output_type text NOT NULL,
    output jsonb,
    last_modified_at pg_catalog.timestamptz DEFAULT (CURRENT_TIMESTAMP) NOT NULL,
    created_at pg_catalog.timestamptz DEFAULT (CURRENT_TIMESTAMP) NOT NULL
);


ALTER TABLE public.meter OWNER TO postgres;

ALTER TABLE ONLY public.meter
    ADD CONSTRAINT meter_account_id_meter_key_key UNIQUE (account_id, meter_key);

ALTER TABLE ONLY public.meter
    ADD CONSTRAINT meter_pkey PRIMARY KEY (meter_id);

ALTER TABLE ONLY public.meter
    ADD CONSTRAINT meter_endpoint_id_fkey FOREIGN KEY (endpoint_id) REFERENCES public.endpoint (endpoint_id);

ALTER TABLE public.meter ENABLE ROW LEVEL SECURITY;

