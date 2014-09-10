
require 'sinatra'
require "data_mapper"

env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")

require './lib/link' # this needs to be done after

DataMapper.finalize

DataMapper.auto_upgrade!

get '/' do
  @links = Link.all
  erb :index
end

post '/add_link' do
  data_url_that_arrives_here   = params[:url]
  data_title_that_arrives_here = params[:title]
  Link.create(:title => data_title_that_arrives_here, url: data_url_that_arrives_here)
  redirect to '/'
end


