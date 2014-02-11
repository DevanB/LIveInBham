class AddContactPhoneNumberToUnits < ActiveRecord::Migration
  def change
    add_column :units, :phoneNum, :string
  end
end
