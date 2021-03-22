require 'sinatra'
require 'json'

get '/payload' do
  "Hello World"
end


post '/payload' do
#get '/index0.php' do
#get '/index0.php' do
print "<html><body>Hello World!</body></html>\r\n"
   "hello world"
  push = JSON.parse(request.body.read)
#  push = JSON.parse( '{"foo":"bar", "ping":"pong", "big":"bang"}')
#  puts "I got some JSON: test"
  puts "I got some JSON: #{push.inspect}"
end

