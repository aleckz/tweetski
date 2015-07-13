require 'data_mapper'
require 'dm-postgres-adapter'

class Peep
  include DataMapper::Resource

  property :id,      Serial
  property :title,   String
  property :message, Text

  has n, :tags, through: Resource
end