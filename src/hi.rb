require 'sinatra'
require 'twilio-ruby'
require 'sinatra/activerecord'
require './environments'


set :bind, '0.0.0.0'
set :port, 3000

class Call < ActiveRecord::Base
end

get '/hello-monkey' do
  people = {
      '+12059138469' => 'Frankie Robinson',
      '+12054109722' => 'Nick Robinson'
  }
  name = people[params['From']] || 'Monkey'
  Call.create(:from => params['From'], :to => params['To'])
  Twilio::TwiML::Response.new do |r|
    r.Say "Hello #{name}"
  end.text
end

get '/hello-frankie' do
  Twilio::TwiML::Response.new do |r|
    r.Say 'Hello Frankie'
  end.text
end