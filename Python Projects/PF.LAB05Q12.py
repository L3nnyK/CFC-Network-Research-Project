#!/usr/bin/python3

#12. Use the file users.db and find the students average score. 

scores=[]
file=open('users.db','r')
data=file.readlines()
print(data)

sdata=[]
for clean in data:
	sdata.append(clean.strip())

print(sdata)
result=[]
for ii in sdata:
	result.append(int(ii.split('\t')[1]))

print(result)
sum=0
for val in result:
	sum= sum + val
	
print("Total is : " + str(sum))

nummer=len(result)
print("Number of of students :" + str(nummer))

Average=sum/nummer

print("Average is : " + str(Average))

file.close()

