class ChangeWheelsToTrailer < ActiveRecord::Migration[4.2]
  def change
     change_column :trailers, :wheels, :string
  end
end
