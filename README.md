# Documentation 

## Database structure


## Diagram ERD
 

### **Table: Konferencje**  

| Field Name         | Data Type   | Length | Description                                              | Constraints |
|--------------------|------------|--------|----------------------------------------------------------|-------------|
| `konferencja_id`   | `SERIAL`    | -      | Unique identifier for each conference.                   | Primary Key |
| `nazwa`            | `VARCHAR`   | 255    | Name of the conference (required).                       | NOT NULL    |
| `opis`             | `TEXT`      | -      | Detailed description of the conference (optional).       | -           |
| `data_rozpoczecia` | `DATE`      | -      | Start date of the conference (required).                 | NOT NULL    |
| `data_zakonczenia` | `DATE`      | -      | End date of the conference (required).                   | NOT NULL    |
| `miejsce`          | INT  | -    | Location of the conference (required).                   | NOT NULL           |
| `limit_uczestnikow`| `INT`       | -      | Maximum number of participants.                          | Default: 50 |

#### **Indexes & Keys**  
- **Primary Key**: `konferencja_id` (ensures uniqueness of each conference).  
- **Foreign Key**: `miejsce` references `Addresses(address_id)`.  

#### **Constraints & Additional Information**  
- The `nazwa`, `data_rozpoczecia`, and `data_zakonczenia` fields are required (`NOT NULL`).  
- The `limit_uczestnikow` field has a default value of `50`.  


---

### **Table: Addresses**  

| Field Name       | Data Type   | Length | Description                                              | Constraints |
|------------------|------------|--------|----------------------------------------------------------|-------------|
| `address_id`     | `SERIAL`    | -      | Unique identifier for each address.                      | Primary Key |
| `street`         | `VARCHAR`   | 50     | Street name of the address (optional).                   | -           |
| `city`           | `VARCHAR`   | 50     | City name (required).                                    | NOT NULL    |
| `building_number`| `INT`       | -      | Building number (required).                              | NOT NULL    |
| `flat_number`    | `INT`       | -      | Flat/apartment number (optional).                        | -           |
| `postal_code`    | `VARCHAR`   | 10     | Postal code (required).                                  | NOT NULL    |
| `country`        | `VARCHAR`   | 50     | Country name (required).                                 | NOT NULL    |
| `description`    | `VARCHAR`   | 50     | Additional description (optional).                       | -           |
| `type`           | `VARCHAR`   | 20     | Address type (`hotel`, `conference hall`, `other`).      | CHECK (`type` IN ('hotel', 'conference hall', 'other')) NOT NULL |

#### **Indexes & Keys**  
- **Primary Key**: `address_id` (ensures uniqueness of each address).  

#### **Constraints & Additional Information**  
- The `city`, `building_number`, `postal_code`, `country`, and `type` fields are required (`NOT NULL`).  
- The `type` field has a constraint to allow only `hotel`, `conference hall`, or `other`.  

---

### **Table: Uczestnicy**  

| Field Name        | Data Type   | Length | Description                                              | Constraints |
|-------------------|------------|--------|----------------------------------------------------------|-------------|
| `uczestnik_id`    | `SERIAL`    | -      | Unique identifier for each participant.                  | Primary Key |
| `imie`           | `VARCHAR`   | 25     | First name of the participant (required).                | NOT NULL    |
| `nazwisko`       | `VARCHAR`   | 25     | Last name of the participant (required).                 | NOT NULL    |
| `email`          | `VARCHAR`   | 50     | Unique email address of the participant (required).      | UNIQUE, NOT NULL |
| `numer_telefonu` | `VARCHAR`   | 15     | Phone number of the participant (optional).              | -           |

#### **Indexes & Keys**  
- **Primary Key**: `uczestnik_id` (ensures uniqueness of each participant).  

#### **Constraints & Additional Information**  
- The `imie`, `nazwisko`, and `email` fields are required (`NOT NULL`).  
- The `email` field must be unique.  

---

### **Table: Rejestracje**  

| Field Name        | Data Type   | Length | Description                                              | Constraints |
|-------------------|------------|--------|----------------------------------------------------------|-------------|
| `rejestracja_id`  | `SERIAL`    | -      | Unique identifier for each registration.                 | Primary Key |
| `uczestnik_id`    | `INT`       | -      | Reference to the participant registering.                | Foreign Key |
| `konferencja_id`  | `INT`       | -      | Reference to the registered conference.                  | Foreign Key |
| `data_rejestracji`| `DATE`      | -      | Date of registration (required).                         | NOT NULL    |
| `status`         | `VARCHAR`   | 20     | Registration status (`Zarejestrowany`, `Potwierdzony`, `Anulowany`). | CHECK (`status` IN ('Zarejestrowany', 'Potwierdzony', 'Anulowany')), Default: 'Zarejestrowany' |

#### **Indexes & Keys**  
- **Primary Key**: `rejestracja_id` (ensures uniqueness of each registration).  
- **Foreign Key**: `uczestnik_id` references `Uczestnicy(uczestnik_id)`.  
- **Foreign Key**: `konferencja_id` references `Konferencje(konferencja_id)`.  

#### **Constraints & Additional Information**  
- The `data_rejestracji` field is required (`NOT NULL`).  
- The `status` field has a constraint allowing only `Zarejestrowany`, `Potwierdzony`, or `Anulowany`, with a default of `Zarejestrowany`.  

---

### **Table: Sesje**  

| Field Name         | Data Type   | Length | Description                                              | Constraints |
|--------------------|------------|--------|----------------------------------------------------------|-------------|
| `sesja_id`        | `SERIAL`    | -      | Unique identifier for each session.                      | Primary Key |
| `konferencja_id`  | `INT`       | -      | Reference to the related conference.                     | Foreign Key, NOT NULL |
| `nazwa`           | `VARCHAR`   | 255    | Name of the session (required).                          | NOT NULL    |
| `data_rozpoczecia`| `TIMESTAMP` | -      | Start time of the session (required).                    | NOT NULL    |
| `data_zakonczenia`| `TIMESTAMP` | -      | End time of the session (required).                      | NOT NULL    |
| `miejsce`         | `VARCHAR`   | 255    | Session location details (room number, etc.) (optional).                    | -           |
| `opis`            | `TEXT`      | -      | Detailed description of the session (optional).          | -           |

#### **Indexes & Keys**  
- **Primary Key**: `sesja_id` (ensures uniqueness of each session).  
- **Foreign Key**: `konferencja_id` references `Konferencje(konferencja_id)`.  

#### **Constraints & Additional Information**  
- The `konferencja_id`, `nazwa`, `data_rozpoczecia`, and `data_zakonczenia` fields are required (`NOT NULL`).  

---


### **Table: Prelegenci**  

| Field Name      | Data Type   | Length | Description                                      | Constraints |
|---------------|------------|--------|------------------------------------------------|-------------|
| `prelegent_id` | `SERIAL`    | -      | Unique identifier for each speaker.             | Primary Key |
| `imie`        | `VARCHAR`   | 255    | First name of the speaker (required).           | NOT NULL    |
| `nazwisko`    | `VARCHAR`   | 255    | Last name of the speaker (required).            | NOT NULL    |
| `biografia`   | `TEXT`      | -      | Biography of the speaker (optional).            | -           |
| `zdjecie_url` | `VARCHAR`   | 255    | URL to the speaker's photo (optional).          | -           |

#### **Indexes & Keys**  
- **Primary Key**: `prelegent_id` (ensures uniqueness of each speaker).  

#### **Constraints & Additional Information**  
- The `imie` and `nazwisko` fields are required (`NOT NULL`).  

---

### **Table: Prezentacje**  

| Field Name      | Data Type   | Length | Description                                              | Constraints |
|-----------------|-------------|--------|----------------------------------------------------------|-------------|
| `prezentacja_id`| `SERIAL`    | -      | Unique identifier for each presentation.                 | Primary Key |
| `sesja_id`      | `INT`       | -      | Reference to the session where the presentation occurs.  | Foreign Key, NOT NULL |
| `prelegent_id`  | `INT`       | -      | Reference to the speaker presenting the session.         | Foreign Key, NOT NULL |
| `temat`         | `VARCHAR`   | 255    | Title of the presentation (required).                    | NOT NULL    |
| `opis`          | `TEXT`      | -      | Detailed description of the presentation (optional).     | -           |

#### **Indexes & Keys**  
- **Primary Key**: `prezentacja_id` (ensures uniqueness of each presentation).  
- **Foreign Key**: `sesja_id` references `Sesje(sesja_id)`.  
- **Foreign Key**: `prelegent_id` references `Prelegenci(prelegent_id)`.  

#### **Constraints & Additional Information**  
- The `sesja_id`, `prelegent_id`, and `temat` fields are required (`NOT NULL`).  

---

### **Table: Opinie**  

| Field Name      | Data Type   | Length | Description                                              | Constraints |
|-----------------|-------------|--------|----------------------------------------------------------|-------------|
| `opinia_id`     | `SERIAL`    | -      | Unique identifier for each opinion.                      | Primary Key |
| `sesja_id`      | `INT`       | -      | Reference to the session the opinion is about.           | Foreign Key, NOT NULL |
| `uczestnik_id`  | `INT`       | -      | Reference to the participant providing the opinion.      | Foreign Key, NOT NULL |
| `ocena`         | `INT`       | -      | Rating given by the participant (from 1 to 5).           | CHECK (`ocena` BETWEEN 1 AND 5) NOT NULL |
| `komentarz`     | `TEXT`      | -      | Comment or feedback from the participant (optional).     | -           |
| `created_at`    | `TIMESTAMP` | -      | Timestamp of when the opinion was created (default: current timestamp). | Default: CURRENT_TIMESTAMP |

#### **Indexes & Keys**  
- **Primary Key**: `opinia_id` (ensures uniqueness of each opinion).  
- **Foreign Key**: `sesja_id` references `Sesje(sesja_id)`.  
- **Foreign Key**: `uczestnik_id` references `Uczestnicy(uczestnik_id)`.  

#### **Constraints & Additional Information**  
- The `sesja_id`, `uczestnik_id`, and `ocena` fields are required (`NOT NULL`).  
- The `ocena` field must be an integer between 1 and 5.  

---

### **Table: Materialy**  

| Field Name     | Data Type   | Length | Description                                              | Constraints |
|----------------|-------------|--------|----------------------------------------------------------|-------------|
| `material_id`  | `SERIAL`    | -      | Unique identifier for each material.                     | Primary Key |
| `sesja_id`     | `INT`       | -      | Reference to the session associated with the material.   | Foreign Key, NOT NULL |
| `nazwa`        | `VARCHAR`   | 255    | Name of the material (required).                         | NOT NULL    |
| `opis`         | `TEXT`      | -      | Description of the material (optional).                  | -           |
| `url`          | `VARCHAR`   | 255    | URL to access the material (required).                   | NOT NULL    |

#### **Indexes & Keys**  
- **Primary Key**: `material_id` (ensures uniqueness of each material).  
- **Foreign Key**: `sesja_id` references `Sesje(sesja_id)`.  

#### **Constraints & Additional Information**  
- The `sesja_id`, `nazwa`, and `url` fields are required (`NOT NULL`).  


## Views 

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
This view provides the following details:
- **Registration Information**: Shows the registration ID and the date the registration was placed.
- **Registration Status**: Displays the current status of the registration (e.g., `Zarejestrowany`, `Potwierdzony`, `Anulowany`).
- **Participant Information**: Includes the participant's first name, last name, and email address.
  
It retrieves data by joining the `Rejestracje` table with the `Uczestnicy` table.

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
This view provides the following details:
- **Conference Information**: Displays the conference ID, name, and start date.
- **Session Information**: Includes the session name, start date, and location.
  
It joins the `Konferencje` table with the `Sesje` table to show the relationship between conferences and their respective sessions.

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
This view provides the following details:
- **Session Information**: Includes the session ID and name.
- **Presenter Information**: Displays the presenter's first name and surname.
- **Presentation Information**: Shows the topic and description of the presentation.
- **Session Description**: Provides the description of the session itself.
  
It retrieves data by joining the `Sesje`, `Prelegenci`, and `Prezentacje` tables.

---

## Example Views Queries

### **1. View: `view_rejestracje_uczestnicy`**

#### Query to retrieve all registrations and participants:
```sql
SELECT * FROM view_rejestracje_uczestnicy;
```

#### Query to filter registrations by a specific status (e.g., "Zarejestrowany"):

```sql
SELECT * FROM view_rejestracje_uczestnicy
WHERE rejestracja_status = 'Zarejestrowany';
```

### **2. View: `view_konferencje_sesje`**

#### Query to retrieve all conferences and sessions:

```sql
SELECT * FROM view_konferencje_sesje;
```

#### Query to filter by a specific conference name (e.g., "Konferencja 2025"):

```sql
SELECT * FROM view_konferencje_sesje
WHERE konferencja_nazwa = 'Konferencja 2025';
```
### **3. View: `view_sesje_prelegenci`**

#### Query to retrieve all session, presenter, and presentation details:

```sql
SELECT * FROM view_sesje_prelegenci;
```

#### Query to filter by a specific session name (e.g., "Session 1"):

```sql
SELECT * FROM view_sesje_prelegenci
WHERE sesja_nazwa = 'Session 1';
```

#### Query to filter by a specific presenter (e.g., "John Doe"):

```sql
SELECT * FROM view_sesje_prelegenci
WHERE prelegent_imie = 'John' AND prelegent_nazwisko = 'Doe';
```

## Example SELECT Queries

### **1. Retrieve all conferences with their dates and locations**
```sql
SELECT konferencja_id, nazwa, data_rozpoczecia, data_zakonczenia, miejsce FROM Konferencje;
```

### **2. Retrieve all participants with their email and phone number**
```sql
SELECT imie, nazwisko, email, numer_telefonu FROM Uczestnicy;
```

### **3. Retrieve all opinions with user name, user surname and rated product name**
```sql
SELECT c.imie, c.nazwisko, s.nazwa AS "nazwa_sesji", o.komentarz, o.ocena FROM Opinie o
JOIN Sesje s USING(sesja_id)
JOIN Uczestnicy c USING(uczestnik_id);
```

### **4. Retrieve sessions with the most opinions and with average rating**
```sql
SELECT s.nazwa, count(o.komentarz) AS "number of opinions", ROUND(AVG(o.ocena), 2) AS "average rating" FROM sesje s
JOIN opinie o USING(sesja_id)
GROUP BY s.nazwa ORDER BY count(o.komentarz) DESC;
```

### **5. Retrieve registrations with participant name and conference name**
```sql
SELECT r.rejestracja_id, r.data_rejestracji, c.imie, c.nazwisko, k.nazwa FROM Rejestracje r
JOIN Uczestnicy c USING(uczestnik_id) JOIN Konferencje k USING(konferencja_id);
```

### **6. Retrieve most popular conference**
```sql
SELECT k.nazwa, COUNT(r.uczestnik_id) AS ilosc_uczestnikow FROM Konferencje k
JOIN Rejestracje r USING(konferencja_id)
GROUP BY k.konferencja_id ORDER BY ilosc_uczestnikow DESC LIMIT 1;
```

---

## Database Functions

1. **`calculate_average_rating(sesja_id)`**  
  Calculates the average rating for a specified session based on the ratings provided by the participants.
2. **`get_participants_for_conference(konferencja_id)`**  
  Retrieves a list of all participants who are registered for the given conference.
3. **`get_sessions_for_conference(konferencja_id)`**  
  Retrieves all sessions belonging to a specific conference.
4. **`get_presenters_for_session(sesja_id)`**  
  Retrieves all presenters for a given session.
5. **`get_conference_details(konferencja_id)`**  
   Retrieves detailed information about a specific conference, such as the conference name, start and end date, location, and associated addresses.

### **Usage Examples**

#### **1. Calculating Average Rating:**
```sql
SELECT calculate_average_rating(1); 
-- Replace 1 with the actual session ID for which the average rating is needed.
```

#### **2. Getting Participants for Conference:**

```sql
SELECT * FROM get_participants_for_conference(1); 
-- Replace 1 with the actual conference  ID to retrieve its registered participants.
```

#### **3. Getting Sessions for a Conference:**

```sql
SELECT * FROM get_sessions_for_conference(1); 
-- Replace 1 with the actual conference ID to retrieve its sessions.
```

#### **4. Getting Presenters for a Session:**

```sql
SELECT * FROM get_presenters_for_session(1); 
-- Replace 1 with the actual session ID to retrieve the presenters for that session.
```

#### **5. Getting Conference Details:**

```sql
SELECT * FROM get_conference_details(1); 
-- Replace 1 with the actual conference ID to retrieve its details.
```

---







## Triggers

### **1. Trigger: update_participant_limit_trigger**

#### **Associated Function: `update_participant_limit()`**

**Function Purpose:**  
This function ensures that when a new participant registers for a conference, it checks if the maximum participant limit for that conference has been reached. If the conference’s limit is reached, the registration status is automatically set to `Anulowany`.

**Trigger Operation:**
- **Trigger Name:** `update_participant_limit_trigger`
- **Trigger Timing:** `BEFORE INSERT`
- **Table Affected:** `Rejestracje` 
- **Trigger Action:**  
  The trigger calls the `update_participant_limit()` function before a new row is inserted into the `Rejestracje` table. It checks if the number of registrations for a specific conference exceeds the maximum participant limit defined in the `Konferencje` table. If the limit is exceeded, it cancels the registration by setting the `status` field to `Anulowany`.

**Example Use Case:**  
This trigger automatically ensures that no more participants are registered for a conference than the allowed limit. If a registration attempt exceeds the limit, it blocks the registration and sets the status to 'Anulowany'.

---

### **2. Trigger: block_cancellation_trigger**

#### **Associated Function: `block_cancellation()`**

**Function Purpose:**  
This function prevents the cancellation of a confirmed registration. If a participant tries to cancel a registration that is already confirmed (`status = 'Potwierdzony'`), it raises an exception, blocking the update.

**Trigger Operation:**
- **Trigger Name:** `block_cancellation_trigger`
- **Trigger Timing:** `BEFORE UPDATE`
- **Table Affected:** `Rejestracje` 
- **Trigger Action:**  
  The trigger calls the `block_cancellation()` function before any update is made to the `Rejestracje` table. It compares the old and new registration status values. If the status is being changed from `Potwierdzony`  to `Anulowany`, an exception is raised, preventing the update.

**Example Use Case:**  
This trigger ensures that once a registration is confirmed, it cannot be cancelled unless manually intervened. It maintains the integrity of the registration process by enforcing this business rule.

### **Usage Examples**

#### **Example: Trigger for Participant Limit**

##### **Updating Registration to `Anulowany` if participant limit is reached:**
```sql
-- inserting registration with limit of 1
INSERT INTO Konferencje(nazwa, data_rozpoczecia, data_zakonczenia, limit_uczestnikow)
VALUES ('Konferencja testowa', '2024-08-15', '2024-08-16', 1);

-- First registration for the conference is successful
INSERT INTO Rejestracje(uczestnik_id, konferencja_id, data_rejestracji, status)
VALUES (1, 1, CURRENT_DATE, 'Zarejestrowany'); -- this registration is ok

-- Second registration for the conference exceeds the limit and will be automatically set to 'Anulowany'
INSERT INTO Rejestracje(uczestnik_id, konferencja_id, data_rejestracji, status)
VALUES (2, 1, CURRENT_DATE, 'Zarejestrowany'); -- this registration will be changed to cancelled

-- Checking the registrations for conference_id = 1
SELECT * FROM Rejestracje WHERE konferencja_id = 1;
```

#### Example: Trigger for blocking cancellation
##### Preventing Cancellation of a Confirmed Registration:

```sql
-- Inserting a conference 
INSERT INTO Konferencje(nazwa, data_rozpoczecia, data_zakonczenia, limit_uczestnikow)
VALUES ('Konferencja testowa 2', '2024-09-10', '2024-09-11', 5);

-- Registering a participant with status 'Zarejestrowany'
INSERT INTO Rejestracje(uczestnik_id, konferencja_id, data_rejestracji, status)
VALUES (1, 2, CURRENT_DATE, 'Zarejestrowany');  

-- Confirming the registration
UPDATE Rejestracje
SET status = 'Potwierdzony'
WHERE rejestracja_id = 1;

-- Attempting to cancel a confirmed registration will raise an exception
-- The following will result in an error: "Nie można anulować potwierdzonej rejestracji."
UPDATE Rejestracje
SET status = 'Anulowany'
WHERE rejestracja_id = 1;

-- Checking the registration status
SELECT * FROM Rejestracje WHERE rejestracja_id = 1;

```