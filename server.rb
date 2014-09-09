require "data_mapper"

env = ENV["RACK_ENV"] || "development"
# we're telling the DataMapper to use a postgres database on localhost. The name will be "bookmark_manager"
DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")

require './lib/link' # this needs to be done after DataMapper is initialised

# after delcaring your models, you should finalise them
DataMapper.finalize

# however, the database tables dont exist yet. Let's tell DataMapper to create them
DataMapper.auto_upgrade!