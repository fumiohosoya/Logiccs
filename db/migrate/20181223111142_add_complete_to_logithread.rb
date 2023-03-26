class AddCompleteToLogithread < ActiveRecord::Migration[4.2]
  def change
    add_column :logithreads, :complete, :date
  end
end
