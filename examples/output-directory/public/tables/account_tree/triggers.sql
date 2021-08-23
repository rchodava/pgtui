CREATE TRIGGER account_tree_change_last_modified_trigger
    BEFORE UPDATE ON public.account_tree
    FOR EACH ROW
    EXECUTE PROCEDURE public. change_last_modified ();

