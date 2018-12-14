require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/producer')
also_reload('./models/*')

get '/producers' do
  @producers = Producer.all
  erb(:'producers/index')
end
