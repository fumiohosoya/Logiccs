class AddSealoilrwToCostbase < ActiveRecord::Migration[4.2]
  def change
    add_column :costbases, :seal_oil_rear_wheel, :integer
  end
end
