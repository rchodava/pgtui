CREATE FUNCTION public.auth_account_id ()
    RETURNS uuid
    LANGUAGE plpgsql
    AS $EOFCODE$
DECLARE
    account_id uuid;
BEGIN
    account_id := (
        SELECT
            account_api_key.account_id
        FROM
            super_api.account_api_key
        WHERE
            key_string = current_setting('request.header.apikey', 't'));
    RETURN account_id;
END
$EOFCODE$;

