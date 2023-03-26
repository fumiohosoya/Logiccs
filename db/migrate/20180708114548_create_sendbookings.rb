class CreateSendbookings < ActiveRecord::Migration[4.2]
  def change
    create_table :sendbookings do |t|
      t.references :user, index: true, foreign_key: true
      t.references :truck, index: true, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
  end
end
