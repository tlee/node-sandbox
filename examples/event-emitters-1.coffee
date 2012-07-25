http = require('http')

http.createServer( (req, res) ->
  chunks = []
  req.on('data', (chunk) -> chunks.push(chunk))
  req.on('end', -> console.dir(chunks))
).listen(process.env.PORT || 8080, "")

console.log "Server started!"
