require 'json'

json = JSON.parse '{"foo":"bar", "ping":"pong", "big":"bang"}'
puts "foo : "
puts json['foo'] # prints "bar"
puts "\n ping : "
puts json['ping'] # prints "pong"
puts "\n big : "
puts json['big'] # prints "band"

