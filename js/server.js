var express = require('express');
var news = require('./news');

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
    news.create(req.body.news).done(function(message) {
        res.json(message);
    }).fail(function(err) {
        res.send(500, 'Error:' + err);
    });
});

// Get classement
app.get('/Classement/:equipe', function(req, res) {
    res.setHeader('Content-Type', 'text/plain');
    res.send(501, 'Classement : Not implemented');
});

// Get last results
app.get('/Result/:equipe', function(req, res) {
    res.setHeader('Content-Type', 'text/plain');
    res.send(501, 'Result : Not implemented');
});

// Get calendar
app.get('/Calendar/:equipe', function(req, res) {
    res.setHeader('Content-Type', 'text/plain');
    res.send(501,'Calendar : Not implemented');
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

// 404 not found
app.use(function(req, res, next){
    res.setHeader('Content-Type', 'text/plain');
    res.send(404, 'Page introuvable !');
});

app.listen(8080);