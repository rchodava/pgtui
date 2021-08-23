CREATE TRIGGER create_new_account_api_key_trigger
    AFTER INSERT ON public.account
    FOR EACH ROW
    EXECUTE PROCEDURE public. create_new_account_api_key ();

CREATE TRIGGER new_account_trigger
    BEFORE INSERT ON public.account
    FOR EACH ROW
    EXECUTE PROCEDURE public. new_account ();

