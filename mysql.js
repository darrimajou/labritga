var mysql = require('mysql');
var Base = require('basejs');
var deferred = require('deferred');

var connection;

/**
 * Class MySql 
 * @author kdarri
 */
var MySql = Base.extend({

    /**
     * Constructor
     */
    constructor: function() {
        connection = mysql.createConnection({
            host : 'localhost',
            port : 3306,
            database: 'labritga',
            user : 'kdarri',
            password : 'kdarri'
        });
    },

    /**
     * Get elements in database
     * @param request must be a SELECT
     */
    get: function(request) {
        var df = deferred();
        // Executing request
        connection.query(request, function(err, rows){
            if(err != null) {
                console.log('error executing query:' + err);
                df.resolve(err);
            } else {
                df.resolve(rows);
            }
        });
        return df.promise();
    }, 

    /**
     * Insert an object post in database 
     * @param request must be 'INSERT INTO myTable Values ?'
     * @param post the objet to put in database
     */
    insert: function(request, post) {
        var df = deferred();
        // Executing request
        connection.query(request, post, function(err, rows){
            if(err != null) {
                console.log('error executing query:' + err);
                df.resolve(err);
            } else {
                df.resolve(rows);
            }
        });
        return df.promise();
    }

});

module.exports = new MySql();