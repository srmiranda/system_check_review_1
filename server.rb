require 'sinatra'
require 'shotgun'

get '/places' do
  places = File.readlines('places.txt')
  erb :layout, locals: { places: places }
end

post '/places' do
  place = params['place']

  File.open('places.txt', 'a') do |file|
    file.puts(place)
  end

  redirect '/places'
end
