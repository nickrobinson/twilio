require 'sinatra'
require 'twilio-ruby'
require 'sinatra/activerecord'
require './environments'


set :bind, '0.0.0.0'
set :port, 80

class Call < ActiveRecord::Base
end

get '/hello-monkey' do
  people = {
      '+12059138469' => 'Frankie Robinson',
      '+12054109722' => 'Nick Robinson'
  }
  name = people[params['From']] || 'Monkey'

  unless params['From'] == nil
    Call.create(:from => params['From'], :to => params['To'], :account_sid => params['AccountSid'],
                :call_sid => params['CallSid'])
  end

  Twilio::TwiML::Response.new do |r|
    r.Say "Hello #{name}"
  end.text
end

get '/ping' do
  Twilio::TwiML::Response.new do |r|
    r.Say 'Ping Success'
  end.text
end