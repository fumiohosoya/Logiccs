class CreateTruckrelationships < ActiveRecord::Migration[4.2]
  def change
    create_table :truckrelationships do |t|
      t.references :user, index: true, foreign_key: true
      t.references :truck, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
