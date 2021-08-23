SELECT
    account_endpoint.account_endpoint_id,
    account_endpoint.account_id,
    account_endpoint.endpoint_id,
    account_endpoint.params,
    account_endpoint.run_frequency_secs,
    account_endpoint.error,
    account_endpoint.last_run_at,
    account_endpoint.created_at
FROM
    public.account_endpoint;


ALTER TABLE api.account_endpoint OWNER TO api_user;


