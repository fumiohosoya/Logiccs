class CreateTirehistories < ActiveRecord::Migration[4.2]
  def change
    create_table :tirehistories do |t|
      t.references :truck, index: true, foreign_key: true
      t.integer :index
      t.string :serialno

      t.timestamps null: false
    end
  end
end
