env = ENV['RACK_ENV'] || 'development'

require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-validations'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/tweetski_#{env}")

require_relative './models/peep'
require_relative './models/tag'
require_relative './models/user'

DataMapper.finalize

DataMapper.auto_upgrade!
