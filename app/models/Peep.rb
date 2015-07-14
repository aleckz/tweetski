require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'

class Peep
  include DataMapper::Resource

  property :id,        Serial
  property :title,     String
  property :message,   Text
  property :created_at, DateTime, :default => lambda { |p,s| DateTime.now.strftime("%a %d %B %Y - %H:%M") }
  property :likes,     Integer 

  # belongs_to :user
  has n, :tags, through: Resource
end
