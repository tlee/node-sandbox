http = require('http')

requestListener = (req, res) ->
  res.writeHead(200)
  res.end('Hello, HTTP!\n')

server = http.createServer(requestListener)

server.listen(process.env.PORT || 8080, "127.0.0.1")
