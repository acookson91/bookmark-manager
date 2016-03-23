ENV['RACK_ENV'] ||= 'development'

require_relative 'models/link'
require 'sinatra/base'
require './models/data_mapper_setup'

class Bookmarks < Sinatra::Base

enable :sessions

get '/' do
  @links = Link.all
  erb :'links/index'
end

get '/links/new' do
  erb :'links/new'
end

post '/links/newlink' do
  link = Link.new(url: params[:url],
  title: params[:title])
  tag  = Tag.create(name: params[:tags])
  link.tags << tag
  link.save
  redirect to('/')
end

run! if app_file ==$0
end
