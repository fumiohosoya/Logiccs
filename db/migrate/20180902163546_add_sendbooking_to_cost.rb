class AddSendbookingToCost < ActiveRecord::Migration[4.2]
  def change
    add_reference :costbases, :sendbooking, index: true, foreign_key: true
  end
end
