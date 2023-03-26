class AddTypeToCostbase < ActiveRecord::Migration[4.2]
  def change
    add_column :costbases, :type, :string
  end
end
