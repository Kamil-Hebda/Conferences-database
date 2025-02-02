## Initial Requirements Analysis for Conference Management Database

### 1. Project Goals and Objectives

The primary objective of this project is to develop a fully functional database system capable of managing various aspects of conference management. This includes:

*   **Defining Conferences:** Support the creation and management of conference details.
*   **Managing Participants:** Facilitate participant registration and information storage.
*   **Organizing Sessions:** Enable the scheduling of conference sessions and assignment of presenters.
*   **Collecting Feedback:** Allow participants to provide feedback on sessions.
*   **Managing Materials**: Allow linking to resources related to particular sessions.
*   **Data Integrity:** Ensuring accuracy and consistency of data through enforced constraints.
*   **Scalability**: The ability to grow the system as new conferences and users are added.

### 2. Functional Requirements

The system must provide the following core functional requirements:

*   **Conference Management:**
    *   Ability to create, update, and delete conferences, including details like name, description, dates, location, and participant limits.
    *   Support for managing conference locations (addresses).

*   **Participant Management:**
    *   Ability to store and manage participant information, such as names, email addresses, and phone numbers.
    *   Support participant registration for specific conferences.
    *   Maintain participant registration status.

*   **Session Management:**
    *   Ability to create and manage conference sessions, including name, start and end times, location, and session description.
    *   Allow session assignment to a specific conference.

*    **Presentation Management:**
    *   Ability to connect presenters to conference sessions, with information on topic and description.
    *  Store presenter information with name and biography.

*   **Feedback Collection:**
    *   Allow participants to provide feedback (ratings and comments) on the sessions they attended.
    *   Store and manage feedback associated with particular session.

*   **Material Management:**
    *   Allow to link material resources to particular session, storing material name, description and url.

*   **Data Queries:**
    *   Support basic SQL queries for data retrieval.
    *   Implement more advanced queries, including joins, views, and functions.

*  **Data Modification**:
    *  Ability to modify the data according to business needs (e.g, updating registration status)

### 3. Non-Functional Requirements

The following non-functional requirements must also be satisfied:

*   **Data Integrity:**
    *   Enforce data constraints using `NOT NULL`, `UNIQUE`, and `CHECK` constraints.
    *   Maintain data relationships using foreign keys to ensure referential integrity.

*   **Database Choice**:
    *  Use PostgreSQL as the Relational Database Management System of choice.

*   **Performance:**
    *   The database should be performant for basic CRUD operations and queries.

*   **Scalability:**
    *   The design should allow for scalability to accommodate more conferences, participants, and sessions as needed.


### 4. Technology Stack

The database will be implemented using **PostgreSQL**, utilizing its features for data modeling, querying, and data integrity.

### 6. Expected Deliverables

The expected deliverables for this project include:

*   A fully functional database schema implemented in PostgreSQL.
*   Basic tables, relations and constraints which will ensure data consistency.
*   Implementation of several functions which help with data querying.
*   Implementation of triggers which allow us to create automated actions.
*   Implementation of several views which help with data querying and allow us to simplify more complex database requests.
*   Technical documentation, including ERD diagrams, table schemas, view definitions, trigger definitions and function definitions.