# Example: Reading a real file

fs = require('fs')

someText = "Yet today I consider myself the luckiest man on the face of this earth."

fs.writeFileSync('lou.txt', someText)

fs.readFile('lou.txt', 'utf8', (err, data) ->
  return console.log(err) if (err)
  console.log(data)
)
