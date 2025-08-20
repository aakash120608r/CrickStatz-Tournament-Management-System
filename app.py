import mysql.connector

def connection():
    username = input("Enter MySQL username: ")
    password = input("Enter MySQL password: ")    

    try:
        conn = mysql.connector.connect(
            host='localhost',
            user=username,
            password=password,
            database='crickstatz'
        )
        if conn.is_connected():
            print("Connected to CrickStatz database successfully.")
            return conn
        else:
            print("Failed to connect to the database.")
            return None

    except mysql.connector.Error as err:
        print(f"Error: {err}")
        return None