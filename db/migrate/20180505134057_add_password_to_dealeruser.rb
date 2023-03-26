class AddPasswordToDealeruser < ActiveRecord::Migration[4.2]
  def change
    add_column :dealerusers, :password_digest, :string
  end
end
