var mysql = require('mysql');

var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "toor",
  database: "mydb"
});

con.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
  var sql = "CREATE TABLE IF NOT EXISTS animals (IDanimal INT PRIMARY KEY NOT NULL AUTO_INCREMENT, species VARCHAR(50) NOT NULL, name VARCHAR(50) NOT NULL, gender VARCHAR(6), yearBorn VARCHAR(30), id int, FOREIGN KEY (id) REFERENCES customers(id));";
  con.query(sql, function (err, result) {
    if (err) throw err;
    console.log("Table created");
  });
});
