class CreateLogithreads < ActiveRecord::Migration[4.2]
  def change
    create_table :logithreads do |t|
      t.string :seed
      t.references :dealercompany, index: true, foreign_key: true
      t.references :truck, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
