require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/producer')
also_reload('./models/*')


#Show all Producers
get '/producers' do
  @producers = Producer.all
  erb(:'producers/index')
end

#Create new Producer
get '/producers/new' do
  erb(:'producers/new')
end

post '/producers' do
  producer = Producer.new(params)
  producer.save()
  redirect to("/producers")
end

#Show Producer details
get '/producers/:id' do
  @producer = Producer.find(params['id'].to_i)
  erb(:'producers/show')
end

#Edit Producer details
get '/producers/:id/edit' do
  @producer = Producer.find(params['id'].to_i)
  erb(:'producers/edit')
end

post '/producers/:id' do
  @producer = Producer.new(params)
  @producer.update()
  erb(:'producers/show')
end

#Delete Producer route
