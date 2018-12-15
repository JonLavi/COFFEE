require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/producer')
also_reload('./models/*')

get '/producers' do
  @producers = Producer.all
  erb(:'producers/index')
end

get '/producers/new' do
  erb(:'producers/new')
end

get '/producers/:id' do
  @producer = Producer.find(params['id'].to_i)
  erb(:'producers/show')
end

post '/producers' do
  producer = Producer.new(params)
  producer.save()
  redirect to("/producers")
end

#edit producers route
#delete producers route
