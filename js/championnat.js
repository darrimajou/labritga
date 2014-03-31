var Base = require('basejs');
var mysql = require('./mysql');
var deferred = require('deferred');

/**
 * Class Championnat
 * Define a Championnat and call database requests
 * @author kdarri
 */
var Championnat = Base.extend({

    /**
     * Constructor
     */
    constructor: function () {},
  	
    /**
     * Get the ranking of the championnat
     * @param championnat the championnat to get ranking (1 Labrit 1, 2 Labrit 2)
     */
    getRanking: function (championnat) {
      	console.log('getClassement()');
        var def = deferred();
      	mysql.get('SELECT * FROM Equipe where Championnat = ' + championnat).done(function(teams) {
            teams = makeRanking(teams);
            def.resolve(teams);
        });
      	return def.promise();
	},

});

module.exports = new Championnat();

function makeRanking(teams) {
    for (var i = teams.length - 1; i >= 0; i--) {
        teams[i]['points'] = (teams[i]['Victoire'] * 4) + (teams[i]['Nul'] * 2) + teams[i]['Defaite'];
        teams[i]['diff'] = teams[i]['ButPour'] - teams[i]['ButContre'];
        teams[i]['journee'] = teams[i]['Victoire'] + teams[i]['Nul'] + teams[i]['Defaite'];
    };

    teams.sort(function(b, a) {
        return (((a.points - b.points) == 0) ? (a.diff - b.diff) == 0 ? a.ButPour - b.ButPour : a.diff - b.diff : a.points - b.points);
    });

    return teams;
}