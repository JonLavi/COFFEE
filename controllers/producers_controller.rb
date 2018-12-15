require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/producer')
also_reload('./models/*')

get '/producers' do
  @producers = Producer.all
  erb(:'producers/index')
end

get '/producers/:id' do
  @producer = Producer.find(params['id'].to_i)
  erb(:'producers/show')
end

get '/producers/new' do
  erb(:'producers/new')
end

#new producer route
#edit producers route
#delete producers route
