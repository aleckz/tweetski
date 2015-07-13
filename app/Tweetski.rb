require 'sinatra/base'
require_relative 'data_mapper_setup'
require './app/models/peep'
require './app/models/tag'

class Tweetski < Sinatra::Base


  set :views, proc {File.join(root,'.', 'views')}


  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    peep = Peep.new(title:   params[:title],
                    message: params[:message])
    tags = params[:tags].split
    tags.each { |tag| peep.tags << Tag.create(name: tag) }
    peep.save
    redirect '/peeps'
  end


run if app_file == $0


end
