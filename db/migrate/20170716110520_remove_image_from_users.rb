class RemoveImageFromUsers < ActiveRecord::Migration[4.2]
  def change
    remove_column :users, :image, :string
  end
end
