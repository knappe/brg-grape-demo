class AddDriver < ActiveRecord::Migration
  def up
    create_table :drivers do |t|
      t.string   :name
      t.integer  :age
      t.string   :sex
    end
  end

  def down
    drop_table :drivers
  end
end
