// ...UNCOMMENT EVERYTHING BETWEEN START/FINISH FOR DEPLOYING AND RUNNING ON OSU SERVER...
// ----------------------------------------------------START---------------------------------------------------------
// // SETUP...
// // Express
// var express = require('express');   // We are using the express library for the web server
// var app     = express();            // We need to instantiate an express object to interact with the server in our code
// PORT        = 12626;                 // Set a port number at the top so it's easy to change in the future

// // ROUTES...
// app.get('/', function(request, response)
//     {
//         response.writeHead(200, {
//             'Content-Type': 'text/html'
//         });
//         fs.readFile('index.html', null, function (error, data) {
//             if (error) {
//                 response.writeHead(404);
//                 respone.write('Whoops! File not found!');
//             } else {
//                 response.write(data);
//             }
//             response.end();
//         });
//        });

// // LISTENER...
// app.listen(PORT, function(){            // This is the basic syntax for what is called the 'listener' which receives incoming requests on the specified PORT.
//     console.log('Express started on http://localhost:' + PORT + '; press Ctrl-C to terminate.')
// });
// ----------------------------------------------------END---------------------------------------------------------


// ...UNCOMMENT EVERYTHING BETWEEN START/FINISH FOR DEPLOYING AND RUNNING LOCALLY...
// ----------------------------------------------------START---------------------------------------------------------
//cd into root, Run "npm install", and then run "node app.js"...

// Express
const express   = require('express');
const app       = new express();
PORT            = 8000;
PORT            = 12626;


app.get('/', function(request, response){
    response.sendFile('index.html', { root: './pages' });
});

app.get('/index', function(request, response){
    response.sendFile('index.html', { root: './pages' });
});

app.get('/products', function(request, response){
    response.sendFile('products.html', { root: './pages' });
});

app.get('/employees', function(request, response){
    response.sendFile('employees.html', { root: './pages' });
});

app.get('/customers', function(request, response){
    response.sendFile('customers.html', { root: './pages' });
});

app.get('/orders', function(request, response){
    response.sendFile('orders.html', { root: './pages' });
});

app.get('/carts', function(request, response){
    response.sendFile('carts.html', { root: './pages' });
});


app.listen(PORT, function(){            // This is the basic syntax for what is called the 'listener' which receives incoming requests on the specified PORT.
    console.log('Express started on http://localhost:' + PORT + '; press Ctrl-C to terminate.')
});
// Use this in browser - http://localhost:8000/index.html
// ----------------------------------------------------END---------------------------------------------------------