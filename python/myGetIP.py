import sys, socket

def getHostnameByIP(h):
    try:
        hostname = str(sys.argv[1])
        ip = socket.gethostbyname(hostname)
        print(hostname + ' has an IP of '+ ip)
    except:
        print("Something is wrong with that host.")



getHostnameByIP(sys.argv[1])

hosts = ['www.uc.edu', 'www.google.com', 'www.reddit.com']


for h in hosts:
    getHostnameByIP(h)