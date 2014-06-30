require 'bundler'
Bundler.require

require_relative 'models/user'
require_relative 'models/grumble'

require_relative 'config.rb'


get '/' do
  erb :'users/index'
end
