-- Trigger: update_participant_limit_trigger
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
BEFORE INSERT OR UPDATE ON Rejestracje
FOR EACH ROW
EXECUTE FUNCTION update_participant_limit();

CREATE OR REPLACE FUNCTION prevent_duplicate_opinions()
RETURNS TRIGGER AS $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM Opinie
    WHERE sesja_id = NEW.sesja_id AND uczestnik_id = NEW.uczestnik_id
  ) THEN
    RAISE EXCEPTION 'Participant cannot add multiple opinions for the same session.';
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER prevent_duplicate_opinions_trigger
BEFORE INSERT ON Opinie
FOR EACH ROW
EXECUTE FUNCTION prevent_duplicate_opinions();