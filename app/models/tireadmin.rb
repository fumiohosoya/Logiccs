class Tireadmin < ActiveRecord::Base
  
  has_secure_password

  belongs_to :company
  belongs_to :branch
end
