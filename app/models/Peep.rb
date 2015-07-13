require 'data_mapper'


class Peep
  include DataMapper::Resource

  property :id,      Serial
  property :title,   String
  property :message, Text


end