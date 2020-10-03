import socket

## create an array
hosts = ['www.uc.edu', 'www.google.com', 'www.reddit.com']

print('Working from Host: ' + socket.getfqdn()) ##print local host machine
for h in hosts:
     print(h + ":" + socket.gethostbyname(h)) ##obtains public IP addresses of array list