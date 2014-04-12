var express = require('express');
var news = require('./news');
var championnat = require('./championnat');

// Express framework
var app = express();

// Get all News in Database
app.get('/News', function(req, res) {
    news.getAll().done(function(actus) {
        res.json(actus);
    });
});

// Post a news
app.post('/News', function(req, res) {
    news.create(req.body.news)
    .done(function(message) {
        res.json(message);
    }).fail(function(err) {
        res.send(500, 'Error:' + err);
    });
});

// Get ranking of a championnat 
app.get('/Classement/:championnat', function(req, res) {
    championnat.getRanking(req.params.championnat)
    .done(function(ranking) {
        res.json(ranking);
    });
});

// Get last results
app.get('/Result/:championnat', function(req, res) {
    championnat.getLastResults(req.params.championnat)
    .done(function(results) {
        res.json(results);
    });
});

// Get results by day
app.get('/Result/:championnat/Day/:day', function(req, res) {
    championnat.getResultsByDay(req.params.championnat, req.params.day)
    .done(function(results) {
        res.json(results);
    });
});

// Get results by date
app.get('/Result/:championnat/DateMin/:dateMin/DateMax/:dateMax', function(req, res) {
    championnat.getResultsByDate(req.params.championnat, req.params.dateMin, req.params.dateMax)
    .done(function(results) {
        res.json(results);
    });
});

// Get scorer
app.get('/Scorer/:equipe', function(req, res) {
    res.setHeader('Content-Type', 'text/plain');
    res.send(501, 'Scorer : Not implemented');
});

// Get passer
app.get('/Passer/:equipe', function(req, res) {
    res.setHeader('Content-Type', 'text/plain');
    res.send(501, 'Passer : Not implemented');
});

// Get classement of the week best player
app.get('/Players/:equipe', function(req, res) {
    res.setHeader('Content-Type', 'text/plain');
    res.send(501, 'Get best player : Not implemented');
});

// Vote for the week best player
app.post('/Player', function(req, res) {
    res.setHeader('Content-Type', 'text/plain');
    res.send(501, 'Vote for week best player : Not implemented');
});

// 404 not found
app.use(function(req, res, next){
    res.setHeader('Content-Type', 'text/plain');
    res.send(404, 'Page introuvable !');
});

app.listen(8080);