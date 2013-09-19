class CreateAnniversaries < ActiveRecord::Migration
  def change
    create_table :anniversaries do |table|
      table.integer :year
      table.integer :month
      table.integer :day
      table.string  :name
    end
  end
end
