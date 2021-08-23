CREATE FUNCTION public.meter_limit_checker ()
    RETURNS trigger
    LANGUAGE plpgsql
    AS $EOFCODE$
BEGIN
    IF (
        SELECT
            COUNT(*)
        FROM
            meter
        WHERE
            meter.account_id = NEW.account_id) >= 1000 THEN
        RAISE EXCEPTION 'You can only have 1,000 meters!';
    END IF;
    RETURN NEW;
END
$EOFCODE$;

