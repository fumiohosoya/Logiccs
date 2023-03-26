class AddPurchaseToTruck < ActiveRecord::Migration[4.2]
  def change
    add_column :trucks, :purchase, :date
  end
end
