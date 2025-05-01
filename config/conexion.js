const mysql = require('mysql2');

const db = mysql.createConnection({
  host: 'localhost',  
  user: 'lennuser',       
  password: 'batman',       
  database: 'tasvet' 
});

db.connect(err => {
  if (err) {
  
    return;
  }
});

module.exports = db;
