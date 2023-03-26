class AddAdminToLogithread < ActiveRecord::Migration[4.2]
  def change
    add_reference :logithreads, :admin, foreign_key: true
  end
end
