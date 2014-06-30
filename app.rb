require 'bundler'
Bundler.require

require_relative 'models/user'
require_relative 'models/grumble'

require_relative 'config.rb'


get "/" do
  erb :index
end

get "/users/new" do
  erb :"users/new"
end

post "/users" do
  username = params[:username]
  new_user = User.create({username: username})
  redirect "/users/#{new_user.id}"
end

get "/users/:id" do
  @user = User.find(params[:id])
  erb :"users/show"
end

get "/users/:id/edit" do
  @user = User.find(params[:id])
  erb :"users/edit"
end

put "/users/:id" do
  user = User.find(params[:id])
  username = params[:username]
  binding.pry
  user.update({username: username})
  redirect "users/#{user.id}"
end

delete "/users/:id" do
  User.delete(params[:id])
  redirect "/"
end

get "users/:id/grumbles/new" do
  @user = User.find(params[:id])
  erb :"grumbles/new"
end

post "/users/:id/grumbles" do
  grumble = params[:grumble]
  user = User.find(params[:id])
  new_grumble = Grumble.create({grumble: grumble})
  user.grumbles << new_grumble
  redirect "/users/#{user.id}"
end

delete "/users/:id/grumbles/:grumble_id" do
  Grumble.delete(params[:grumble_id])
  redirect "/users/#{params[:user_id]}"
end
