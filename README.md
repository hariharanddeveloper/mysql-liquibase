# Database Management with Liquibase and MySQL

This project is a comprehensive database management system for a college, utilizing **Liquibase** for version control and **MySQL** as the relational database management system. The system manages various entities like departments, staffs, and students, and includes functions, stored procedures, triggers, and views for efficient data handling.

## Features

-   **Liquibase Integration**: Version control for database changes.
-   **MySQL Database**: The system runs on MySQL with tables, triggers, stored procedures, and views.
-   **Comprehensive Structure**: Handles college staff, students, departments, and more.
-   **Backup Scripts**: Automated backup with `backup.bat` script and logs.

## Setup Instructions

### 1. Prerequisites

-   **MySQL** (version 8.x recommended)
-   **Liquibase** (version 4.x recommended)
-   **Java** (for Liquibase)

### 2. MySQL Environment Setup

-   Ensure MySQL is installed and running on your system.
-   Create a new database called `college`:

```sql
CREATE DATABASE IF NOT EXISTS college;
```

-   Open the `liquibase.properties` file and ensure your database connection details are correct:
-   Change the url, username, and password to match your MySQL setup:

```
url=jdbc:mysql://localhost:3306/college
username=your_database_username
password=your_database_password
driver=com.mysql.cj.jdbc.Driver
changeLogFile=changelog-master.xml
```

### 3. Install Liquibase CLI

-   Download and install Liquibase from [Liquibase Official Site](https://www.liquibase.org/download).

-   After installation, verify that Liquibase is installed correctly by running:

```bash
liquibase --version
```

-   You will also need to install the **MySQL JDBC Driver**. Download the driver from the [MySQL website](https://dev.mysql.com/downloads/connector/j/) and place the `.jar` file in your Liquibase `lib` folder, or reference the file when running Liquibase.

### 4. Running the Project

1. Apply the database changes using Liquibase:

```bash
liquibase update
```

2. Check the status of pending changes:

```bash
liquibase status
```

### 5. Backup and Restore

-   To backup the database, use the `backup.bat` script, ensure that the `mysqldump` path is set in your system's environment variables.

-   Also, update the `username` and `password` fields in the `backup.bat` script to match your MySQL credentials.

-   To backup the database, run the following:

```bash
cd backup
backup.bat
```

-   To restore the database, use the generated `.sql` backup script.

## Changelog

The project uses a `changelog-master.xml` file to track changesets. Each SQL file (tables, triggers, views, etc.) is listed in the changelog, ensuring version control over the database schema.
