class AddFlagToSendbooking < ActiveRecord::Migration[4.2]
  def change
    add_column :sendbookings, :done, :boolean, default: false
  end
end
