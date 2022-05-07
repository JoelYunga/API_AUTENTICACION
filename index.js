const express = require('express');
const PORT = process.env.PORT || 3000
const app = express();

// middlewares
app.use(function(req, res, next) {
    res.setHeader("Access-Control-Allow-Origin", "*"); 
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');
    res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type');
    res.setHeader('Access-Control-Allow-Credentials', true);
    next();
});
app.use(express.json());
app.use(express.urlencoded({ extended: false }));

// Routes
app.use(require('./src/routes/index'));

app.listen(PORT);
console.log('Server on port', PORT);