# encoding: UTF-8

require 'sinatra'

get '/' do
	if Date.today.day == 1 and Date.today.month == 8
		'Dziś jest rocznica Powstania Warszawskiego.'
	elsif Date.today.day == 11 and Date.today.month == 11
		'Dziś jest Dzień Niepodległości.'
	else
		'Nie ma dziś żadnej rocznicy.'
	end
end
