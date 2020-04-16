/**
 * This code actually listens fo TCp Packets
 * Receivers data in byte array
 * Writes Data to local image fine
 * Uploads image to Mongo DB
 */

var fs = require('fs');
var net = require('net');
var MongoClient = require('mongodb').MongoClient;
var Binary = require('mongodb').Binary;
var settings = {
	ip: "127.0.0.1",
	port: 5550
};

var moment = require('moment');



var _buffer = [];
var _bufferTimer = null;
var leakyDelay = 1000;

var imagecounter = Date.now();

//Method that saves photo to local system and mongo db in Binary format
var savePhoto = function () {
	//open file
	console.log("saving image");
	var data = Buffer.concat(_buffer);
	var filename = "images/image" + imagecounter + ".jpg";

	console.log("writing " + data.length + " bytes to file");
	fs.writeFileSync(filename, data);



	_buffer = [];
	MongoClient.connect("mongodb+srv://Admin:Password@particleimages-ue5yv.mongodb.net/test?retryWrites=true&w=majority", function (err, db) {

	if (err) {
		console.log("Please check you db connection parameters");
	} else {
		console.log("Connection success");
		var data = fs.readFileSync(filename,'base64');
		var insert_data = {};
		insert_data.file_data = String(data);
		var dbo = db.db("appdb");
		dbo.collection("files").insert(insert_data, function(err, res) {
			if (err) throw err;
			console.log("Image Has been inserted");
			db.close();
		  });
		
	}
});

}
var leakyBufferFn = function (part) {
	if (_bufferTimer) {
		clearTimeout(_bufferTimer);
	}
	_buffer.push(part);
	_bufferTimer = setTimeout(savePhoto, leakyDelay);
}


var server = net.createServer(function (socket) {
	console.log("Connection received");

	socket.on('readable', function () {
		var data = socket.read();
		leakyBufferFn(data);

		// this slows us down
		//		if (data) {
		//			console.log("received data: " + data.length + " bytes");
		//		}
	});
});
//Creates TCP server
server.listen(settings.port, function () {
	console.log('Listening for TCP packets on port ' + settings.port + ' ...');
});


//udpSocket.on('message', function(msg, rinfo) {
//	if (rinfo.size == 0) {
//		return;
//	}
//	console.log("rinfo was ", rinfo);
//	console.log('received [' + rinfo.address + '] (' + msg.length + ' bytes) ' + msg.toString('hex'));
//	l
//});
//
//udpSocket.bind(port);