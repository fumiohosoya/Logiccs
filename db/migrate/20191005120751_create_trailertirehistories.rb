class CreateTrailertirehistories < ActiveRecord::Migration[4.2]
  def change
    create_table :trailertirehistories do |t|
      t.references :trailer, index: true, foreign_key: true
      t.integer :index
      t.string :serialno
      t.date :purchasedate

      t.timestamps null: false
    end
  end
end
