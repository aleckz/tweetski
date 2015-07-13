require 'sinatra/base'
require_relative 'data_mapper_setup'
require './app/models/peep'

class Tweetski < Sinatra::Base


  set :views, proc {File.join(root,'.', 'views')}


  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end


run if app_file == $0


end
