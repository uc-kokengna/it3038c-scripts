
var http = require("http");
var fs = require("fs");
var os = require("os");
var ip = require("ip");


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
        myHostName=os.hostname();
        html = `
        <!DOCTYPE html>
            <html>
            <head>
                <title>System Information</title>
            </head>
            <body>
               <p>Hostname: ${myHostName} </p>
               <p>IP: ${ip.address()}</p>
               <p>Server Uptime: </p>
               <p>Total Memory: MB</p>
               <p>Free Memory: MB</p>
               <p>Number of CPUs: </p>
            </body>
            </html>
        `
        res.writeHead(200,{"Content-Type": "text/html"});
        res.end(html);
    }
    else {
        res.writeHead(404, {"Content-Type:": "text/html"});
        res.end(`404 File Note Found at ${req.url}`);
    }

});//'.listen(3000)' at end of this line is a substitute for 'server.listen(3000)'


//Node port
server.listen(3000); 

console.log("Server listening on port 3000");


