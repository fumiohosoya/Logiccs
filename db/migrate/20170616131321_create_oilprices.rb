class CreateOilprices < ActiveRecord::Migration[4.2]
  def change
    create_table :oilprices do |t|
      t.integer :price

      t.timestamps null: false
    end
  end
end
