require 'bundler'
Bundler.require

require_relative 'models/user'
require_relative 'models/grumble'

require_relative 'config.rb'


get '/' do
  erb :index
end

get '/users/new' do
  erb :'users/new'
end

post '/users' do
  username = params[:username]
  new_user = User.create({username: username})
  redirect "/users/#{new_user.id}"
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end

get '/users/:id/edit' do
  @user = User.find(params[:id])
  erb :'users/edit'
end

put '/users/:id' do
  user = User.find(params[:id])
  username = params[:username]
  binding.pry
  user.update({username: username})
  redirect "users/#{user.id}"
end
