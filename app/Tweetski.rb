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

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @peeps = tag ? tag.peeps : []
    erb :'peeps/index'
  end

  post '/likes' do
    id = params[:peep_id]
    peep = Peep.first(id: id)
    current_likes = peep.likes || 0
    new_likes = current_likes + 1
    peep.update(likes: new_likes)
    
    redirect '/'
    # puts peep.likes
  end



run if app_file == $0


end
