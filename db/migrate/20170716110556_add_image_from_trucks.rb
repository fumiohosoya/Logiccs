class AddImageFromTrucks < ActiveRecord::Migration[4.2]
  def change
    add_column :trucks, :image, :string
  end
end
