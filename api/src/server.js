var express = require('express');
var app = express();

const config = require('./config');

app.set('port', config.server.port);
app.use(express.static(__dirname + '/public'));

app.get('/', function (request, response) {
  response.send('Hello World!');
});

app.listen(app.get('port'), function () {
  console.log('app is running at localhost:' + app.get('port'));
});
