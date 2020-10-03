process.stdout.write("Hello, what is your name? ");

process.stdin.on('data', function(data)/*/On the event of data coming in /**/ 
{
console.log("Hello " + data.toString());/*/ convert input data into string and print/**/ 
process.exit();
});


process.on('exit', function(){ /*/ On the event of exiting the function/**/ 
    console.log("Thanks for the info!"); /*/ output string/**/ 
})