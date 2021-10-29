/*
    SETUP
*/
// Express
// var express = require('express');   // We are using the express library for the web server
// var app     = express();            // We need to instantiate an express object to interact with the server in our code
// PORT        = 10026;                 // Set a port number at the top so it's easy to change in the future

let http = require('http');
let fs = require('fs');

let handleRequest = (request, response) => {
    response.writeHead(200, {
        'Content-Type': 'text/html'
    });
    fs.readFile('./index.html', null, function (error, data) {
        if (error) {
            response.writeHead(404);
            respone.write('Whoops! File not found!');
        } else {
            response.write(data);
        }
        response.end();
    });
};

http.createServer(handleRequest).listen(8000);

/*
    LISTENER
*/
// app.listen(PORT, function(){            // This is the basic syntax for what is called the 'listener' which receives incoming requests on the specified PORT.
//     console.log('Express started on http://localhost:' + PORT + '; press Ctrl-C to terminate.')
// });