class Branch < ActiveRecord::Base
  belongs_to :company
  has_many :users, dependent: :destroy
  
  has_many :trucks
  has_many :trailers
  
  validates :company_id,  presence: true
  validates :name,        presence: true, length: { maximum: 50 }
end
