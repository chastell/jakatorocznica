# encoding: UTF-8

Anniversary = Struct.new(:date, :name)

require 'sinatra'

get '/' do
	lenin = Anniversary.new(
		Date.new(1914, 8, 8),
		'aresztowanie Lenina w Nowym Targu'
	)
	wielopolski = Anniversary.new(
		Date.new(1862, 8, 7),
		'zamach na Wielopolskiego'
	)
	szczepanski = Anniversary.new(
		Date.new(1944, 8, 29),
		'Józef Szczepański napisał wiersz Czerwona zaraza'
	)
	edison = Anniversary.new(
		Date.new(1892, 8, 9),
		'patent Edisona na telegraf'
	)
	@anniversaries = [wielopolski, szczepanski, lenin, edison]

  for anniversary in @anniversaries do
  	if(anniversary.date.day == Date.today.day and anniversary.date.month == Date.today.month)
  	  @current_anniversary = anniversary
  	end
  end
	
	if(@current_anniversary)
		@anniversary_number = Date.today.year - @current_anniversary.date.year
	end
	erb :index
end