require 'bundler'
Bundler.require

require_relative 'models/user'
require_relative 'models/grumble'

require_relative 'config.rb'


get '/' do
  erb :index
end

get 'users/new' do
  erb :'users/new'
end
