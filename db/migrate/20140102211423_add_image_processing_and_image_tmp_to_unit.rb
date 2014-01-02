class AddImageProcessingAndImageTmpToUnit < ActiveRecord::Migration
  def change
    add_column :units, :image_processing, :boolean
    add_column :units, :image_tmp, :string
  end
end
