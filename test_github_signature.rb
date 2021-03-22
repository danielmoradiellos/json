# https://docs.github.com/en/developers/webhooks-and-events/securing-your-webhooks
# $ export SECRET_TOKEN=your_token

require 'sinatra'
require 'json'
require 'openssl'

post '/payload' do
  push = JSON.parse(request.body.read)
  request.body.rewind
  payload_body = request.body.read
  verify_signature(payload_body)
# request.body.read

#  push = JSON.parse(request.body.read)
#  push = JSON.parse(params[:payload])
  puts "I got some HEADER: #{request.inspect}"
  puts "X-GitHub-Event:"
  puts request.env['HTTP_X_GITHUB_EVENT']
  puts "\n"
  puts "HTTP_X_HUB_SIGNATURE_256:"  
  puts request.env['HTTP_X_HUB_SIGNATURE_256']
  puts "\n"
  puts "SECRET_TOKEN:" 
  puts ENV['SECRET_TOKEN']
  "I got some JSON: #{push.inspect}"
end

def verify_signature(payload_body)
  signature = 'sha256=' + OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha256'), ENV['SECRET_TOKEN'], payload_body)
  puts signature #sha256=e99c95fbf8dad0e7a66511ce7599ed8ce4a76a9979af51a2959d83c4812cb27d
  return halt 500, "Signatures didn't match!" unless Rack::Utils.secure_compare(signature, request.env['HTTP_X_HUB_SIGNATURE_256'])
  #return halt 500, "Signatures didn't match!" unless Rack::Utils.secure_compare(signature,"sha256=e99c95fbf8dad0e7a66511ce7599ed8ce4a76a9979af51a2959d83c4812cb27d" )
  puts "Signature match"
end

