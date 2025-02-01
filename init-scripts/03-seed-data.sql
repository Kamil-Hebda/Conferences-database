-- Inserting data into Addresses table
INSERT INTO Addresses (street, city, building_number, flat_number, postal_code, country, description, type)
VALUES
    ('Main Street', 'New York', 123, NULL, '10001', 'USA', 'Primary hotel', 'hotel'),
    ('Park Avenue', 'Los Angeles', 456, 10, '90001', 'USA', 'Conference hotel', 'hotel'),
    ('Market Square', 'London', 789, NULL, 'SW1A 0AA', 'UK', 'Conference Hall location', 'conference hall'),
    ('High Road', 'Paris', 101, 5, '75001', 'France', 'Office location', 'other'),
    ('Wall Street', 'Tokyo', 202, NULL, '100-0001', 'Japan', 'Secondary hotel', 'hotel'),
    (NULL, 'Warsaw', 12, 10, '00-001', 'Poland', 'Summer Conference hall', 'conference hall'),
     (NULL, 'Berlin', 14, NULL, '10115', 'Germany', 'Other', 'other'),
      (NULL, 'Rome', 13, NULL, '00100', 'Italy', 'Other location', 'other');


-- Inserting data into Uczestnicy table
INSERT INTO Uczestnicy (imie, nazwisko, email, numer_telefonu)
VALUES
    ('John', 'Doe', 'john.doe@example.com', '555-1234'),
    ('Jane', 'Smith', 'jane.smith@example.com', '555-5678'),
    ('Alice', 'Brown', 'alice.brown@example.com', NULL),
    ('Bob', 'Jones', 'bob.jones@example.com', '555-9012'),
    ('Eve', 'White', 'eve.white@example.com', '555-3456'),
    ('Katarzyna', 'Nowak', 'kasia.nowak@example.com', '123-456-789'),
    ('Max', 'Mustermann', 'max.mustermann@example.com', NULL),
    ('Sofia', 'Rossi', 'sofia.rossi@example.com', '123-123-123');

-- Inserting data into Konferencje table
INSERT INTO Konferencje (nazwa, opis, data_rozpoczecia, data_zakonczenia, miejsce, limit_uczestnikow)
VALUES
    ('Tech Conference 2024', 'Annual tech conference', '2024-08-15', '2024-08-16', 1, 50),
    ('Marketing Summit', 'Summit for marketing professionals', '2024-09-20', '2024-09-22', 2, 3),
    ('Healthcare Symposium', 'Symposium for healthcare providers', '2024-10-01', '2024-10-03', 3, 100),
   ('AI Workshop', 'Workshop for artificial intelligence', '2024-11-10', '2024-11-12', 4, 200),
   ('Business Forum', 'Forum for business', '2024-12-15', '2024-12-17', 5, 10),
    ('Summer workshop', 'Summer workshop', '2025-01-01', '2025-01-03', 6, 12),
    ('Another workshop', 'Another workshop', '2025-01-05', '2025-01-07', 7, 40),
     ('AI workshop', 'Another workshop', '2025-01-10', '2025-01-12', 8, 20);

-- Inserting data into Rejestracje table
INSERT INTO Rejestracje (uczestnik_id, konferencja_id, data_rejestracji, status)
VALUES
    (1, 1, '2024-08-01', 'Zarejestrowany'),
    (2, 1, '2024-08-02', 'Zarejestrowany'),
    (3, 2, '2024-09-05', 'Zarejestrowany'),
    (1, 3, '2024-09-20', 'Potwierdzony'),
    (4, 3, '2024-10-05', 'Zarejestrowany'),
    (2, 3, '2024-10-10', 'Zarejestrowany'),
    (5, 4, '2024-11-01', 'Zarejestrowany'),
    (3, 4, '2024-11-01', 'Zarejestrowany');

-- Inserting data into Prelegenci table
INSERT INTO Prelegenci (imie, nazwisko, biografia, zdjecie_url)
VALUES
  ('Alan', 'Turing', 'Pioneer of artificial intelligence', null),
  ('Grace', 'Hopper', 'A computer scientist', null),
  ('Edsger', 'Dijkstra', 'Pioneer in computer science', null),
  ('Ada', 'Lovelace', 'A mathematician and first programmer', null),
  ('Steve', 'Jobs', 'Co-founder of Apple', null),
  ('Bill', 'Gates', 'Co-founder of Microsoft', null),
   ('Tim', 'Berners-Lee', 'Creator of World Wide Web', null),
  ('Margaret', 'Hamilton', 'A software engineer that contributed to NASA Apollo mission', null);

-- Inserting data into Sesje table
INSERT INTO Sesje (konferencja_id, nazwa, data_rozpoczecia, data_zakonczenia, miejsce, opis)
VALUES
    (1, 'Keynote: AI', '2024-08-15 09:00:00', '2024-08-15 10:00:00', 'Main hall', 'Opening session'),
    (1, 'Workshop: Machine learning', '2024-08-15 10:30:00', '2024-08-15 12:00:00', 'Room A', 'Workshop in machine learning'),
    (2, 'Marketing trends', '2024-09-20 09:00:00', '2024-09-20 10:30:00', 'Main hall', 'Discussing new marketing trends'),
    (2, 'Social media marketing', '2024-09-20 11:00:00', '2024-09-20 12:30:00', 'Room A', 'Workshop for social media marketing'),
    (3, 'New technologies in healthcare', '2024-10-01 09:00:00', '2024-10-01 10:30:00', 'Main hall', 'Discussion of new technologies'),
    (3, 'Telemedicine', '2024-10-01 11:00:00', '2024-10-01 12:30:00', 'Room B', 'How to use telemedicine'),
        (4, 'AI basics', '2024-11-10 09:00:00', '2024-11-10 10:30:00', 'Main hall', 'Introduction to AI'),
    (4, 'Advanced AI', '2024-11-10 11:00:00', '2024-11-10 12:30:00', 'Room C', 'Advanced topics in AI'),
       (5, 'Business basics', '2024-12-15 09:00:00', '2024-12-15 10:30:00', 'Main hall', 'Basics in business management'),
    (5, 'Business strategy', '2024-12-15 11:00:00', '2024-12-15 12:30:00', 'Room D', 'How to create good business strategy'),
   (6, 'Web development', '2025-01-01 09:00:00', '2025-01-01 10:30:00', 'Room E', 'How to be a great web developer'),
    (6, 'Software engineering', '2025-01-01 11:00:00', '2025-01-01 12:30:00', 'Room F', 'Software engineering principles'),
      (7, 'AI basics 2', '2025-01-05 09:00:00', '2025-01-05 10:30:00', 'Main hall', 'Introduction to AI for dummies'),
    (7, 'Advanced AI 2', '2025-01-05 11:00:00', '2025-01-05 12:30:00', 'Room B', 'Advanced AI topics'),
      (8, 'AI basics 3', '2025-01-10 09:00:00', '2025-01-10 10:30:00', 'Room C', 'Introduction to AI for kids'),
    (8, 'Advanced AI 3', '2025-01-10 11:00:00', '2025-01-10 12:30:00', 'Room D', 'Advanced AI topics for kids');

-- Inserting data into Prezentacje table
INSERT INTO Prezentacje (sesja_id, prelegent_id, temat, opis)
VALUES
   (1, 1, 'Introduction to AI', 'Introduction to artificial intelligence'),
   (2, 2, 'Machine learning', 'Workshop for machine learning'),
   (3, 3, 'New marketing tools', 'New tools for marketers'),
     (4, 4, 'Social media content', 'How to be better in social media'),
    (5, 5, 'Modern medicine', 'How medicine is changing'),
     (6, 6, 'Telemedicine future', 'Discussion about the future of telemedicine'),
    (7, 7, 'AI basics for beginners', 'Basics in artificial intelligence'),
    (8, 8, 'Advance AI techniques', 'Discussion about more advanced AI concepts'),
    (9, 1, 'What is business', 'Introduction into business management'),
      (10, 2, 'Strategy in business', 'Discussion about how to create a great business strategy'),
        (11, 3, 'Web development', 'How to be a good web developer'),
    (12, 4, 'Software engineering', 'Basic concepts in software engineering'),
  (13, 5, 'AI for dummies', 'AI for beginners'),
    (14, 6, 'Advanced AI for experts', 'Advanced AI topics'),
      (15, 7, 'AI for kids', 'AI for kids'),
    (16, 8, 'AI in the future', 'Advanced AI concepts for kids');

-- Inserting data into Materialy table
INSERT INTO Materialy (sesja_id, nazwa, opis, url)
VALUES
    (1, 'Presentation_AI_1', 'Presentation for introduction to AI', 'https://example.com/presentation_ai_1'),
     (2, 'Material_ML_1', 'Material for machine learning workshop', 'https://example.com/material_ml_1'),
       (3, 'Marketing_presentation', 'Marketing presentation', 'https://example.com/marketing_presentation'),
       (4, 'Content_social_media', 'Content for social media', 'https://example.com/content_social_media');

-- Inserting data into Opinions table
INSERT INTO Opinie (sesja_id, uczestnik_id, ocena, komentarz, created_at)
VALUES
    (1, 1, 4, 'Great session!', '2024-08-05 10:00:00'),
    (2, 2, 5, 'Perfect content!', '2024-08-06 12:30:00'),
    (3, 3, 3, 'Nice session, but a bit too long.', '2024-08-07 14:45:00'),
     (1, 4, 5, 'Good quality!', '2024-08-08 16:00:00'),
     (4, 5, 2, 'Not interesting at all.', '2024-08-09 11:15:00'),
    (5, 6, 4, 'Good session!', '2024-08-10 13:00:00'),
       (6, 7, 5, 'Great session!', '2024-08-11 15:00:00'),
      (7, 8, 3, 'Okay session.', '2024-08-12 16:30:00');