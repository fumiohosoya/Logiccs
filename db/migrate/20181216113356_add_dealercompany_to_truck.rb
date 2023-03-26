class AddDealercompanyToTruck < ActiveRecord::Migration[4.2]
  def change
    add_reference :trucks, :dealercompany, index: true, foreign_key: true
  end
end
