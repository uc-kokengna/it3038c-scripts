/*/ /**/ 

/*/ Semi colons are implied but option, use it for best practice/**/ 

var path = require("path"); /*/ Needed to grab path of filename /**/ 

var hello = "Hello from Node JS Variable!"
console.log(`Printing variable hello: ${hello}`);

console.log("directory name: " + __dirname);
console.log("directory and file name: " + __filename); /*/ grabs entire path plus file name /**/ 


/*/ Code to grab filename by itself/**/ 
console.log("Using PATH module: ");
console.log(`Hellow from file ${path.basename(__filename)}`);

/*/ .argv = an array/**/ 
console.log(`Process args: ${process.argv}`); /*/ Outputs an array with 2 value/**/ 
