class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.boolean :featured
      t.string :number
      t.date :avail_date
      t.references :category, index: true
      t.references :building, index: true
      t.string :title
      t.text :description
      t.integer :bedrooms
      t.integer :bathrooms
      t.decimal :price
      t.string :link
      t.string :image

      t.timestamps
    end
  end
end
