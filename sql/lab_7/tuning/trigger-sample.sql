-- The following needs to be loaded from psql with the command: \i trigger-sample.sql
-- The trigger then needs to be registered with the following statement:
-- CREATE TRIGGER discontinuedsample AFTER UPDATE ON Stock
--        FOR EACH ROW EXECUTE PROCEDURE remove_discontinued_sample();

CREATE OR REPLACE FUNCTION remove_discontinued_sample() RETURNS TRIGGER AS $discontinued$
  DECLARE
    empty_rec RECORD;
  BEGIN
        -- Verify if the element in stock that is being updated still appears in the Supplies table
        SELECT INTO empty_rec * FROM Supplies WHERE eid = NEW.eid;
        -- If it is not found, print an error message
	IF NOT FOUND THEN
           RAISE NOTICE 'This product is no longer being refilled';
	END IF;
	RETURN NULL;
  END;
$discontinued$ LANGUAGE plpgsql;
