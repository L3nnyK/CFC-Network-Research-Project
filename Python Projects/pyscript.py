#!/usr/bin/python3

### Introduce yourself

# ~ 1. Create a variable (first_name) that stores your first name as a string
# ~ 2. Create a variable (last_name) that stores your last name as a string
# ~ 3. Print out the a sentence that starts with 'My name is: ', followed by your first name and last name
    # ~ - Hint
        
        # ~ print('My name is: ' + first_name + last_name)
        
    
# ~ ### What is your age?
    
# ~ 4. Create a variable (birth_year) that stores the year of your birth as an integer
# ~ 5. Create a variable (This_year) that stores the year of 2022 as an integer
# ~ 6. Create a variable (age) that calculates your age this year
# ~ 7. Print out your age in a sentence that starts with ‘My age this year is: ‘ by using the str() to typecast your age
    # ~ - Hint
    
# ~ birth_year=1984
# ~ This_year=2022
# ~ age=This_year-birth_year
# ~ print(age)
# ~ print('My age this year is: ', str(age))

# ~ # Get an input from the user the birth year and store it in a variable


# ~ birth_year = input("Please tell me which year you are born in:")
# ~ print(birth_year)
# ~ print(type(birth_year))



# ~ # Create a loop that runs 3 times
# ~ # Get name input from user and store in variable

# ~ for inputvar in range(3):
	# ~ usrname=input("Please give me your name: ")
	# ~ print(usrname)

#Do it in a script
#1. Create an empty list
#2. Create a loop the runs 3 times
#3. Ask the user to enter a names and add it to the list.
#4. print the list AFTER the 3 times i done.

# ~ namelist=[]
# ~ for listcounter in range(3):
	# ~ usrname = input("Please give me a name: ")
	# ~ #namelist.append(usrname)
	# ~ namelist.insert(listcounter,usrname)
# ~ print(namelist)

# How to count the nyumber of items in python Count the number of items from range(67,109)

 #PF.LAB04 LOOPS 1. Create a loop to sum numbers; what is the sum between 1 and 1000?
# ~ number = 0
# ~ for xcount in range (1,1001):
	# ~ number = number + xcount
	
# ~ print(number)

# 2. for i in range(0,1000,17); print(i) and find the last printed value.

# ~ for i in range(0,1000,17):
	# ~ print(i)

#3. a='Josef'; create a loop that uses the ord() function for each character; find the sum of a. 
# ~ a='Josef'
# ~ counter=0
# ~ for each_char in a:
	# ~ counter = counter + ord(each_char)
	
# ~ print(counter)


#4. list=['abcd', '123' , 'xyz', 'john', 70.2]; create a loop to count the number of characters in the list. 

# ~ list=['abcd', '123' , 'xyz', 'john', 70.2]
# ~ sum_of_char=0
# ~ for each_item in list:
	# ~ print(each_item) 
	
# ~ for each_item in list:
	# ~ for each_char in str(each_item):
		# ~ sum_of_char = sum_of_char + 1
		
# ~ print(sum_of_char)	

# ~ #5. Create a loop to sum all the ASCII characters (a-z) decimal values. 
# ~ sum_number=0
# ~ for ii in range(97,123):
		# ~ sum_number = sum_number + ii
		
# ~ print(sum_number)

# 6. lst=[3, 7, 6, 8, 9, 11, 15, 25]; create a loop that appends the square of each number to the new list; print the sum of the new list. 
# ~ lst=[3, 7, 6, 8, 9, 11, 15, 25]
# ~ sqrlst=[]
# ~ sumtotal=0
# ~ for num in lst:
	# ~ sqrlst.append(num * num)
# ~ print(sqrlst)

# ~ for each_value in sqrlst:
	# ~ sumtotal = sumtotal + each_value
	
# ~ print(sumtotal)
	
# 7. lst=["4", "8", "7", "41", "12", "2", "15", "33"]; create a loop that appends the square of each number to the new list; print the sum of the new list. 

# ~ lst=["4", "8", "7", "41", "12", "2", "15", "33"]
# ~ newlst=[]
# ~ for numbers in lst:
	# ~ newlst.append(int(numbers)*int(numbers))
# ~ print(newlst)
# ~ totalval=0
# ~ for values in newlst:
	# ~ totalval = totalval + values
	
# ~ print(totalval)

#8. Create a loop that sums the numbers dividing by seven (7) between 100-10000. 

nlist =[]
nummer = 0
for ii in range(100,10000):
	if (ii%7==0):
		nlist.append(int(ii))
print(nlist)

for zz in nlist:
		nummer = nummer + zz
		
print(nummer)
	
