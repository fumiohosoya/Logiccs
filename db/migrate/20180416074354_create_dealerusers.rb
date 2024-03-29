class CreateDealerusers < ActiveRecord::Migration[4.2]
  def change
    create_table :dealerusers do |t|
      t.string :name
      t.string :email
      t.string :position
      t.references :branch, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
