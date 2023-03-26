class AddBranchToDealeruser < ActiveRecord::Migration[4.2]
  def change
    add_reference :dealerusers, :dealerbranch, index: true, foreign_key: true
  end
end
