
var http = require("http");
var fs = require("fs");
var os = require("os");
var ip = require("ip"); //MODULE FOR IP ADD FUNCITON


var server = http.createServer(function(req, res){
    //linux work around: sudo systemctl stop firewalld.service 
    //text/html is used for firefox
    if (req.url === "/")
    {
        fs.readFile("./public/index.html", "UTF-8", function(err,body){
            res.writeHead(200, {"Content-Type":"text/html"});
            res.end(body);
        })
    }
    else if(req.url.match("/sysinfo")){

        myHostName=os.hostname(); //alternative method, assigning function to object
        totalMem=Math.floor(os.totalmem() / 1000000);
        freeMem=Math.floor(os.freemem() / 1000000);
        cpuCount = os.cpus().length;
        
    //WEBSITE FOR os.uptime(): https://www.geeksforgeeks.org/node-js-os-uptime-method/
        var ut_sec = os.uptime(); 
        var ut_min = ut_sec/60; 
        var ut_hour = ut_min/60; 
        var ut_day = ut_hour/24;

        ut_sec = Math.floor(ut_sec%60); 
        ut_min = Math.floor(ut_min%60); 
        ut_hour = Math.floor(ut_hour%60); 
        ut_day = Math.floor(ut_day%24);
  
        html = `
        <!DOCTYPE html>
            <html>
            <head>
                <title>System Information</title>
            </head>
            <body>
               <p>Hostname: ${myHostName} </p>
               <p>IP: ${ip.address()}</p>
               <p>Server Uptime: Days: ${ut_day}, Hours: ${ut_hour}, Mins: ${ut_min}, Seconds: ${ut_sec}</p>
               <p>Total Memory: ${totalMem} MB</p>
               <p>Free Memory: ${freeMem} MB</p>
               <p>Number of CPUs: ${cpuCount} </p>
            </body>
            </html>
        `
        res.writeHead(200,{"Content-Type": "text/html"});
        res.end(html);
    }
    else {
        res.writeHead(404, {"Content-Type": "text/plain"});
        res.end(`404 File Not Found at ${req.url}`);
    }

});//'.listen(3000)' at end of this line is a substitute for 'server.listen(3000)'


//Node port
server.listen(3000); 

console.log("Server listening on port 3000");


