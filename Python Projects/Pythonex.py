#!/usr/bin/python3

# ~ Exercise:

# ~ 1. Create a function that sends you a goodbye message
# ~ 2. Call the function and see that it works 
# ~ 3. Once you’ve done the above, add in **name, surname(last name) into the argument e.g.   welcomemessage(name, surname)** 
# ~ 4. Try to print out the message: Goodbye ‘Name’ ‘Surname’

def testfunc(name, surname):
	
	print('Goodbye',name, surname)

name = input("Please enter your first name: ")
surname = input("Please enter your last name: ")
testfunc(name, surname)	
