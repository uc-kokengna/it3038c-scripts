/*/ Looking up Hostname and returning IP address script/**/ 

var dns = require(`dns`);

function hostnameLookup(hostname)
{
    dns.lookup(hostname, function(err, addresses, family) /*/ Call back function; always takes an err/**/ 
    {
        console.log(addresses);
    })
}


if (process.argv.length <= 2) /*/if PROCESS ARRAY LENGTH IS LESS THAN OR EQUAL TO 2/**/ 
{
    console.log("USAGE: " + __filename + " hostname.com") /*/ OUTPUT /**/ 
    process.exit(-1) /*/ -1 means it did not succeed /**/   
}

var hostname = process.argv[2] /*/ /**/ 
console.log(`Checking IP of : ${hostname}`);
hostnameLookup(hostname); /*/ Call hostname from function 'hostnameLookup'/**/ 