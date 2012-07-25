fs = require('fs')

appendText = "Append to Lou"

fs.open('lou.txt', 'a+', (err, fd) ->
  return console.log(err) if (err)

  console.log 'file opened'

  fs.write(fd, appendText, undefined, undefined, (err, written, buffer) ->

    console.log 'file appended'

    fs.close(fd, (err) -> console.log err, 'file closed')
  )
)
