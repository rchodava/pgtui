SELECT
    account_api_key.account_api_key_id,
    account_api_key.account_id,
    account_api_key.key_string,
    account_api_key.purpose,
    account_api_key.last_used_at,
    account_api_key.created_at
FROM
    public.account_api_key;


ALTER TABLE api.account_api_key OWNER TO api_user;


