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

CREATE VIEW view_prezentacje_materialy AS
SELECT
    p.temat AS prezentacja_temat,
    p.opis AS prezentacja_opis,
    m.nazwa AS material_nazwa,
    m.opis AS material_opis,
    m.url AS material_url
FROM Prezentacje p
LEFT JOIN Materialy m ON p.sesja_id = m.sesja_id;

CREATE VIEW view_uczestnicy_opinie AS
SELECT
    u.imie AS uczestnik_imie,
    u.nazwisko AS uczestnik_nazwisko,
    s.nazwa AS sesja_nazwa,
    o.ocena,
    o.komentarz
FROM Uczestnicy u
JOIN Opinie o ON u.uczestnik_id = o.uczestnik_id
    JOIN Sesje s ON o.sesja_id = s.sesja_id;

CREATE VIEW view_rejestracje_konferencje_details AS
SELECT
    r.rejestracja_id,
    r.data_rejestracji,
    r.status AS rejestracja_status,
    u.imie AS uczestnik_imie,
    u.nazwisko AS uczestnik_nazwisko,
    u.email AS uczestnik_email,
    k.nazwa AS konferencja_nazwa,
    k.data_rozpoczecia AS konferencja_data_rozpoczecia,
    k.data_zakonczenia AS konferencja_data_zakonczenia
FROM Rejestracje r
JOIN Uczestnicy u ON r.uczestnik_id = u.uczestnik_id
JOIN Konferencje k ON r.konferencja_id = k.konferencja_id;