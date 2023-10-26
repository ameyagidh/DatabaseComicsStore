
from MangaAppHelpers_PrettyTable import user_menu, read_query, create_server_connection, prettytable
from MangaAppUserLoginValidation import validate_user_login
from MangaAppAdmin import admin_menu


## Main Function
def main():
    # Prompt User to login until valid credentials are given
    connection = create_server_connection()
    
    if connection.open == True:
        # Validate User Login
        account_type, username = validate_user_login(connection)

        # 1 = user interaction
        if account_type == 1:
            user_menu(connection, username)


        # 2 = admin interaction
        elif account_type == 2:
            admin_menu(connection, username)

        # 3 = Quit
        elif account_type == 3:
            print("Quitting")

        # Closes Connection if Connected
        connection.close()


if __name__ == "__main__":
    main() 
