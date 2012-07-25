fs = require('fs')
http = require('http')

http.createServer((req, res) ->
  fs.readFile("#{__dirname}/index.html", (err,data) ->
    if (err)
      res.writeHead(404);
      res.end(JSON.stringify(err));
      return

    res.writeHead(200)
    res.end(data)
  )
).listen(process.env.PORT || 8080, "127.0.0.1")
