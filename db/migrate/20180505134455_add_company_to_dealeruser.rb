class AddCompanyToDealeruser < ActiveRecord::Migration[4.2]
  def change
    add_reference :dealerusers, :dealercompany, index: true, foreign_key: true
  end
end
