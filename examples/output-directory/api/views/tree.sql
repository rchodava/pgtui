SELECT
    tree.tree_id,
    tree.tree_name,
    tree.tree_key,
    tree.owner_id,
    tree.tree_def,
    tree.public,
    tree.last_modified_at,
    tree.created_at,
    (
        SELECT
            (account.account_name || '/'::text) || tree.tree_key
        FROM
            super_api.account
        WHERE
            account.account_id = tree.owner_id) AS tree_path,
    (
        SELECT
            account.account_name
        FROM
            super_api.account
        WHERE
            account.account_id = tree.owner_id) AS owner_name,
    (
        SELECT
            jsonb_object_agg(requirements.meter_key, (
                    SELECT
                        jsonb_build_object('meter_name', meter.meter_name, 'meter_key', meter.meter_key, 'endpoint_name', meter.endpoint_name, 'endpoint_id', meter.endpoint_id, 'description', meter.description, 'output_type', meter.output_type) AS jsonb_build_object FROM super_api.meter
                    WHERE
                        meter.meter_key = requirements.meter_key
                        AND meter.account_id = tree.owner_id)) AS jsonb_object_agg
        FROM (
            SELECT
                jsonb_object_keys((tree.tree_def -> tree_names_set.tree_name) -> 'requirements'::text) AS meter_key
            FROM (
                SELECT
                    jsonb_object_keys(tree.tree_def) AS tree_name) AS tree_names_set) AS requirements) AS owner_meter_defs
FROM
    public.tree;


ALTER TABLE api.tree OWNER TO api_user;


