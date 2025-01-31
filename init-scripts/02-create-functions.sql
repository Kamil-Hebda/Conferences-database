CREATE OR REPLACE FUNCTION calculate_average_rating(sesja_id_input INT)
RETURNS DECIMAL(3, 2) AS $$
DECLARE
 average_rating DECIMAL(3, 2);
BEGIN
 SELECT AVG(ocena) INTO average_rating
 FROM Opinie
 WHERE sesja_id = sesja_id_input;

 RETURN average_rating;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION get_participants_for_conference(konferencja_id_input INT)
    RETURNS TABLE (
        uczestnik_id INT,
         imie VARCHAR(25),
          nazwisko VARCHAR(25),
          email VARCHAR(50)
    ) AS $$
    BEGIN
      RETURN QUERY SELECT u.uczestnik_id, u.imie, u.nazwisko, u.email
        FROM Uczestnicy u
        JOIN Rejestracje r
        ON r.uczestnik_id = u.uczestnik_id
        WHERE r.konferencja_id = konferencja_id_input;
    END;
    $$ LANGUAGE plpgsql;


 CREATE OR REPLACE FUNCTION get_sessions_for_conference(konferencja_id_input INT)
  RETURNS TABLE (
    sesja_id INT,
    nazwa VARCHAR(255),
    data_rozpoczecia TIMESTAMP,
    data_zakonczenia TIMESTAMP
  ) AS $$
  BEGIN
    RETURN QUERY SELECT
       s.sesja_id, s.nazwa, s.data_rozpoczecia, s.data_zakonczenia
    FROM Sesje s
    WHERE s.konferencja_id = konferencja_id_input;
  END;
  $$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION get_presenters_for_session(sesja_id_input INT)
  RETURNS TABLE (
   prelegent_id INT,
    imie VARCHAR(255),
    nazwisko VARCHAR(255)
  ) AS $$
  BEGIN
    RETURN QUERY SELECT p.prelegent_id, p.imie, p.nazwisko FROM Prelegenci p
   JOIN Prezentacje pr ON p.prelegent_id = pr.prelegent_id
  WHERE pr.sesja_id = sesja_id_input;
  END;
  $$ LANGUAGE plpgsql;


 CREATE OR REPLACE FUNCTION get_conference_details(konferencja_id_input INT)
 RETURNS TABLE (
      konferencja_id INT,
      nazwa VARCHAR(255),
     data_rozpoczecia DATE,
     data_zakonczenia DATE,
     miejsce VARCHAR(255),
     limit_uczestnikow INT,
     adres TEXT
  ) AS $$
  BEGIN
      RETURN QUERY SELECT
         k.konferencja_id,
         k.nazwa,
          k.data_rozpoczecia,
          k.data_zakonczenia,
          k.miejsce,
          k.limit_uczestnikow,
       (a1.street || ', ' || a1.building_number ||
           CASE WHEN a1.flat_number IS NOT NULL THEN '/' || a1.flat_number ELSE '' END || ', ' ||
           a1.city || ', ' || a1.postal_code || ', ' || a1.country) AS adres
       FROM
          Konferencje k
         LEFT JOIN Addresses a1 ON k.miejsce = a1.address_id::TEXT
         WHERE k.konferencja_id = konferencja_id_input;
  END;
  $$ LANGUAGE plpgsql;