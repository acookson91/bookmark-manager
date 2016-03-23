require_relative 'models/link'
require 'sinatra/base'

class Bookmarks < Sinatra::Base

enable :sessions

# get '/' do
#   redirect '/links/index'
# end

ENV['RACK_ENV'] ||= 'development'

get '/' do
  @links = Link.all
  erb :'links/index'
end

get '/links/new' do
  erb :'links/new'
end

post '/links/newlink' do
  Link.create(
  :title => params[:title],
  :url => params[:url]
  )
  redirect('/')
end

run! if app_file ==$0
end
