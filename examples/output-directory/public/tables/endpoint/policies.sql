CREATE POLICY endpoint_access ON public.endpoint FOR ALL TO api_user USING (official
    OR public
    OR owner_account_id = public.auth_account_id ());

