require 'sinatra'
require 'twilio-ruby'

set :bind, '0.0.0.0'
set :port, 80

get '/hello-monkey' do
  people = {
      '+12059138469' => 'Frankie Robinson',
      '+12054109722' => 'Nick Robinson'
  }
  name = people[params['From']] || 'Monkey'
  Twilio::TwiML::Response.new do |r|
    r.Say "Hello #{name}"
  end.text
end

get '/hello-frankie' do
  Twilio::TwiML::Response.new do |r|
    r.Say 'Hello Frankie'
  end.text
end