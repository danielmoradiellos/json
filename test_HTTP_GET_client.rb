require 'net/http'
require 'uri'


uri = URI('http://127.0.0.1:4567/?count=10')
Net::HTTP.get(uri)


# HTTP HEADER GET params : @params={"count"=>"10"}

exit(0)
