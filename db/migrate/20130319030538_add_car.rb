class AddCar < ActiveRecord::Migration
  def up
    create_table :cars do |t|
      t.string   :name
      t.integer  :year
      t.string   :manufacturer
      t.integer  :mileage
      t.string   :seats
      t.string   :category
    end
  end

  def down
    drop_table :cars
  end
end
