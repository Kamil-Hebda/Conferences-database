CREATE VIEW view_rejestracje_uczestnicy AS
SELECT
    r.rejestracja_id,
    r.data_rejestracji,
    r.status AS rejestracja_status,
    u.imie AS uczestnik_imie,
    u.nazwisko AS uczestnik_nazwisko,
    u.email AS uczestnik_email
FROM Rejestracje r
JOIN Uczestnicy u ON r.uczestnik_id = u.uczestnik_id;

CREATE VIEW view_konferencje_sesje AS
SELECT
    k.konferencja_id,
    k.nazwa AS konferencja_nazwa,
    k.data_rozpoczecia AS konferencja_data_rozpoczecia,
   s.nazwa AS sesja_nazwa,
   s.data_rozpoczecia AS sesja_data_rozpoczecia,
    s.miejsce AS sesja_miejsce
FROM Konferencje k
LEFT JOIN Sesje s ON k.konferencja_id = s.konferencja_id;

CREATE VIEW view_sesje_prelegenci AS
SELECT
  s.sesja_id,
   s.nazwa AS sesja_nazwa,
    p.imie AS prelegent_imie,
      p.nazwisko AS prelegent_nazwisko,
       pr.temat as prezentacja_temat,
      pr.opis as opis_prezentacji,
    s.opis as opis_sesji
FROM Sesje s
JOIN Prezentacje pr ON s.sesja_id = pr.sesja_id
JOIN Prelegenci p ON pr.prelegent_id = p.prelegent_id;