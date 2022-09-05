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
    
birth_year=1984
This_year=2022
age=This_year-birth_year
print(age)
print('My age this year is: ', str(age))

# Get an input from the user the birth year and store it in a variable

birth_year = input("Please tell me which year you are born in:")

print(birth_year)
print(type(birth_year))
