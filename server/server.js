var app  = require('express')(),
    http = require('http')(app),
    io   = require('socket.io')(http);
