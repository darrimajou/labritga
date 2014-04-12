var Base = require('basejs');
var mysql = require('./mysql');
var deferred = require('deferred');

/**
 * Class Joueur
 * Define a Joueur and call database requests
 * @author kdarri
 */
var Joueur = Base.extend({

    /**
     * Constructor
     */
    constructor: function () {},    

    /**
     * Get table of scorer
     * @param championnat the championnat to get table of scorer
     */
    getScorers: function (championnat) {
        console.log('getScorer()');
        var def = deferred();
        mysql.get('SELECT Nom, Prenom, nbBut, Photo ' +
                    'FROM  Joueur ' +
                    'WHERE IdChampionnat = ' + championnat + ' ' +
                    'Order by nbBut desc ' +
                    'LIMIT 5')
        .done(function(scorers) {
            def.resolve(scorers);
        });
        return def.promise();
    },    

    /**
     * Get table of passer
     * @param championnat the championnat to get table of passer
     */
    getPassers: function (championnat) {
        console.log('getPasser()');
        var def = deferred();
        mysql.get('SELECT Nom, Prenom, nbPasse, Photo ' +
                    'FROM  Joueur ' +
                    'WHERE IdChampionnat = ' + championnat + ' ' +
                    'Order by nbPasse desc ' +
                    'LIMIT 5')
        .done(function(passers) {
            def.resolve(passers);
        });
        return def.promise();
    },

    /**
     * Get table of Best Player Of Week 
     */
    getBestPlayerOfWeek: function (idWeekEnd) {
        console.log('getBestPlayerOfWeek()');
        var def = deferred();
        mysql.get('SELECT j.Nom, j.Prenom, Round(b.nbVote/(SELECT SUM(nbVote) From BestJoueur Where IdWeekEnd = 1)*100, 1) As Percent ' +
                    'FROM BestJoueur b ' +
                    'INNER JOIN Joueur j ON b.IdJoueur = j.id ' +
                    'WHERE b.IdWeekEnd = ' + idWeekEnd)
        .done(function(players) {
            def.resolve(players);
        });
        return def.promise();
    }

});

module.exports = new Joueur();