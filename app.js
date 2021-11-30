// ----------------------------------------------------START---------------------------------------------------------
//cd into root, Run "npm install", and then run "node app.js"...

// Express
const express   = require('express');
const app       = new express();
var mysql = require('mysql')
PORT            = 12626;

var db = require('./db-connector')

// OSU SERVERS
app.get('/', function(request, response){
    response.sendFile('index.html', { root: './pages' });

    // query1 = 'SELECT * FROM products;'
    // // SELECT *...
    // db.pool.query(query1, function(err, results, fields){
    //     // Send the results to the browser
    //     let base = "<h1>MySQL Results:</h1>"
    //     res.send(base + JSON.stringify(results));
    // });
});
app.get('/index', function(request, response){
    response.sendFile('index.html', { root: './pages' });
});
app.get('/index.html', function(request, response){
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

// Use this in browser - http://flip1.engr.oregonstate.edu:12626/
// Use this in browser - http://localhost:12626/
// ----------------------------------------------------END---------------------------------------------------------