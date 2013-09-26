# encoding: UTF-8

class AddAnniversaries < ActiveRecord::Migration
  class Anniversary < ActiveRecord::Base
  end

  def up
    Anniversary.create(:year => 1914, :month => 8, :day => 8,
                       :name => 'aresztowanie Lenina w Nowym Targu')
    Anniversary.create(:year => 1862, :month => 8, :day => 7,
                       :name => 'zamach na Wielopolskiego')
    Anniversary.create(:year => 1944, :month => 8, :day => 29,
                       :name => 'Józef Szczepański napisał wiersz Czerwona zaraza')
    Anniversary.create(:year => 1892, :month => 8, :day => 9,
                       :name => 'patent Edisona na telegraf')
    Anniversary.create(:year => 1937, :month => 9, :day => 25,
                       :name => 'pierwsze odegranie Hejnału Płocka')
    Anniversary.create(:year => 1947, :month => 9, :day => 26,
                       :name => 'nacjonalizacja Hotelu Bristol')
    Anniversary.create(:year => 1947, :month => 9, :day => 26,
                       :name => 'nacjonalizacja Hotelu Bristol')
    Anniversary.create(:year =>  715, :month => 9, :day => 26,
                       :name => 'zwycięstwo Neustrii nad Austrazją pod Compiègne')
    Anniversary.create(:year => 1879, :month => 9, :day => 27,
                       :name => 'otwarcie Portu Drzewnego w Bydgoszczy')
    Anniversary.create(:year => 1991, :month => 9, :day => 27,
                       :name => 'otwarcie Portu Drzewnego w Bydgoszczy')
    Anniversary.create(:year => 1933, :month => 10, :day => 20,
                       :name => 'Nisko uzyskało prawa miejskie')
  end

  def down
    Anniversary.delete_all
  end
end
