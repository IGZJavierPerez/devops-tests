var bunyan = require('bunyan');
var Chance = require('chance'),
    chance = new Chance();

var log = bunyan.createLogger({
    name: 'foo',
    streams: [{
        path: '/var/log/bunyan.log'
    }]
});

infiniteLog();

function infiniteLog() {
	doLog(infiniteLog);
}

function doLog(callback) {
	setTimeout(function() {
		log.info({name: chance.name(), url: chance.url(), country: chance.country({ full: true }), price: chance.dollar()}, chance.sentence());
		callback();
	}, 1000 * Math.floor(Math.random() * 3 + 1));
	
}