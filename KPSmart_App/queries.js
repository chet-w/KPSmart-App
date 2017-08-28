var signedInUser = '';
var manager = false;
var database = process.env.DATABASE_URL || "postgres://localhost:5432/cameronmclachlan";


//---Database connection---
var pg = require('pg');
//var database = process.env.DATABASE_URL || "postgres://localhost:5432/rongjiwang";
var client = new pg.Client(database);
client.connect();

exports.getSignedInUser = function(){
   return signedInUser;
}

exports.getDatabse = function(){
    return database;
}

exports.isManager = function(){
    return manager;
}


exports.login = function(username, password, callback){
    console.log('??');

    pg.connect(database, function (err, client, done) {

        if (err) {
            console.error('Could not connect to the database.');
            console.error(err);
            callback(err);
            return;
        }

        var query = "SELECT * FROM users WHERE Username = '" + username + "' AND Password='" + password + "';"
        client.query(query, function (error, result) {
            done();
            if (error) {
                console.error('Failed to execute query.');
                console.error(error);
                callback(err);
                return;
            }

            if (result.rows[0] == null){
                callback('error');
                return
            }
            signedInUser = result.rows[0].username;
            manager = result.rows[0].manager;
            console.log(signedInUser);
            callback(null, result.rows[0]);
        });
    });
}

exports.getMailDeliveries = function(callback){
    pg.connect(database, function (err, client, done) {
        if (err) {
            console.error('Could not connect to the database.');
            console.error(err);
            callback(err);
            return;
        }

        var query = "SELECT m.id, r.origin, r.destination, m.weight, m.volume, m.send_date, " +
                    "CASE WHEN current_date < m.arrive_date THEN 'In Transit' ELSE 'Delivered' END " +
                    "FROM mail m JOIN route r ON m.route_id = r.id GROUP BY r.origin, r.destination, m.id ORDER BY m.id;";

        client.query(query, function(error, result){
            done();
            if(error){
                console.error('Failed to add mail.');
                console.error(error);
                callback(err);
                return;
            }
            callback(null, result.rows);
        });
    });

}

exports.getAllRoutes = function(callback){
    pg.connect(database, function (err, client, done) {
        if (err) {
            console.error('Could not connect to the database.');
            console.error(err);
            callback(err);
            return;
        }

        var query = "SELECT * FROM ROUTE;";
        client.query(query, function (error, result) {
            done();
            if (error) {
                console.error('Failed to execute query.');
                console.error(error);
                callback(error)
                return;
            }
            callback(null, result.rows);
        });
    });
}

exports.getRevenueAndExpenditure = function(callback){
    pg.connect(database, function (err, client, done) {
        if (err) {
            console.error('Could not connect to the database.');
            console.error(err);
            callback(err);
            return;
        }

        var query1 =
            "CREATE VIEW revenueAndExpenditure AS ( " +
            "SELECT r.id AS RouteID, r.origin AS Origin ,r.destination AS Destination, " +
            "m.weight AS Weight, m.volume AS Volume, r.deliveryType AS DeliveryType, " +
            "r.cost_per_kg_customer, r.cost_per_volume_customer, " +
            "r.cost_per_kg_business, r.cost_per_volume_business, " +
            "m.weight * r.cost_per_kg_customer + m.volume * r.cost_per_volume_customer AS revenue, " +
            "m.weight * r.cost_per_kg_business + m.volume * r.cost_per_volume_business AS expenditure " +
            "FROM mail m JOIN route r " +
            "ON m.route_id = r.id); " +
            "CREATE VIEW TotalsPerRoute AS (select RouteID, Origin, Destination, DeliveryType, SUM (weight * cost_per_kg_customer + volume * cost_per_volume_customer) as total_revenue, " +
            "SUM (weight * cost_per_kg_business + volume * cost_per_volume_business) as total_expenditure from revenueAndExpenditure GROUP BY RouteID, Origin, Destination, DeliveryType ORDER BY RouteID); " +
            "CREATE VIEW BusinessMonitoring AS (SELECT * FROM TotalsPerRoute); " +
            "SELECT * FROM BusinessMonitoring;";

        var query2 = "DROP VIEW revenueAndExpenditure CASCADE;";
        var r = null;
        client.query(query1, function (error, result) {
            done();
            if (error) {
                console.error('Failed to execute query query1');
                console.error(error);
                callback(error)
                return;
            }
            r = result;
        });
        client.query(query2, function (error, result) {
            done();
            if (error) {
                console.error('Failed to execute query query2');
                console.error(error);
                callback(error)
                return;
            }
            callback(null, r.rows);

        });
    });
}

exports.getAverageDays = function(callback){
    pg.connect(database, function (err, client, done) {
        if (err) {
            console.error('Could not connect to the database.');
            console.error(err);
            callback(err);
            return;
        }

        var query = "SELECT r.id, r.origin, r.destination,r.deliveryType AS DeliveryType, " +
                    "ROUND(Avg(m.arrive_date - m.send_date),0) AS averageDays " +
                    "FROM mail m JOIN route r ON m.route_id = r.id GROUP BY r.id ORDER BY r.id;";
        client.query(query, function (error, result) {
            done();
            if (error) {
                console.error('Failed to execute query.');
                console.error(error);
                callback(error)
                return;
            }
            callback(null, result.rows);
        });
    });
}


exports.getDate = function(){
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth()+1; //January is 0!

    var yyyy = today.getFullYear();
    if(dd<10){
        dd='0'+dd;
    }
    if(mm<10){
        mm='0'+mm;
    }
    var today = dd+'/'+mm+'/'+yyyy;
    return today;
}

exports.formatDate = function(date){
    var dd = date.getDate();
    var mm = date.getMonth()+1; //January is 0!

    var yyyy = date.getFullYear();
    if(dd<10){
        dd='0'+dd;
    }
    if(mm<10){
        mm='0'+mm;
    }
    var formattedDate = dd+'/'+mm+'/'+yyyy;
    return formattedDate;
}