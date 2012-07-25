http = require('http')
fs = require('fs')

# The url we want, plus the path and options we need
options =
  host: 'twitter.com'
  path: '/statuses/public_timeline.json'
  method: 'GET'

processPublicTimeline = (response) ->
  tweetData = ''

  # recieved in chunks
  response.on 'data', (tweets) -> tweetData += "#{tweets} \n"

  # finished? ok, write the data to a file
  response.on('end', ->
    fs.writeFile('blather.txt', tweetData, (err) ->
      throw err if (err)
      console.log("It's saved!")
    )
  )

# make the request, and then end it, to close the connection
http.request(options, processPublicTimeline).end()
