http = require('http')
fs = require('fs')

# The url we want, plus the path and options we need
options =
  host: 'twitter.com'
  path: '/statuses/public_timeline.json'
  method: 'GET'


writeChunks = (fileName, dataChunks) ->
  fs.writeFile(fileName, dataChunks, (err) ->
    throw err if (err)
    console.log("It's saved!")
  )


processPublicTimeline = (response) ->
  allChunks = ''
  firstChunk  = ''

  # recieved in chunks, couple event tests
  response.once 'data', (tweets) -> firstChunk = "#{tweets} \n"
  response.on 'data', (tweets) -> allChunks += "#{tweets} \n"

  # finished? ok, write the data to a file
  response.on 'end', () -> writeChunks('once.txt', firstChunk)
  response.on 'end', () -> writeChunks('many.txt', allChunks)


# make the request, and then end it, to close the connection
http.request(options, processPublicTimeline).end()
