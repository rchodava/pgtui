CREATE POLICY account_api_key_access ON public.account_api_key FOR ALL TO api_user USING (account_id = public.auth_account_id ());

