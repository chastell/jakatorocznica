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
  katedra = Anniversary.new(
    Date.new(1144, 11, 8),
    'konsekracja katedry płockiej'
  )
  telefony = Anniversary.new(
    Date.new(1889, 11, 9),
    'pierwsze telefony w Gdańsku'
  )
  spis = Anniversary.new(
    Date.new(1950, 12, 3),
    'spis powszechny'
  )
  @anniversaries = [wielopolski, lenin, edison, szczepanski, linia_kolejowa,
   andrychow, bitwa, katedra, telefony, spis].shuffle

  @anniversaries = @anniversaries.sort_by do |anniversary|
    [anniversary.date.month, anniversary.date.day]
  end

  @current_anniversary = @anniversaries.find do |anniversary|
    anniversary.date.day == Date.today.day and
      anniversary.date.month == Date.today.month
  end

  @next_anniversary = @anniversaries.find do |anniversary|
    anniversary.date.month > Date.today.month or
      (anniversary.date.month == Date.today.month and
       anniversary.date.day > Date.today.day)
  end

  @last_anniversary = @anniversaries.reverse.find do |anniversary|
    anniversary.date.month < Date.today.month or
      (anniversary.date.month == Date.today.month and
       anniversary.date.day < Date.today.day)
  end

  erb :index
end
