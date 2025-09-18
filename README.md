# CrickStatz-Tournament-Management-System

CrickStatz is a Python-MySQL based system for managing cricket tournaments and tracking player stats.

---

## 🚀 Requirements

   Before running the project, make sure you have the following installed:

- **MySQL Server** -
  [Download MySQL](https://dev.mysql.com/downloads/)

- **Python 3.x** -
  [Download Python](https://www.python.org/downloads/)

- **Libraries** -
  - **mysql.conector**
  - **prettytable**
  - **os**
  - **csv**
  - **colorama**
  - **pyfiglet**

---

## 📌 Setup Instructions

1. Clone this repository:
    
    Run this command on your terminal to insatll the package
    ```bash
    git clone https://github.com/aakash120608r/CrickStatz-Tournament-Management-System.git
    cd Crickstatz
    ```

2. Install required Python libraries:

    Install these libraries to use this program
    ```python
    pip install mysql-connector-python prettytable colorama pyfiglet
    ```

3. Set up the MySQL database:

    - Create a new database crickstatz by using this command (optional)
        ```sql
        CREATE DATABASE CRICKSTATZ;
        ```
    - Find your port number by using this command
        ```sql
        SHOW VARIABLES LIKE 'port';  
        ```
        Default port number is **3306**

5. Run the project:

    ```python
    python app.py
    ```
---

# 🏏 CrickStatz - Cricket Tournament Management System

A Python + MySQL based CLI app to manage cricket tournaments, including teams, players, venues, matches, stats, and predictions.

---

## ⚠️ Common Errors & Fixes

- **Error:** `ModuleNotFoundError: No module named 'mysql'`

    ➝ Install the MySQL connector using:
    ```bash
    pip install mysql-connector-python
    ```

---

- **Error:** `ModuleNotFoundError: No module named 'prettytable'`

    ➝ Install PrettyTable for tabular output:
    ```bash
    pip install prettytable
    ```

---

- **Error:** `ModuleNotFoundError: No module named 'colorama'`

    ➝ Install Colorama for colorful terminal UI:
    ```bash
    pip install colorama
    ```

---

- **Error:** `ModuleNotFoundError: No module named 'pyfiglet'`

    ➝ Install pyfiglet for ASCII art banners:
    ```bash
    pip install pyfiglet
    ```

---

- **Error:** `Authentication plugin 'caching_sha2_password' is not supported`

    ➝ This happens with MySQL 8+. Fix it by switching to the native password plugin:
    ```sql
    ALTER USER 'your_username'@'localhost' 
    IDENTIFIED WITH mysql_native_password BY 'your_password';
    FLUSH PRIVILEGES;
    ```
    Replace `'your_username'` and `'your_password'` with your own credentials.

---

- **Error:** `Access denied for user 'root'@'localhost' (using password: YES)`

    ➝ Ensure you are using the correct username and password when prompted.  
    ➝ If you forgot your MySQL root password, reset it using MySQL secure installation or your MySQL Workbench.

---

- **Error:** `Can't connect to MySQL server on 'localhost' (10061)`

    ➝ MySQL server is not running.  
    - Start the MySQL service manually:
      - On Windows: Search for **Services**, find **MySQL**, and click **Start**.  
      - On Linux/macOS:  
        ```bash
        sudo service mysql start
        ```
    
---

- **Error:** `Error during database initialization: 1049 (42000): Unknown database 'crickstatz'`

    ➝ Normally, the app auto-creates the database. If this appears:
    - Check that your MySQL user has permission to create databases.  
    - If not, create it manually:
      ```sql
      CREATE DATABASE crickstatz;
      ```

---

- **Error:** `Duplicate entry 'X' for key 'PRIMARY'`

    ➝ You are trying to insert a record with the same primary key (like re-adding the same player/team).  
    - Fix: Ensure you’re entering unique IDs or names.  
    - Use the **View Records** option before adding new ones.

---

- **Error:** `ValueError: invalid literal for int() with base 10: ''`

    ➝ This happens if you leave an input empty when an integer is required.  
    - Fix: Always provide a valid number, or if the field is optional, press Enter only where allowed.

---

- **Error:** Predictions not showing any results

    ➝ This means there’s no historical match data for the player/team you selected.  
    - Add some matches and stats first, then try predicting again.

---

## ✅ Pro Tips

- Always run the app in a terminal that supports colors (like PowerShell, CMD, or Linux shell).  
- Exported CSVs are saved in the `exports/` folder — check there after using export functions.  
- Use team IDs and player IDs shown in the **View Records** menu for adding stats or predictions.
