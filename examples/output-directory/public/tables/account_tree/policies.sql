CREATE POLICY account_tree_access ON public.account_tree FOR ALL TO api_user USING (account_id = public.auth_account_id ());

