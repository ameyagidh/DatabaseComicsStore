from MangaAppHelpers_PrettyTable import create_server_connection, read_query



def admin_menu(connection, username):
    

    xcheck = False
    while xcheck != True:

        option = ''
        while option != '1' and option != '2' and option!= '3':    
            option = input("\nEnter 1, 2, or 3:\n    1) Add Manga to Database\n    2) Add/Update Seller\n    3) Sign Out\n")

            # Add Manga to Database
            if option == '1':
                username
                title = input("Enter Manga Title: ").title()

                release_year = input("Enter Release Year: ")
                release_month = input("Enter Release Month Number: ")
                release_day = input("Enter Release Day Number: ")
                release_date = "{y}-{m}-{d}".format(y = release_year, m = release_month, d = release_day)
                
                genre_n = input("Enter genre: ").title()
                num_pages = input("Enter number of pages: ")

                publisher_name = input("Enter publisher name: ").title()
                publisher_website =input("Enter publisher website: ")
                author_FN = input("Enter author first name: ").title()
                author_LN = input("Enter author last name: ").title()

                author_birth_year = input("Enter Author Birth Year:" )                
                author_birth_month = input("Enter Author Month: ")
                author_birth_number = input("Enter Author Day Number: ")
                author_DOB = "{y}-{m}-{d}".format(y = author_birth_year, m = author_birth_month, d = author_birth_number)
                
                # Calls add procedure
                q_add = ''' CALL addManga('{u}', '{t}', '{rd}', '{g}', '{np}', '{pn}', '{pw}', '{af}', '{al}', '{ad}');'''.format(
                    u = username, t = title, rd = release_date, g = genre_n, np = num_pages, pn = publisher_name, pw = publisher_website,
                    af = author_FN, al = author_LN, ad = author_DOB)

                read_query(connection, q_add)
                option = ''

            elif option == '2':
                option_s = ''
                while option_s != '1' and option_s != '2' and option_s != '3':
                    option_s = input("\nEnter 1, 2 or 3:\n    1) Add Seller\n    2) Add/Update Seller Pricing\n   3) Return to Main Menu\n")

                    # Add Seller
                    if option_s == '1':
                        s_name = input("Enter seller name: ").title()
                        s_web = input("Enter seller website: ")

                        q_seller = ''' CALL addSeller('{sn}', '{sw}');'''.format(sn = s_name, sw = s_web)
                        read_query(connection, q_seller)
                        option_s = ''

                    # Add/Update Seller Pricing
                    elif option_s == '2':
                        mid = input("Enter mangaId of the manga to edit: ")
                        sid = input("Enter sellerId of the seller: ")
                        price = ''
                        while type(price) != float:
                            try:
                                price = float(input("Enter the price of the manga: "))
                            except:
                                price = ''
                                print("Enter valid price")

                        q_sp = ''' CALL addPrice({m}, {s}, {p});'''.format(m = mid, s = sid, p = price)
                        read_query(connection, q_sp)
                        option = ''

                    elif option_s == '3':
                        option = ''
            elif option == '3':
                print("signing out".title())
                xcheck = True
                break
                    
                
            
