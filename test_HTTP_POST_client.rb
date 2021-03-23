require 'json'
require 'net/http'
require 'uri'


push = JSON.parse('{ "foo":"bar", "ping":"pong", "big":"bang" }')
Net::HTTP.post_form( URI('http://127.0.0.1:4567/'),  push)

# HTTP HEADER POST params :  @params={"foo"=>"bar", "ping"=>"pong", "big"=>"bang"}
exit(0)

