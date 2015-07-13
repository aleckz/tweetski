require 'sinatra/base'
require_relative 'data_mapper_setup'

class Tweetski < Sinatra::Base

  get '/' do
    "Hello"
  end

end
