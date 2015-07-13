require 'sinatra/base'
require_relative 'data_mapper_setup'
require './app/models/peep'
require './app/models/tag'
require './app/models/user'


class Tweetski < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
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

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(username: params[:username],
                        name: params[:name],
                        email: params[:email],
                        password: params[:password]
                        )
    session[:user_id] = @user.id
    redirect '/peeps'
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

helpers do

  def current_user
    @user ||= User.get(session[:user_id])
  end

end

run if app_file == $0


end
