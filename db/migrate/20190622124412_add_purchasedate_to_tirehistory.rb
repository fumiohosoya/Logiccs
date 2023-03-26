class AddPurchasedateToTirehistory < ActiveRecord::Migration[4.2]
  def change
    add_column :tirehistories, :purchasedate, :date
  end
end
