CREATE POLICY meter_access ON public.meter FOR ALL TO api_user USING (account_id = public.auth_account_id ());

