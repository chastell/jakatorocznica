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
  linia_kolejowa = Anniversary.new(
    Date.new(1861, 10, 24),
    'otwarcie linii kolejowej Toruń-Bydgoszcz'
  )
  andrychow = Anniversary.new(
    Date.new(1767, 10, 24),
    'nadanie Andrychowowi praw miejskich'
  )
  bitwa = Anniversary.new(
    Date.new(1660, 11, 2),
    'koniec bitwy pod Cudnowem'
  )
  @anniversaries = [wielopolski, lenin, edison, szczepanski, linia_kolejowa, andrychow, bitwa]

  @anniversaries.each do |anniversary|
    if anniversary.date.day == Date.today.day and anniversary.date.month == Date.today.month
      @current_anniversary = anniversary
      @anniversary_number = Date.today.year - @current_anniversary.date.year
    end
    if anniversary.date.month < Date.today.month or (anniversary.date.month == Date.today.month and anniversary.date.day < Date.today.day)
      @last_anniversary = anniversary
      @last_anniversary_number = Date.today.year - @last_anniversary.date.year
    end
  end

  erb :index
end
