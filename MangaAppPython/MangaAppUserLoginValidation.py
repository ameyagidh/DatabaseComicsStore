from MangaAppHelpers_PrettyTable import read_query


def validate_user_login(connection):
    # Manga App User name and Password
    print("\nManga Explorer Login")
    
    # Loops until valid credentials are given or created or quit
    option = ''
    while option != '1' and option != '2' and option != '3':
        option = input("Enter 1 or 2 or 3:\n    1) Login\n    2) Create An Account\n    3) Quit\n")
        # Login
        if option == '1':

            validity = False
            while validity is False:
                
                print("\nEnter Login Information")
                user_name = input("Enter user name: ").upper()
                user_password = input("Enter password: ")

                # Verify USER account information in database
                q1 = ''' CALL user_login_check('{u}', '{p}');'''.format(u = user_name, p = user_password)
                res = read_query(connection, q1)
                results = {}
                for row in res:
                    results[row['loginId']] = row['loginPassword']

                # Verify ADMIN account information in database
                q2 = ''' CALL admin_login_check('{u}', '{p}');'''.format(u = user_name, p = user_password)
                res_admin = read_query(connection, q2)
                results_admin = {}
                for row in res_admin:
                    results_admin[row['loginId']] = row['loginPassword']

                # Validate User Login
                if user_name in results and results[user_name] == user_password:
                    validity = True
                    print("\nLogin Successful")
                    return 1, user_name

                # Validate Admin Login
                if user_name in results_admin and results_admin[user_name] == user_password:
                    validity = True
                    print("\nAdmin Login Successful")
                    return 2, user_name

                # Invalid Login
                else:
                    print("\nInvalid Credentials or No Account Found")
  

        # Create New Account
        elif option == '2':
            print("\nEnter A New User Name and Password")
            
            # Verify User name has not been used previously
            q3 = ''' Call user_names_list();'''
            result_user = read_query(connection, q3)
            # List of existing user names
            user_login_ids = [*map(lambda d: next(iter(d.values())), result_user)]

            # Asking user for a valid new username
            user_name = user_login_ids[0]
            while user_name in user_login_ids:
                user_name = input("\nEnter User Name: ").upper()
                
                if user_name in user_login_ids:
                    print("User Name Already Exists")
                
            user_password = input("Enter Password: ")
            
            # User Info Data
            first_name = input("Enter First Name: ").title()
            last_name = input("Enter Last Name: ").title()
            email = input("Enter Email Address: ").lower()
            
            # Create new account through procedure call
            q4 = '''CALL create_user('{u}', '{p}', '{f}', '{l}', '{e}');'''.format(u = user_name, p = user_password, f = first_name, l = last_name, e = email)
            read_query(connection, q4)
            print("\nLogged into new account \n Welcome!")
            return 1, user_name
            
            
        # Quit Program
        elif option == '3':
            return 3, 'Quit'
