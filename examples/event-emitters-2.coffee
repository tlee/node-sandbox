http = require('http')

http.createServer( (req, res) ->

  res.writeHead(200, {'Content-Type': 'text/plain'})
  res.end('Your console contains the results of this example!\n')

  # create a new (generic) event emitter
  EventEmitter = require('events').EventEmitter
  ee = new EventEmitter();

  callback_once =  -> console.log("A singular callback has been called!")

  callback_many =  -> console.log("Let's keep calling me!")

  ee.once("event", callback_once)
  ee.emit("event")
  ee.emit("event")

  console.log ("Moving on...")

  ee.on("event", callback_many)
  ee.emit("event")
  ee.emit("event")

  console.log("Let's remove the multiple calls.")

  ee.removeListener("event", callback_many)
  ee.emit("event")

).listen(process.env.PORT || 8080, "")

console.log "Server started!"
