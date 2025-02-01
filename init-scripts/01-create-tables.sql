CREATE TABLE IF NOT EXISTS Addresses (
    address_id SERIAL PRIMARY KEY,
    street VARCHAR(50),
    city VARCHAR(50) NOT NULL,
    building_number INT NOT NULL,
    flat_number INT,
    postal_code VARCHAR(10) NOT NULL,
    country VARCHAR(50) NOT NULL,
    description VARCHAR(50),
    type VARCHAR(20) CHECK (type IN ('hotel', 'conference hall', 'other')) NOT NULL
);

CREATE TABLE IF NOT EXISTS Uczestnicy (
    uczestnik_id SERIAL PRIMARY KEY,
    imie VARCHAR(25) NOT NULL,
    nazwisko VARCHAR(25) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    numer_telefonu VARCHAR(15),
    adres_id INT,
    FOREIGN KEY (adres_id) REFERENCES Addresses(address_id)
);

CREATE TABLE IF NOT EXISTS Konferencje (
    konferencja_id SERIAL PRIMARY KEY,
    nazwa VARCHAR(255) NOT NULL,
    opis TEXT,
    data_rozpoczecia DATE NOT NULL,
    data_zakonczenia DATE NOT NULL,
    miejsce VARCHAR(255),
    limit_uczestnikow INT DEFAULT 50
);

CREATE TABLE IF NOT EXISTS Rejestracje (
    rejestracja_id SERIAL PRIMARY KEY,
    uczestnik_id INT,
    konferencja_id INT,
    data_rejestracji DATE NOT NULL,
    status VARCHAR(20) CHECK (status IN ('Zarejestrowany', 'Potwierdzony', 'Anulowany')) DEFAULT 'Zarejestrowany',
    FOREIGN KEY (uczestnik_id) REFERENCES Uczestnicy(uczestnik_id),
    FOREIGN KEY (konferencja_id) REFERENCES Konferencje(konferencja_id)
);

CREATE TABLE IF NOT EXISTS Sesje (
    sesja_id SERIAL PRIMARY KEY,
    konferencja_id INT NOT NULL REFERENCES Konferencje(konferencja_id),
    nazwa VARCHAR(255) NOT NULL,
    data_rozpoczecia TIMESTAMP NOT NULL,
    data_zakonczenia TIMESTAMP NOT NULL,
    miejsce VARCHAR(255),
    opis TEXT
);

CREATE TABLE IF NOT EXISTS Prelegenci (
    prelegent_id SERIAL PRIMARY KEY,
    imie VARCHAR(255) NOT NULL,
    nazwisko VARCHAR(255) NOT NULL,
    biografia TEXT,
    zdjecie_url VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Prezentacje (
    prezentacja_id SERIAL PRIMARY KEY,
    sesja_id INT NOT NULL REFERENCES Sesje(sesja_id),
    prelegent_id INT NOT NULL REFERENCES Prelegenci(prelegent_id),
    temat VARCHAR(255) NOT NULL,
    opis TEXT
);

CREATE TABLE IF NOT EXISTS Opinie (
    opinia_id SERIAL PRIMARY KEY,
    sesja_id INT NOT NULL,
    uczestnik_id INT NOT NULL,
    ocena INT NOT NULL CHECK (ocena >= 1 AND ocena <= 5),
    komentarz TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sesja_id) REFERENCES Sesje(sesja_id),
    FOREIGN KEY (uczestnik_id) REFERENCES Uczestnicy(uczestnik_id)
);

CREATE TABLE IF NOT EXISTS Materialy(
    material_id SERIAL PRIMARY KEY,
    sesja_id INT NOT NULL REFERENCES Sesje(sesja_id),
    nazwa VARCHAR(255) NOT NULL,
    opis TEXT,
    url VARCHAR(255) NOT NULL
);