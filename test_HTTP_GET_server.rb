require 'sinatra'

get '/' do
  "Hello World"
   puts "I got some HEADER: #{request.inspect}"
   puts "\nparams:"
   puts params.inspect
end

