# encoding: UTF-8

Anniversary = Struct.new(:date, :name)

require 'sinatra'

ANNIVERSARIES = [
  Anniversary.new(
    Date.new(1914, 8, 8),
    'aresztowanie Lenina w Nowym Targu'
  ),
  Anniversary.new(
    Date.new(1862, 8, 7),
    'zamach na Wielopolskiego'
  ),
  Anniversary.new(
    Date.new(1944, 8, 29),
    'Józef Szczepański napisał wiersz Czerwona zaraza'
  ),
  Anniversary.new(
    Date.new(1892, 8, 9),
    'patent Edisona na telegraf'
  ),
  Anniversary.new(
    Date.new(1861, 10, 24),
    'otwarcie linii kolejowej Toruń-Bydgoszcz'
  ),
  Anniversary.new(
    Date.new(1767, 10, 24),
    'nadanie Andrychowowi praw miejskich'
  ),
  Anniversary.new(
    Date.new(1660, 11, 2),
    'koniec bitwy pod Cudnowem'
  ),
  Anniversary.new(
    Date.new(1144, 11, 8),
    'konsekracja katedry płockiej'
  ),
  Anniversary.new(
    Date.new(1889, 11, 9),
    'pierwsze telefony w Gdańsku'
  ),
  Anniversary.new(
    Date.new(1950, 12, 3),
    'spis powszechny'
  )
]

get '/' do
  
  @anniversaries = ANNIVERSARIES.shuffle

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
