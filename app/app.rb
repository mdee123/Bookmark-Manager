ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base
  get '/' do
    @Links = Link.all
    erb :home
  end

  get '/new' do
    erb :new_links
  end

  post '/' do
    link = Link.new(title: params[:title], url: params[:url])
    tag = Tag.create(name: params[:tags])
    link.tags << tag
    link.save
    redirect '/'
  end

  run! if app_file == $0
end
