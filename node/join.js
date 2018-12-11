var mysql = require('mysql');

var con = mysql.createConnection({
	host: "localhost",
	user: "root",
	password: "toor",
	database: "VetOffice"
});

con.connect(function(err) {
	if (err) throw err;

	var sql = "SELECT customer.fname AS 'First Name', customer.lname AS 'Last Name', customer.state AS 'State', animal.name AS 'Pet Name', animal.species, animal.yearBorn, animal.gender from customer inner join animal on customer.IDcustomer = animal.IDcustomer WHERE customer.state like 'id' and animal.gender like 'f' and animal.species like 'cat' or animal.species like 'dog' and gender like 'f' and state like 'id' order by species;"

	con.query(sql, function(err, result, fields) {
		if (err) throw err;
		console.log(result);
	});

});
