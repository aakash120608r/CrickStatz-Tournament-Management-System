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
