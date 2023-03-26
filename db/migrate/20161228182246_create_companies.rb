class CreateCompanies < ActiveRecord::Migration[4.2]
  def change
    create_table :companies do |t|
      t.string :name_j
      t.string :name_e

      t.timestamps null: false
    end
  end
end
