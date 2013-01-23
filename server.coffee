express = require('express')
http = require('http')
app = express();
server = http.createServer(app)
io = require('socket.io').listen(server)

port = if process.env.PORT then process.env.PORT else 3000

app.use(express.static(__dirname + '/public'));
app.enable('trust proxy')

#commented out, as we are currently delivering the static index.html
#app.get('/', (req, res) ->
#  res.send('Hello World')
#)

io.sockets.on('connection', (socket) ->
  socket.emit('news', { hello: 'world' })
  
  socket.on('my other event', (data) -> 
    console.log(data)
  )
)




server.listen(port)
console.log('Listening on port '+port);