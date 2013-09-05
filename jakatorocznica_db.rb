# encoding: UTF-8

require 'sqlite3'
require 'active_record'
require 'sinatra'

class Anniversary < ActiveRecord::Base
end

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database =>  'jakatorocznica.sqlite3.db'
)

get '/' do
	@current_anniversary = Anniversary.new
	
	erb :index
end