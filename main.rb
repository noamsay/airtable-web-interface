require 'sinatra'
require "slim"
require 'airtable'
require 'active_support/all'
require 'haml'
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"
configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

require_relative "gallery"

get '/' do
  gallery = Gallery.new(:api_key => 'key4hPsF3lTzceL6g', :app_key => 'appZyWY43bYd8NKBh', :table => 'Artists')
  @artists = gallery.all
  slim :index, :layout => :layout, layout_engine: :erb
end

 get '/artists/:id' do
# get '/artists/:name' do
  gallery = Gallery.new(:api_key => 'key4hPsF3lTzceL6g', :app_key => 'appZyWY43bYd8NKBh', :table => 'Artists')
  @theartist = gallery.find(params[:id])
  # @artist = gallery.find_by_name(params[:name])
  slim :show, :layout => :layout, layout_engine: :erb
end


