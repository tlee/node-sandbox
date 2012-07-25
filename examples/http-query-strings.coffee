querystring = require('querystring')
http = require('http')

# stringify() adds the & and = we need
post_data = querystring.stringify(
  'query' : 'bananas',
  'region': 'Brazil'
)

postOptions =
  host: 'google.com'
  path: '/search'
  method: 'POST'
  headers:
    'Content-Type': 'application/x-www-form-urlencoded'
    'Content-Length': post_data.length

postRequest = http.request(postOptions, (result) ->
  result.setEncoding('utf8')
  result.on 'data', (chunk) -> console.log('Response: ' + chunk)
)

# write parameters to post body
postRequest.write(post_data)
postRequest.end()

# parse example
sampleURL = "http://www.amazon.com/Dark-Back-Time-Javier-Marias/dp/0811215709/ref=sr_1_1?s=books&ie=UTF8&qid=1327136343&sr=1-1"
parsedURL = querystring.parse(sampleURL.substring(sampleURL.lastIndexOf("/") + 1))
console.log parsedURL
