SELECT
    account_tree.account_tree_id,
    account_tree.account_id,
    account_tree.tree_id,
    account_tree.state,
    account_tree.complete,
    account_tree.last_modified_at,
    account_tree.created_at,
    (
        SELECT
            tree.tree_key
        FROM
            public.tree
        WHERE
            tree.tree_id = account_tree.tree_id) AS tree_key,
    (
        SELECT
            tree.tree_name
        FROM
            public.tree
        WHERE
            tree.tree_id = account_tree.tree_id) AS tree_name,
    (
        SELECT
            (account.account_name || '/'::text) || (
                SELECT
                    tree.tree_key
                FROM
                    public.tree
                WHERE
                    tree.tree_id = account_tree.tree_id)
            FROM
                public.account
            WHERE
                account.account_id = account_tree.account_id) AS tree_path
    FROM
        public.account_tree;


ALTER TABLE api.account_tree OWNER TO api_user;


