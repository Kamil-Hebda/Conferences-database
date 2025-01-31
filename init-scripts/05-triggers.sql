CREATE OR REPLACE FUNCTION update_participant_limit()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        IF (SELECT COUNT(*) FROM Rejestracje WHERE konferencja_id = NEW.konferencja_id) >=
           (SELECT limit_uczestnikow FROM Konferencje WHERE konferencja_id = NEW.konferencja_id) THEN
           NEW.status := 'Anulowany';
        END IF;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER update_participant_limit_trigger
BEFORE INSERT ON Rejestracje
FOR EACH ROW
EXECUTE FUNCTION update_participant_limit();


CREATE OR REPLACE FUNCTION block_cancellation()
RETURNS TRIGGER AS $$
BEGIN
  IF NEW.status = 'Anulowany' AND OLD.status = 'Potwierdzony' THEN
    RAISE EXCEPTION 'Nie można anulować potwierdzonej rejestracji.';
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER block_cancellation_trigger
BEFORE UPDATE ON Rejestracje
FOR EACH ROW
EXECUTE FUNCTION block_cancellation();