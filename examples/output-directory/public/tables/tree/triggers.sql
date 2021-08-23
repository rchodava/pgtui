CREATE TRIGGER new_tree_trigger
    BEFORE INSERT ON public.tree
    FOR EACH ROW
    EXECUTE PROCEDURE public. new_tree ();

CREATE TRIGGER tree_change_last_modified_trigger
    BEFORE UPDATE ON public.tree
    FOR EACH ROW
    EXECUTE PROCEDURE public. change_last_modified ();

