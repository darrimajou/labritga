var Base = require('basejs');
var mysql = require('./mysql');
var deferred = require('deferred');

/**
 * Class News
 * Define a News and call database requests
 * @author kdarri
 */
var News = Base.extend({

    /**
     * Constructor
     */
    constructor: function () {},
  	
    /**
     * Get all News
     */
    getAll: function () {
      	console.log('getAll()');
        var def = deferred();
      	mysql.get("SELECT * FROM News").done(function(allActus) {
            def.resolve(allActus);
        });
      	return def.promise();
	},

    /**
     * Insert a news in database
     * @param news object to insert in database
     */
    create: function (news) {
        var def = deferred();
        mysql.insert("INSERT INTO News VALUES ?", news).done(function(message) {
            def.resolve(message);
        }).fail(function(err) {
            def.resolve(err);
        });
        return def.promise();
    }

});

module.exports = new News();