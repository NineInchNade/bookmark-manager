env = ENV["RACK_ENV"] || "development"
# we're telling the datamapper to use a postgres database on localhost. The name will be "bookmark_manager"
Datamapper.setup(:default, "postgress://localhost/bookmark_manager_#{env}")

require './lib/link' # this needs to be done after datamapper is initialised

# after delcaring your models, you should finalise them
Datamapper.finalize

# however, the database tables dont exist yet. Let's tell datamapper to create them
Datamapper.auto_upgrade!