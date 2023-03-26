class CreateTireadmins < ActiveRecord::Migration[4.2]
  def change
    create_table :tireadmins do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.references :company, index: true, foreign_key: true
      t.references :branch, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
