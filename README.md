# CrickStatz-Tournament-Management-System

CrickStatz is a Python-MySQL based system for managing cricket tournaments and tracking player stats.

---

## 🚀 Requirements

   Before running the project, make sure you have the following installed:

- **Python 3.x** -
  [Download Python](https://www.python.org/downloads/)

- **MySQL Server** -
  [Download MySQL](https://dev.mysql.com/downloads/)

- **IDE / Code Editor**  
  Any Python-compatible IDE such as:  
  - [PyCharm](https://www.jetbrains.com/pycharm/)  
  - [VS Code](https://code.visualstudio.com/)  
  - [IDLE (comes with Python)](https://docs.python.org/3/library/idle.html)  

---

## 📌 Setup Instructions

1. Clone this repository:  

    ```bash
   git clone https://github.com/aakash120608r/CrickStatz-Tournament-Management-System.git
   cd Crickstatz  

2. Install required Python libraries:

   ```python
   pip install mysql-connector-python

3. Set up the MySQL database:

   - Create a new database crickstatz
   - Update your database connection details in the project code.

4. Run the project:

   ```python
   python main.py

---

## ⚠️ Common Errors & Fixes

- Error: ModuleNotFoundError: No module named 'mysql'

   ➝ Install the MySQL connector using:

   ```python
   pip install mysql-connector-python

- Error: Authentication plugin 'caching_sha2_password' is not supported

   ➝ This happens with MySQL 8+. Fix it by:

   ```sql
   ALTER USER 'your_username'@'localhost' 
   IDENTIFIED WITH mysql_native_password BY 'your_password';
