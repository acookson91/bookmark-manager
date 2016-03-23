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
  params[:tags].split(', ').each do |tag|
    link.tags << Tag.create(name: tag)
  end
  link.save
  redirect to('/')
end

get '/tags/:name' do
  tag = Tag.all(name: params[:name])
  @links = tag ? tag.links : []
  erb :'links/index'
end

run! if app_file ==$0
end
