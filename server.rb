require 'sinatra'
require 'sinatra/reloader'
require 'pg'

configure :development, :test do
  require 'pry'
end

get '/' do
  erb :index
end

post '/' do
  if params[:recipe_name].empty?
    erb :error
  else
    @delicious = delicious?(params[:recipe_name])
    @recipe_name = params[:recipe_name]
    erb :results
  end
end

def delicious?(recipe_name)
  recipe_name.downcase.include?("pickled beets")
end
