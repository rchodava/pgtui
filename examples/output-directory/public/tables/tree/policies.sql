CREATE POLICY tree_access ON public.tree FOR ALL TO api_user USING (public
    OR owner_id = public.auth_account_id ());

