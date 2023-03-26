class AddOpttirerotationToCompany < ActiveRecord::Migration[4.2]
  def change
    add_column :companies, :opt_tirerotation, :bool, default: false
  end
end
