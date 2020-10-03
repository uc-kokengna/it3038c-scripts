import time ## Module to include sleep timer

start_time = time.time()

print("What is your name?")
myName = input()
print("Hello " + myName + ". That is a good name. How old are you?")

## input convert to int, assgined to var myAge
myAge = int(input()) 

##
if myAge < 13:
    print("You're not even a teen yet!")
elif myAge == 13:
    print("You're a teen now....")
elif myAge > 13 and myAge < 30:
    print("You're young and dumb")
elif myAge >= 30 and myAge <65:
    print("You're adulting!")
else:
    print ("...and you're not dead yet?")


## set program age before giving it to the user
programAge = int(time.time() - start_time)

## cast myAge to '%' and assign character to '%' in print.  Does not have to be 's' but keep it same var.
print("%s? That's funny, I'm only %s seconds old." % (myAge, programAge))

### cast myAge to '%' and assign character to '%' in print.  Does not have to be 's'.
print("I wish I was %s years old" % (myAge * 2)) 

time.sleep(2)   ##sleep timer in seconds
print("I'm tired. I'm done. Goodnight.")