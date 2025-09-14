import mysql.connector

try:
    username = input("Enter MySQL username: ")
    password = input("Enter MySQL password: ")    
    port = int(input("Enter MySQL port number (default 3306): "))
    if not port:
        port = 3306

    conn = mysql.connector.connect(
        host='localhost',
        user=username,
        password=password,
        port=port,
        database='crickstatz',
        auth_plugin='mysql_native_password'
        )
    if conn.is_connected():
        print("Connected to CrickStatz database successfully.")
    else:
        print("Failed to connect to the database.")
except mysql.connector.Error as err:
    print(f"Error: {err}")

cursor=conn.cursor()

# Initializing the tables
with open("database.sql", "r") as f:
    sql_file = f.read()

for statement in sql_file.split(';'):
    statement = statement.strip()
    if statement:
        try:
            cursor.execute(statement)
        except Exception as e:
            print(f"Error executing: {statement}\n{e}")
