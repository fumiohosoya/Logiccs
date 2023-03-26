class CreateBranches < ActiveRecord::Migration[4.2] 
  def change
    create_table :branches do |t|
      t.references :company, index: true, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
  end
end
