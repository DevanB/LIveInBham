class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip_code_id
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
