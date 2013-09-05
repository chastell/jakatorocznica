class CreateAnniversaries < ActiveRecord::Migration
  def change
    create_table :anniversaries do |table|
      table.date :original_date
      table.string :name
    end
  end
end