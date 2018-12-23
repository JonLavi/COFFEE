require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/producer')
require_relative('../models/product')
require_relative('../models/blend')
require_relative('../models/origin')
require_relative('../models/roast')
require_relative('../models/type')
also_reload('./models/*')
require('pry')

get '/settings' do
  @blends = Blend.all()
  @origins = Origin.all()
  @roasts = Roast.all()
  @types = Type.all()
  erb(:'settings/index')
end

post '/settings/blend' do
  blend = Blend.new(params)
  blend.save()
  redirect to("/settings")
end

post '/settings/origin' do
  origin = Blend.new(params)
  origin.save()
  redirect to("/settings")
end

post '/settings/roast' do
  roast = Blend.new(params)
  roast.save()
  redirect to("/settings")
end

post '/settings/type' do
  type = Blend.new(params)
  type.save()
  redirect to("/settings")
end
