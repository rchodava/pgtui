CREATE POLICY account_access ON public.account FOR ALL TO api_user USING (account_id = public.auth_account_id ());

