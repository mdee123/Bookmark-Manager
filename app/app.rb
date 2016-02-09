ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'models/link'

class BookmarkManager < Sinatra::Base
  get '/' do
    @Links = Link.all
    erb :home
  end

  get '/new' do
    "hello"
    erb :new_links
  end

  post '/' do
    Link.create(title: params[:title], url: params[:url])
    redirect '/'
  end

  run! if app_file == $0
end
