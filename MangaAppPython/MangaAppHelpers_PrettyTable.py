# library import
import pymysql
from prettytable import PrettyTable
 
'''
Creates connection to mysql with the host name, user name, password, database name
returns the connection
'''
def create_server_connection():
    connection = None
    # MySql User name and Password
    print("Account information for mySQL server")
    user_name = input("Enter user name: ")
    user_password = input("Enter password: ")
    try:
        connection = pymysql.connect (
            host = 'localhost',
            user = user_name,
            passwd = user_password,
            database = 'mangaproj',
            cursorclass=pymysql.cursors.DictCursor,
            autocommit=True)
        
    except pymysql.Error as err:
        # Prompts user to verify information and restart program
        print("\n\nConnection Error, Please Verify Login Information and Restart\n\n\n")
    else:
        return connection

'''
Uses query to obtain data from database
returns result of query
'''
def read_query(connection, query):
    cursor = connection.cursor()
    result = None
    try:
        cursor.execute(query)
        result = cursor.fetchall()
        return result
    except pymysql.Error as err:
        print(f"Error: '{err}'")
    # Closes Cursor
    cursor.close()

''' Uses prettytable library to format the output in an organized table manner'''
def prettytable(data):
    res = data
    if len(res) == 0:
        return
    
    elif len(res) != 0:
        x = PrettyTable()
        field = []
        for each in res[0].keys():
            field.append(each.title())

        x.field_names = field
        for i in range(len(res)):
            x.add_row(list(res[i].values()))
        return x

'''
User Account menu logic for the manga app
'''
def user_menu(connection, username):

    xcheck = False
    while xcheck != True:

        option = ''
        while option != '1' and option != '2' and option != '3':    
            option = input("\nEnter 1, 2 or 3:\n    1) View Reading List\n    2) Explore Manga\n    3) Sign Out\n")

            # View Reading List
            if option == '1':
                print("Reading List\n")
                q1 = ''' CALL getReadingList('{u}');'''.format(u = username)
                res = read_query(connection, q1)
                res_table = prettytable(res)
                print(res_table)

                # Obtains all the existing mangaIds in the reading list
                mangaId_list = []
                for i in range(len(res)):
                    temp = res[i]['mangaId']
                    mangaId_list.append(temp)


                # Menu inside reading list
                option2 = ''
                while option2 != '1' and option2 != '2':
                    option2 = input("\nEnter 1 or 2:\n    1) Manage Reading List\n    2) Return to Main Menu\n")
                    
                    # Manage Reading List
                    if option2 == '1':
                        # Menu inside edit reading list
                        option3 = ''
                        while option3 != '1' and option3 != '2' and option3 != '3':
                            option3 = input("\nEnter 1, 2 or 3:\n    1) View a Manga's Information\n    2) Remove Manga from Reading List\n    3) Return to Main Menu\n")
                            if option3 == '1':
                                manga_choice = ''
                                while type(manga_choice) != int:
                                    try:
                                        manga_choice = int(input("Enter manga id of the one you want to view: "))
                                    except:
                                        print("Enter a positive number without decimals")

                                if manga_choice in mangaId_list:
                                    q3= '''CALL viewMangaInfo({k});'''.format(k = manga_choice)
                                    view_call = read_query(connection, q3)
                                    res_table = prettytable(view_call)
                                    print(res_table)

                                    option4 = ''
                                    while option4 != '1' and option4 != '2' and option4 != '3' and option4 != '4' and option4 != '5':
                                        option4 = input("\nEnter 1, 2, 3, 4, or 5:\n    1) Rate & Review Manga\n    2) Edit Reading Status\n    3) Edit Favorite Status\n    4) View Reviews\n   5) Return to Main Menu\n")

                                        if option4 == '1':
                                            rating = 9.99
                                            while rating < 0 or rating > 5:
                                                try:
                                                    rating = float(input("Enter a rating value between 0 and 5: "))
                                                except:
                                                    rating = 9.99
                                                    print("Enter an integer or decimal value between 0 and 5")
                                                review_text = input("Enter review text: ")

                                            
                                            q4= '''CALL updateRatingReview ('{u}', {m}, {ra}, '{re}');'''.format(u = username, m = manga_choice, ra = rating, re = review_text)
                                            read_query(connection, q4)
                                            print("Updated, Returning To Main Menu")
                                            option = ''

                                        # Edit Reading Status
                                        elif option4 == '2':
                                            option_readStatus = ''
                                            while option_readStatus != '1' and option_readStatus != '2' and option_readStatus != '3':
                                                print("Choose new reading status".title())
                                                option_readStatus = input("\nEnter 1, 2, or 3:\n    1) Completed\n    2) Ongoing\n    3)Not-Started\n")

                                                if option_readStatus == '1':
                                                    q_status = ''' CALL changeReadingStatus('{u}', {m}, 'completed');'''.format(u = username, m = manga_choice)
                                                    read_query(connection, q_status);

                                                elif option_readStatus == '2':
                                                    q_status = ''' CALL changeReadingStatus('{u}', {m}, 'ongoing');'''.format(u = username, m = manga_choice)
                                                    read_query(connection, q_status);
                                                    
                                                elif option_readStatus == '3':
                                                    q_status = ''' CALL changeReadingStatus('{u}', {m}, 'not-started');'''.format(u = username, m = manga_choice)
                                                    read_query(connection, q_status);                       

                                            print("Updated, Returning To Main Menu")
                                            option = ''
                                            
                                        # Edit Favorite Status
                                        elif option4 == '3':
                                            option_favoriteStatus = ''
                                            while option_favoriteStatus != '1' and option_favoriteStatus != '2':
                                                print("Choose new favorite status".title())
                                                option_favoriteStatus = input("\nEnter 1 or 2:\n    1) Favorite\n    2) Unfavorite\n")

                                                if option_favoriteStatus == '1':
                                                    q_fav_status = ''' CALL changeFavoriteStatus('{u}', {m}, 1);'''.format(u = username, m = manga_choice)
                                                    read_query(connection, q_fav_status);

                                                elif option_favoriteStatus == '2':
                                                    q_fav_status = ''' CALL changeFavoriteStatus('{u}', {m}, 0);'''.format(u = username, m = manga_choice)
                                                    read_query(connection, q_fav_status);

                                            print("Updated, Returning To Main Menu")
                                            option = ''

                                        # Displays all available reviews for this manga
                                        elif option4 == '4':
                                            q_reviews = ''' CALL getReviews({m})'''.format(m = manga_choice)
                                            reviews = read_query(connection, q_reviews)
                                            res_table = prettytable(reviews)
                                            print(res_table)
                                            
                                            if len(reviews) == 0:
                                                print("no reviews found for this manga".title())
                                            option = ''

                                        # Return to Main Menu
                                        elif option4 == '5':
                                            option = ''


                                else:
                                    print("That mangaId was not found in your list")
                                    option3 = ''
                                
                                                                    

                            # Removing manga from reading list
                            elif option3 == '2':
                                print("Remove Manga from Reading List")
                                manga_choice = ''
                                while type(manga_choice) != int:
                                    try:
                                        manga_choice = int(input("Enter manga id of the one you want to remove: "))
                                    except:
                                        print("Enter a positive number without decimals")
                                

                                if manga_choice in mangaId_list:
                                    q2 = '''CALL removefromreadinglist({k},'{u}');'''.format(k = manga_choice, u = username)
                                    remove_call = read_query(connection, q2)
                                    
                                    print("Updated, Returning To Main Menu")
                                    option = ''
                                    
                                else:
                                    print("That mangaId was not found in your list")
                                    option3 = ''
                                    

                            # Return to Main Menu
                            elif option3 == '3':
                                option = ''
                                                                

                    # Return to Main Menu
                    elif option2 == '2':
                        option = ''
                                        

            # Explore Manga
            elif option == '2':
                print("Explore Manga")

                option20 = ''
                while option20 != '1' and option20 != '2' and option20 != '3':
                    option20 = input("\nEnter 1, 2 or 3:\n    1) View Top 10 Rated Manga\n    2) Search\n    3) Return to Main Menu\n")

                    # View top 10 rated manga
                    if option20 == '1':
                        print("Top 10 Rated Manga by Average Rating")

                        # Query reading list to keep track of mangaIds
                        q_ex = ''' CALL getReadingList('{u}');'''.format(u = username)
                        res_ex = read_query(connection, q_ex)

                        # Obtains all the existing mangaIds in the reading list
                        mangaId_list_ex = []
                        for i in range(len(res_ex)):
                            temp = res_ex[i]['mangaId']
                            mangaId_list_ex.append(temp)      

                        # Displays top 10
                        q1 = '''  CALL top_10_by_average_rating();'''
                        res = read_query(connection, q1)
                        res_table = prettytable(res)
                        print(res_table)

                        # Obtains all the mangaIds in the top 10
                        top_10_Ids = []
                        for i in range(len(res)):
                            temp = res[i]['mangaId']
                            top_10_Ids.append(temp)

                        top_10_option = ''
                        while top_10_option != '1' and top_10_option != '2':
                            top_10_option = input("\nEnter 1 or 2:\n    1) View a Manga's Information\n    2) Return to Main Menu\n")

                            manga_choice = ''
                            if top_10_option == '1':
                                while type(manga_choice) != int:
                                    try:
                                        manga_choice = int(input("Enter manga id of the one you want to view: "))
                                    except:
                                        print("Enter a positive number without decimals")
                                

                                if manga_choice in top_10_Ids:
                                    q_10 = ''' CALL viewMangaInfo({k});'''.format(k = manga_choice)
                                    view_call_10 = read_query(connection, q_10)
                                    res_table = prettytable(view_call_10)
                                    print(res_table)

                                    option_in_10_specifc = ''
                                    while option_in_10_specifc != '1' and option_in_10_specifc != '2' and option_in_10_specifc != '3':
                                        option_in_10_specifc = input("\nEnter 1, 2, or 3:\n    1) Add Manga to Reading List\n    2) View Reviews\n    3) Return to Main Menu\n")

                                        if option_in_10_specifc == '1':
                                            # If manga not already in reading list
                                            if manga_choice not in mangaId_list_ex:
                                                q_add_RL = ''' CALL addToReadingList('{u}', {m});'''.format(u = username, m = manga_choice)
                                                read_query(connection, q_add_RL)
                                                print("Added to Reading List, Returning to Main Menu")
                                                option = ''
                                            elif manga_choice in mangaId_list_ex:
                                                print("Already in your Reading List")
                                                top_10_option = ''

                                        # View Reviews
                                        elif option_in_10_specifc == '2':
                                            q_reviews = ''' CALL getReviews({m})'''.format(m = manga_choice)
                                            reviews = read_query(connection, q_reviews)
                                            res_table = prettytable(reviews)
                                            print(res_table)    
                                            option_in_10_specific =''
                                            
                                            if len(reviews) == 0:
                                                print("no reviews found for this manga".title())                                            
                                            option_in_10_specifc = ''
                                            
                                            
                                        # Return to Main Menu
                                        elif option_in_10_specifc == '3':
                                            option = ''
                                            
                                elif manga_choice not in top_10_Ids:
                                    print("That mangaId is not in the top 10")
                                    top_10_option = ''


                            # Return to Main Menu    
                            elif top_10_option == '2':
                                option = ''
                        
                                                
                    # Search
                    elif option20 == '2':

                        # Search Menu
                        option30 = ''
                        while option30 != '1' and option30 != '2' and option30 != '3' and option30 != '4' and option30 != '5':
                            print("\nSearch By:")
                            option30 = input("\nEnter 1, 2, 3, 4, or 5:\n    1) Genre\n    2) Author Last Name\n    3) Publisher\n    4) MangaId\n    5) Return to Main Menu\n")

                            # Genre Selection Menu
                            if option30 == '1':
                                print("\nChoose a Genre")
                                option30x = ''
                                while option30x != '1' and option30x != '2' and option30x != '3' and option30x != '4' and option30x != '5' and option30x != '6' and option30x != '7':
                                    option30x = input("\nEnter the number corresponding to your choice:\n    1) Action\n    2) Adventure\n    3) Fantasy\n    4) Drama\n    5) Comedy\n    6) Romance\n    7) Return to Previous Menu\n")

                                    genre = ''
                                    # Action Manga
                                    if option30x == '1':
                                        genre = 'Action'

                                    # Adventure Manga
                                    elif option30x == '2':
                                        genre = 'Adventure'
                                        
                                    # Fantasy Manga
                                    elif option30x == '3':
                                        genre = 'Fantasy'

                                    # Drama Manga
                                    elif option30x == '4':
                                        genre = 'Drama'
                                        
                                    # Comedy Manga
                                    elif option30x == '5':
                                        genre = 'Comedy'

                                    # Romance Manga
                                    elif option30x == '6':
                                        genre = 'Romance'

                                    elif option30x == '7':
                                        option30 = ''
                                        
                                    # Queries manga with the selected genre
                                    if genre != '':
                                        q1 = '''CALL manga_by_genre('{genre_selected}');'''.format(genre_selected = genre)
                                        res_q = read_query(connection, q1)
                                        res_table = prettytable(res_q)
                                        print(res_table)                                        
                                        
                                        # Obtains all the mangaIds for selected genre
                                        temp_Ids = []
                                        for i in range(len(res_q)):
                                            temp = res_q[i]['mangaId']
                                            temp_Ids.append(temp)

                                        op = ''
                                        while op != '1' and op != '2':
                                            op = input("\nEnter 1 or 2:\n    1) View a Manga's Information\n    2) Return to Search Menu\n")

                                            if op == '1':
                                                manga_choice = ''
                                                while type(manga_choice) != int:
                                                    try:
                                                        manga_choice = int(input("Enter manga id of the one you want to view: "))
                                                    except:
                                                        print("Enter a positive number without decimals")

                                                if manga_choice in temp_Ids:
                                                    q_ex_view= '''CALL viewMangaInfo({k});'''.format(k = manga_choice)
                                                    view_call_ex = read_query(connection, q_ex_view)
                                                    res_table = prettytable(view_call_ex)
                                                    print(res_table)

                                                    optioncat = ''
                                                    while optioncat != '1' and optioncat != '2' and optioncat != '3':
                                                        optioncat = input("\nEnter 1, 2, or 3:\n    1) Add Manga to Reading List\n    2) View Reviews\n    3) Return to Search Menu\n")

                                                        if optioncat == '1':
                                                            # Query reading list to keep track of mangaIds
                                                            q_ex = ''' CALL getReadingList('{u}');'''.format(u = username)
                                                            res_ex = read_query(connection, q_ex)

                                                            # Obtains all the existing mangaIds in the reading list
                                                            mangaId_list_ex = []
                                                            for i in range(len(res_ex)):
                                                                temp = res_ex[i]['mangaId']
                                                                mangaId_list_ex.append(temp)
                                                                
                                                            # If manga not already in reading list
                                                            if manga_choice not in mangaId_list_ex:
                                                                q_add_RL = ''' CALL addToReadingList('{u}', {m});'''.format(u = username, m = manga_choice)
                                                                read_query(connection, q_add_RL)
                                                                print("Added to Reading List, Returning to Search Menu")
                                                                option30 = ''
                                                            elif manga_choice in mangaId_list_ex:
                                                                print("Already in your Reading List")
                                                                option30 = ''

                                                        # View Reviews
                                                        elif optioncat == '2':
                                                            q_reviews = ''' CALL getReviews({m})'''.format(m = manga_choice)
                                                            reviews = read_query(connection, q_reviews)
                                                            res_table = prettytable(reviews)
                                                            print(res_table)    
                                                                
                                                            if len(reviews) == 0:
                                                                print("no reviews found for this manga".title())
                                                            optioncat =''
                                                            
                                                        # Return to Search Menu
                                                        elif optioncat == '3':
                                                            option30 =''
                                                        
                                                elif manga_choice not in temp_Ids:
                                                    print("That mangaId does not match a manga with this genre")
                                                    option30 =''                                                                         

                                            elif op == '2':
                                                option30 = ''



                            # Search By Author Last Name
                            elif option30 == '2':
                                author_last_name = input("Enter author last name: ")

                                q1 = ''' CALL manga_by_author('{a}');'''.format(a = author_last_name)
                                res_q = read_query(connection, q1)
                                if len(res_q) != 0:
                                    res_table = prettytable(res_q)
                                    print(res_table)
                                        
                                    # Obtains all the mangaIds for selected author
                                    temp_Ids = []
                                    for i in range(len(res_q)):
                                        temp = res_q[i]['mangaId']
                                        temp_Ids.append(temp)

                                    op = ''
                                    while op != '1' and op != '2':
                                        op = input("\nEnter 1 or 2:\n    1) View a Manga's Information\n    2) Return to Search Menu\n")

                                        if op == '1':
                                            manga_choice = ''
                                            while type(manga_choice) != int:
                                                try:
                                                    manga_choice = int(input("Enter manga id of the one you want to view: "))
                                                except:
                                                    print("Enter a positive number without decimals")

                                            if manga_choice in temp_Ids:
                                                q_ex_view= '''CALL viewMangaInfo({k});'''.format(k = manga_choice)
                                                view_call_ex = read_query(connection, q_ex_view)
                                                res_table = prettytable(view_call_ex)
                                                print(res_table)

                                                optioncat = ''
                                                while optioncat != '1' and optioncat != '2' and optioncat != '3':
                                                    optioncat = input("\nEnter 1, 2, or 3:\n    1) Add Manga to Reading List\n    2) View Reviews\n    3) Return to Search Menu\n")

                                                    if optioncat == '1':
                                                        
                                                        # Query reading list to keep track of mangaIds
                                                        q_ex = ''' CALL getReadingList('{u}');'''.format(u = username)
                                                        res_ex = read_query(connection, q_ex)

                                                        # Obtains all the existing mangaIds in the reading list
                                                        mangaId_list_ex = []
                                                        for i in range(len(res_ex)):
                                                            temp = res_ex[i]['mangaId']
                                                            mangaId_list_ex.append(temp)
                                                            
                                                        # If manga not already in reading list
                                                        if manga_choice not in mangaId_list_ex:
                                                            q_add_RL = ''' CALL addToReadingList('{u}', {m});'''.format(u = username, m = manga_choice)
                                                            read_query(connection, q_add_RL)
                                                            print("Added to Reading List, Returning to Search Menu")
                                                            option30 = ''
                                                        elif manga_choice in mangaId_list_ex:
                                                            print("Already in your Reading List")
                                                            option30 = ''

                                                    # View Reviews
                                                    elif optioncat == '2':
                                                        q_reviews = ''' CALL getReviews({m})'''.format(m = manga_choice)
                                                        reviews = read_query(connection, q_reviews)
                                                        res_table = prettytable(reviews)
                                                        print(res_table)
                                                        
                                                        if len(reviews) == 0:
                                                            print("no reviews found for this manga".title())
                                                        optioncat =''                                                
                                                        
                                                    # Return to Search Menu
                                                    elif optioncat == '3':
                                                        option30 = ''
                                                        
                                            elif manga_choice not in temp_Ids:
                                                print("The mangaId does not match a manga with this author")
                                                option30 =''

                                        # Return to search menu
                                        elif op == '2':
                                            option30 = ''
                                            
                                elif len(res_q) == 0:
                                    print("No manga found by this author")
                                    option30 = ''
                                
                                
                            # Search By Publisher Name
                            elif option30 == '3':
                                publisher_name = input("Enter publisher name: ")
                                
                                q1 = ''' CALL manga_by_publisher('{p}');'''.format(p = publisher_name)
                                res_q = read_query(connection, q1)
                                if len(res_q) != 0:
                                    res_table = prettytable(res_q)
                                    print(res_table)

                                    # Obtains all the mangaIds for selected publisher
                                    temp_Ids = []
                                    for i in range(len(res_q)):
                                        temp = res_q[i]['mangaId']
                                        temp_Ids.append(temp)
                                        

                                    op = ''
                                    while op != '1' and op != '2':
                                        op = input("\nEnter 1 or 2:\n    1) View a Manga's Information\n    2) Return to Search Menu\n")

                                        if op == '1':
                                            manga_choice = ''
                                            while type(manga_choice) != int:
                                                try:
                                                    manga_choice = int(input("Enter manga id of the one you want to view: "))
                                                except:
                                                    print("Enter a positive number without decimals")

                                            if manga_choice in temp_Ids:
                                                q_ex_view= '''CALL viewMangaInfo({k});'''.format(k = manga_choice)
                                                view_call_ex = read_query(connection, q_ex_view)
                                                res_table = prettytable(view_call_ex)
                                                print(res_table)

                                                optioncat = ''
                                                while optioncat != '1' and optioncat != '2' and optioncat != '3':
                                                    optioncat = input("\nEnter 1, 2, or 3:\n    1) Add Manga to Reading List\n    2) View Reviews\n    3) Return to Search Menu\n")

                                                    if optioncat == '1':
                                                        # Query reading list to keep track of mangaIds
                                                        q_ex = ''' CALL getReadingList('{u}');'''.format(u = username)
                                                        res_ex = read_query(connection, q_ex)

                                                        # Obtains all the existing mangaIds in the reading list
                                                        mangaId_list_ex = []
                                                        for i in range(len(res_ex)):
                                                            temp = res_ex[i]['mangaId']
                                                            mangaId_list_ex.append(temp)
                                                            
                                                        # If manga not already in reading list
                                                        if manga_choice not in mangaId_list_ex:
                                                            q_add_RL = ''' CALL addToReadingList('{u}', {m});'''.format(u = username, m = manga_choice)
                                                            read_query(connection, q_add_RL)
                                                            print("Added to Reading List, Returning to Search Menu")
                                                            option30 = ''
                                                        elif manga_choice in mangaId_list_ex:
                                                            print("Already in your Reading List")
                                                            option30 = ''

                                                    # View Reviews
                                                    elif optioncat == '2':
                                                        q_reviews = ''' CALL getReviews({m})'''.format(m = manga_choice)
                                                        reviews = read_query(connection, q_reviews)
                                                        res_table = prettytable(reviews)
                                                        print(res_table)
                                            
                                                        if len(reviews) == 0:
                                                            print("no reviews found for this manga".title())                                                                
                                                        optioncat =''                                                
                                                        
                                                    # Return to Search Menu
                                                    elif optioncat == '3':
                                                        option30 =''
                                                        
                                            elif manga_choice not in temp_Ids:
                                                print("The mangaId does not match a manga with this publisher")
                                                option30 =''                                    

                                        # Return to search menu
                                        elif op == '2':
                                            option30 = ''

                                elif len(res_q) == 0:
                                    print("No manga found with this publisher")
                                    option30 = ''                                    

                            # Search by MangaId
                            elif option30 == '4':
                                manga_choice = input("Enter MangaId: ")
                                q1 = ''' CALL manga_by_mangaId('{m}');'''.format(m = manga_choice)
                                res_q = read_query(connection, q1)
                                if len(res_q) != 0:
                                    q_ex_view= '''CALL viewMangaInfo({k});'''.format(k = manga_choice)
                                    view_call_ex = read_query(connection, q_ex_view)
                                    res_table = prettytable(view_call_ex)
                                    print(res_table)
                                    
                                    optioncat = ''
                                    while optioncat != '1' and optioncat != '2' and optioncat != '3':
                                        optioncat = input("\nEnter 1, 2, or 3:\n    1) Add Manga to Reading List\n    2) View Reviews\n    3) Return to Search Menu\n")

                                        if optioncat == '1':
                                            # Query reading list to keep track of mangaIds
                                            q_ex = ''' CALL getReadingList('{u}');'''.format(u = username)
                                            res_ex = read_query(connection, q_ex)

                                            # Obtains all the existing mangaIds in the reading list
                                            mangaId_list_ex = []
                                            for i in range(len(res_ex)):
                                                temp = res_ex[i]['mangaId']
                                                mangaId_list_ex.append(temp)
                                                
                                            # If manga not already in reading list
                                            if manga_choice not in mangaId_list_ex:
                                                q_add_RL = ''' CALL addToReadingList('{u}', {m});'''.format(u = username, m = manga_choice)
                                                read_query(connection, q_add_RL)
                                                print("Added to Reading List, Returning to Search Menu")
                                                option30 = ''
                                            elif manga_choice in mangaId_list_ex:
                                                print("Already in your Reading List")
                                                option30 = ''

                                        # View Reviews
                                        elif optioncat == '2':
                                            q_reviews = ''' CALL getReviews({m})'''.format(m = manga_choice)
                                            reviews = read_query(connection, q_reviews)
                                            res_table = prettytable(reviews)
                                            print(res_table)
                                            
                                            if len(reviews) == 0:
                                                print("no reviews found for this manga".title())
                                            optioncat =''                                                
                                            
                                        # Return to Search Menu
                                        elif optioncat == '3':
                                            option30 =''
                                                        
                                else:
                                    print("The mangaId does not match a manga")
                                    option30 =''                                    


                    # Return to Main Menu
                    elif option20 == '3':
                        option = ''
 
            # Sign Out
            elif option == '3':
                print ("Signing Out")
                xcheck = True
                break

