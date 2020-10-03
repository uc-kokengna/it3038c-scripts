

from datetime import datetime

brithDay= input ('Please enter your birth date (mm/dd/yyyy): ')

##year = int(input('age: '))


date1 = datetime.strptime(brithDay,'%m/%d/%Y')
date2 = datetime.today()

def dateInSeconds(dt2, dt1):
##need to carry over input age, divide it by by timedelta output and subtract new number from initial timedelta output

  timedelta = dt2 - dt1 
  ##3600 seconds (1hr), 24hrs per day, 
   ##return timedelta.days days between input and current
  return timedelta.days * 3600 * 24 + timedelta.seconds 
print("You have been alive for \n%d seconds!" %(dateInSeconds(date2, date1)))
