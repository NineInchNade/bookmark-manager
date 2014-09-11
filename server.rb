
require 'sinatra'
require "data_mapper"

env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")

require './lib/link' # this needs to be done after
require './lib/tag'

DataMapper.finalize

DataMapper.auto_upgrade!

get '/' do
  @links = Link.all
  erb :index
end

get '/tags/:text' do
  tag = Tag.first(:text => params[:text])
  @links = tag ? tag.links : []
  # if tag
  #   @links = tag.links
  # else
  #   @link = []
  # end
  erb :index
end

post '/add_link' do
  data_url_that_arrives_here   = params[:url]
  data_title_that_arrives_here = params[:title]
  data_tag_that_arrives_here   = params["tags"].split(" ").map do |tag|
  Tag.first_or_create(:text => tag)
end
  Link.create(:title => data_title_that_arrives_here, url: data_url_that_arrives_here, :tags =>data_tag_that_arrives_here)
  redirect to '/'
end

