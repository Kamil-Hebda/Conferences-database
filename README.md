# Dokumentacja

## Database structure

### **Table: Konferencje**

| Field Name         | Data Type         | Length | Description                                                                 |
|--------------------|-------------------|--------|-----------------------------------------------------------------------------|
| `konferencja_id`   | `SERIAL`          | -      | Unique identifier for each conference.                                         |
| `nazwa`            | `VARCHAR`         | 255    | The name of the conference (required).                                         |
| `opis`             | `TEXT`            | -      | A detailed description of the conference (optional).                           |
| `data_rozpoczecia` | `DATE`           | -      | The start date of the conference (required).                                   |
| `data_zakonczenia` | `DATE`           | -      | The end date of the conference (required).                                     |
| `miejsce`        | `VARCHAR`         | 255    | The location of the conference (optional).                       |
|`limit_uczestnikow`| `INT`            | -      | The participant limit for the conference. |


 **Notes**:
- **Primary Key**: The `konferencja_id` column uniquely identifies each conference in the table.
- **Mandatory Fields**: The `nazwa`, `data_rozpoczecia`, `data_zakonczenia`  columns must have values (`NOT NULL` constraint).
-  **Default Values**: The `limit_uczestnikow` defaults to `0`.


---

### **Table: Adresy**

| Field Name        | Data Type        | Length | Description                                                              |
|-------------------|------------------|--------|--------------------------------------------------------------------------|
| `adres_id`      | `SERIAL`         | -      | Unique identifier for each address.                                      |
| `street`          | `VARCHAR`        | 50     | The name of the street (optional).                                       |
| `city`            | `VARCHAR`        | 50     | The name of the city (required).                                         |
| `building_number` | `INT`            | -      | The building number (required).                                          |
| `flat_number`     | `INT`            | -      | The flat or apartment number (optional).                                 |
| `postal_code`     | `VARCHAR`        | 10     | The postal code (required).                                              |
| `country`         | `VARCHAR`        | 50     | The country where the address is located (required).                     |
| `description`     | `VARCHAR`        | 50     | Additional description of the address (optional).                        |
| `type`            | `VARCHAR`        | 20     | The type of address (`hotel`, `conference hall`, or `other`) (required).    |

**Notes:**
- **Primary Key**: The `address_id` column uniquely identifies each address in the table.
- **Mandatory Fields**: The `city`, `building_number`, `postal_code`, `country`, and `type` columns must have values (`NOT NULL` constraint).
- **Optional Fields**: The `street`, `flat_number`, and `description` columns are optional and can be left empty.
- **Constraints**: The `type` column can only contain one of the following values: `hotel`, `conference hall`, or `other` using a `CHECK` constraint.
- **Length Restrictions**: The `street`, `city`, and `country` columns can hold up to 50 characters, and the `postal_code` column can hold up to 10 characters.

---

### **Table: Uczestnicy**

| Field Name           | Data Type        | Length | Description                                                           |
|----------------------|------------------|--------|-----------------------------------------------------------------------|
| `uczestnik_id`       | `SERIAL`         | -      | Unique identifier for each participant.                                  |
| `imie`               | `VARCHAR`        | 25     | The first name of the participant (required).                            |
| `nazwisko`            | `VARCHAR`        | 25     | The surname of the participant (required).                               |
| `email`              | `VARCHAR`        | 50     | The unique email address of the participant (required).                  |
| `numer_telefonu`       | `VARCHAR`        | 15     | The phone number of the participant (optional).                          |
| `adres_id`| `INT`            | -      | Foreign key referencing the address in the `Addresses` table.  |

**Notes:**
- **Primary Key**: The `uczestnik_id` column uniquely identifies each participant in the table.
- **Mandatory Fields**: The `imie`, `nazwisko`, and `email` columns must have values (`NOT NULL` constraint).
- **Unique Constraint**: The `email` column must contain unique values, ensuring no two participants can have the same email address.
- **Optional Fields**: The `numer_telefonu` and `adres_id` columns are optional and can be left empty.
- **Foreign Keys**: 
  -  `adres_id` references `address_id` in the `Addresses` table to associate a participant with a address.
- **Length Restrictions**: The `imie` and `nazwisko` columns can hold up to 25 characters, and the `email` column can hold up to 50 characters.

---

### **Table: Rejestracje**

| Field Name    | Data Type        | Length | Description                                                                 |
|---------------|------------------|--------|-----------------------------------------------------------------------------|
| `rejestracja_id`    | `SERIAL`         | -      | Unique identifier for each registration.                                           |
| `uczestnik_id` | `INT`            | -      | Foreign key referencing the participant who placed the order in the `Uczestnicy` table. |
| `konferencja_id`  | `INT`           | -      | Foreign key referencing the conference in the `Konferencje` table.  |
| `data_rejestracji`  | `DATE`           | -      | The date when the registration was placed (required).                              |
| `status`      | `VARCHAR`        | 20     | The status of the registration (`Zarejestrowany`, `Potwierdzony`, or `Anulowany`) (required, with default `Zarejestrowany`). |

**Notes:**
- **Primary Key**: The `rejestracja_id` column uniquely identifies each registration in the table.
- **Mandatory Fields**: The `data_rejestracji` and `status` columns must have values (`NOT NULL` constraint on `data_rejestracji`).
- **Default Values**: The `status` column defaults to `Zarejestrowany` if no value is specified.
- **Constraints**: The `status` column can only contain one of the following values: `Zarejestrowany`, `Potwierdzony`, or `Anulowany` using a `CHECK` constraint.
- **Foreign Key**: 
  - `uczestnik_id` references `uczestnik_id` in the `Uczestnicy` table, establishing a relationship between orders and customers.
    - `konferencja_id` references `konferencja_id` in the `Konferencje` table, establishing a relationship between orders and customers.

---

### **Table: Sesje**

| Field Name        | Data Type         | Length | Description                                                          |
|-------------------|-------------------|--------|----------------------------------------------------------------------|
| `sesja_id`   | `SERIAL`          | -      | Unique identifier for each item in the order.                        |
| `konferencja_id`        | `INT`             | -      | Foreign key referencing the conference in the `Konferencje` table.             |
| `nazwa`        | `VARCHAR`             | 255      | The name of the session.  |
|`data_rozpoczecia` | `TIMESTAMP`             | -      | The start date of the session (required).     |
|`data_zakonczenia` | `TIMESTAMP`             | -      | The end date of the session (required).     |
| `miejsce`   | `VARCHAR`             | 255   | The place of the session.  |
| `opis`   | `TEXT`             | -   | The description of the session. |

---

### **Notes**:
- **Primary Key**: The `sesja_id` column uniquely identifies each record in the table.
- **Mandatory Fields**: The `konferencja_id`, `data_rozpoczecia`, `data_zakonczenia`, `nazwa` columns must have values (`NOT NULL` constraint).
- **Foreign Keys**:
  - `konferencja_id` references `konferencja_id` in the `Konferencje` table, establishing a relationship between the order and its items.


---

### **Table: Prelegenci**

| Field Name       | Data Type         | Length | Description                                                                 |
|------------------|-------------------|--------|-----------------------------------------------------------------------------|
| `prelegent_id`     | `SERIAL`          | -      | Unique identifier for each presenter.                                         |
|  `imie` | `VARCHAR`         | 255 | The first name of the presenter.      |
|  `nazwisko` | `VARCHAR`         | 255 | The last name of the presenter.       |
|`biografia` | `TEXT`            | -      | A detailed description of the presenter (optional).                           |
|`zdjecie_url` | `VARCHAR`         | 255    | URL of the presenter's image (optional).       |

**Notes:**
- **Primary Key**: The `prelegent_id` column uniquely identifies each payment in the table.
- **Mandatory Fields**: The `imie` and `nazwisko` columns must have values (`NOT NULL` constraint).

---

### **Table: Prezentacje**

| Field Name       | Data Type        | Length | Description                                                               |
|------------------|------------------|--------|---------------------------------------------------------------------------|
| `prezentacja_id`   | `SERIAL`         | -      | Unique identifier for each presentation.                              |
| `sesja_id`     | `INT`            | -      | Foreign key referencing the session in the `Sesje` table.              |
| `prelegent_id`     | `INT`            | -      | Foreign key referencing the presenter in the `Prelegenci` table.              |
| `temat`           | `VARCHAR`        | 255     | The topic of the presentation (required).                                       |
| `opis` | `TEXT`          | -    | The detailed description of the presentation.  |

**Notes:**
- **Primary Key**: The `prezentacja_id` column uniquely identifies each record in the table.
- **Mandatory Fields**: The `sesja_id`, `prelegent_id` and `temat` columns must have a values (`NOT NULL` constraint).
- **Foreign Keys**:
  - `prelegent_id` references `prelegent_id` in the `Prelegenci` table, establishing a relationship between inventory records and products.
    -  `sesja_id` references `sesja_id` in the `Sesje` table, establishing a relationship between inventory records and products.

---

### **Table: Opinie**

| Field Name    | Data Type         | Length | Description                                                               |
|---------------|-------------------|--------|---------------------------------------------------------------------------|
| `opinia_id`  | `SERIAL`          | -      | Unique identifier for each opinion.                                       |
| `sesja_id`  | `INT`             | -      | Foreign key referencing the sesion in the `Sesje` table (required).   |
| `uczestnik_id` | `INT`             | -      | Foreign key referencing the customer in the `Uczestnicy` table (required). |
| `ocena`      | `INT`             | -      | The rating given by the customer (required, must be between 1 and 5).     |
| `komentarz`     | `TEXT`            | -      | The comment provided by the customer (optional).                          |
| `created_at`  | `TIMESTAMP`       | -      | The timestamp when the opinion was created (defaults to current timestamp).|

**Notes:**
- **Primary Key**: The `opinia_id` column uniquely identifies each opinion in the table.
- **Mandatory Fields**: The `sesja_id`, `uczestnik_id`, and `ocena` columns must have values (`NOT NULL` constraint).
- **Default Values**: The `created_at` column defaults to the current timestamp if no value is provided.
- **Constraints**: 
  - The `ocena` column must be an integer between 1 and 5, enforced by a `CHECK` constraint.
- **Foreign Keys**: 
  - `sesja_id` references `sesja_id` in the `Sesje` table, ensuring that each opinion is associated with a valid session.
  - `uczestnik_id` references `uczestnik_id` in the `Uczestnicy` table, ensuring that each opinion is associated with a valid customer.

---
### **Table: Materialy**

| Field Name   | Data Type | Length | Description |
|------------|-----------|--------|-------------|
| `material_id` | `SERIAL` | - | Unique identifier for each material. |
| `sesja_id` | `INT` | - | Foreign key referencing the session in the `Sesje` table. |
|`nazwa`| `VARCHAR`        | 255     | The name of the material. |
| `opis` | `TEXT` | - | A detailed description of the material. |
| `url` | `VARCHAR`|255 | The url of the material.  |
**Notes:**
* **Primary Key:** The `material_id` uniquely identifies the record.
* **Mandatory Fields:** The `sesja_id`, `nazwa`, and `url` columns must have a value (`NOT NULL` constraint).
* **Foreign Keys:**
    - `sesja_id` references `sesja_id` in the `Sesje` table, establishing a relationship between materials and sesion.
---

## Diagram ERD
(The ERD diagram needs to be updated accordingly)

## Views for the Database

### **1. View: View_Rejestracje_Uczestnicy**

| Field Name         | Data Type        | Description                                    |
|--------------------|------------------|------------------------------------------------|
| `rejestracja_id`         | `INT`            | Unique identifier for the registration.               |
| `data_rejestracji`       | `DATE`           | The date when the registration was placed.            |
| `rejestracja_status`     | `VARCHAR(20)`    | The current status of the registration.               |
| `uczestnik_imie`    | `VARCHAR(25)`    | The first name of the participant.                |
| `uczestnik_nazwisko` | `VARCHAR(25)`    | The surname of the participant.                   |
| `uczestnik_email`   | `VARCHAR(50)`    | The email address of the participant.             |

**Description**:  
This view retrieves information about registrations along with participant details. It joins the `Rejestracje` table with the `Uczestnicy` table, displaying registration ID, registration date, status, and the participant's first name, surname, and email.

---

### **2. View: view_konferencje_sesje**

| Field Name         | Data Type        | Description                                    |
|--------------------|------------------|------------------------------------------------|
| `konferencja_id`       | `INT`            | Unique identifier for the conference.             |
| `konferencja_nazwa`   | `VARCHAR(255)`    |  Name of the conference. |
| `konferencja_data_rozpoczecia`     | `DATE`           | The date when the conference started.         |
|`sesja_nazwa`    |`VARCHAR(255)`| The name of the session|
|`sesja_data_rozpoczecia`    |`TIMESTAMP`|  The date when the session started. |
|`sesja_miejsce`    |`VARCHAR(255)`| The location of the session |


**Description**:  
This view retrieves information about conferences and sessions. It joins the `Konferencje` table with the `Sesje` table to display conference details with related session information.

---

### **3. View: view_sesje_prelegenci**

| Field Name         | Data Type        | Description                                    |
|--------------------|------------------|------------------------------------------------|
| `sesja_id`       | `INT`            | Unique identifier for the sesion.             |
| `sesja_nazwa`   | `VARCHAR(255)`    | The name of the sesion.                       |
| `prelegent_imie`     | `VARCHAR(255)`    | The name of the presenter.              |
|`prelegent_nazwisko` | `VARCHAR(255)`    | The surname of the presenter.              |
|`prezentacja_temat`   |`VARCHAR(255)`    | The topic of the presentation.    |
| `opis_prezentacji`|`TEXT` | The description of the presentation. |
| `opis_sesji`|`TEXT` | The description of the session. |


**Description**:  
This view combines data from the `Sesje`, `Prelegenci`, and `Prezentacje` tables to display detailed information about sessions and its presenters.
It shows session name, presenter details, topic of the presentation, and descriptions of the session and presentation.

---

## Example SELECT queries

### **1. Retrieve all conferences with their dates and locations**
```sql
SELECT konferencja_id, nazwa, data_rozpoczecia, data_zakonczenia, miejsce FROM Konferencje;
```

### **2. Retrieve all participants with their email and phone number**
```sql
SELECT imie, nazwisko, email, numer_telefonu FROM Uczestnicy;
```

### **3. Retrieve all participants with addresses**
```sql
SELECT c.imie, c.nazwisko, a.* FROM Uczestnicy c JOIN Addresses a ON c.adres_id = a.address_id;
```

### **4. Retrieve all opinions with user name, user surname and rated product name**
```sql
SELECT c.imie, c.nazwisko, s.nazwa AS "nazwa_sesji", o.komentarz, o.ocena FROM Opinie o
JOIN Sesje s USING(sesja_id)
JOIN Uczestnicy c USING(uczestnik_id);
```

### **5. Retrieve sessions with the most opinions and with average rating**
```sql
SELECT s.nazwa, count(o.komentarz) AS "number of opinions", ROUND(AVG(o.ocena), 2) AS "average rating" FROM sesje s
JOIN opinie o USING(sesja_id)
GROUP BY s.nazwa ORDER BY count(o.komentarz) DESC;
```

### **6. Retrieve registrations with participant name and conference name**
```sql
SELECT r.rejestracja_id, r.data_rejestracji, c.imie, c.nazwisko, k.nazwa FROM Rejestracje r
JOIN Uczestnicy c USING(uczestnik_id) JOIN Konferencje k USING(konferencja_id);
```

### **7. Retrieve most popular conference**
```sql
SELECT k.nazwa, COUNT(r.uczestnik_id) AS ilosc_uczestnikow FROM Konferencje k
JOIN Rejestracje r USING(konferencja_id)
GROUP BY k.konferencja_id ORDER BY ilosc_uczestnikow DESC LIMIT 1;
```

---

## Database Stored Procedures (Functions)

These functions encapsulate common database operations, making them reusable and efficient.

### **Functionality**

- **calculate_average_rating(sesja_id_input INT):** Calculates the average rating for a specified session.
- **get_participants_for_conference(konferencja_id_input INT):** Retrieves all participants registered to the given conference.
- **get_sessions_for_conference(konferencja_id_input INT):** Retrieves all sessions belonging to a specific conference.
- **get_presenters_for_session(sesja_id_input INT):** Retrieves all presenters for a given session.
- **get_conference_details(konferencja_id_input INT):** Retrieves detailed information for a specific conference, including addresses.

### **Usage Examples**

#### **Calculating Average Rating:**
```sql
SELECT calculate_average_rating(1); -- Replace 1 with the actual sesja ID
```

#### **Getting Participants for Conference:**
```sql
SELECT * FROM get_participants_for_conference(1); -- Replace 1 with the actual konferencja ID
```

#### **Getting Sessions by Conference:**
```sql
SELECT * FROM get_sessions_for_conference(1); -- Replace 1 with the actual conference ID
```

#### **Getting Presenters for Session:**
```sql
SELECT * FROM get_presenters_for_session(1); -- Replace 1 with the actual session ID
```

#### **Getting Conference Details:**
```sql
SELECT * FROM get_conference_details(1); -- Replace 1 with the actual conference ID
```

---

## Database Triggers

### **Trigger Functionality**

1. **`update_participant_limit_trigger`** - Checks if the number of participants reached the limit and changes the status to `Anulowany`.

2. **`prevent_duplicate_opinions_trigger`** - Prevents participants from adding multiple opinions for the same session.

### **Usage Examples**

#### **Prevent duplicate opinions:**
```sql
-- inserting opinions
INSERT INTO Opinions(sesja_id, uczestnik_id, ocena) VALUES (1,1,5); -- this one is ok
INSERT INTO Opinions(sesja_id, uczestnik_id, ocena) VALUES (1,1,1); -- this one will fail
```

#### **Updating Registration to `Anulowany` if participant limit is reached:**
```sql
-- inserting registration with limit of 1
INSERT INTO Konferencje(nazwa, data_rozpoczecia, data_zakonczenia, limit_uczestnikow)
VALUES ('Konferencja testowa', '2024-08-15', '2024-08-16', 1);

INSERT INTO Rejestracje(uczestnik_id, konferencja_id, data_rejestracji, status)
VALUES (1, 1, CURRENT_DATE, 'Zarejestrowany'); -- this registration is ok

INSERT INTO Rejestracje(uczestnik_id, konferencja_id, data_rejestracji, status)
VALUES (2, 1, CURRENT_DATE, 'Zarejestrowany'); -- this registration will be changed to cancelled

SELECT * FROM Rejestracje WHERE konferencja_id = 1;
```

### **Benefits**

- **Automation:** Triggers automate tasks that would otherwise require manual intervention.
- **Data Integrity:** Triggers help enforce data integrity by applying rules automatically.
- **Consistency:** Triggers help maintain consistency across different parts of the database.
- **Real-Time Updates:** Triggers perform updates in real-time without requiring application intervention.
- **Code Simplification:** Triggers encapsulate data logic, reducing complexity in application code.

