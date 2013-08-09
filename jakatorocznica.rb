# encoding: UTF-8

Anniversary = Struct.new(:date, :name)

require 'sinatra'

get '/' do
	@lenin = Anniversary.new(
		Date.new(1914, 8, 8),
		'aresztowanie Lenina w Nowym Targu'
	)
	@wielopolski = Anniversary.new(
		Date.new(1862, 8, 7),
		'zamach na Wielopolskiego'
	)
	@edison = Anniversary.new(
		Date.new(1892, 8, 9),
		'patent Edisona na telegraf'
	)
	@anniversaries = [@wielopolski, @lenin, @edison]
	@current_anniversary = @wielopolski
	@anniversary_number = Date.today.year - @current_anniversary.date.year
	erb :index
end