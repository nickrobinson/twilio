require 'sinatra'
require 'twilio-ruby'

set :bind, '0.0.0.0'

get '/hello-monkey' do
  Twilio::TwiML::Response.new do |r|
    r.Say 'Hello Monkey'
  end.text
end

get '/hello-frankie' do
  Twilio::TwiML::Response.new do |r|
    r.Say 'Hello Frankie'
  end.text
end