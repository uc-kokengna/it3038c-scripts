print("Please type 'your name'")

##can set in nameage file in place of myName = input()
myName = input()
while myName != 'AJ':
    if myName == 'your name':
        print('That is a lame joke...')
    else:
        print('What is your real name?')
    myName = input()


## stop here

##print line on same 'while' line ends 'while' loop
print("Hello " + myName + ". Haha.") 

