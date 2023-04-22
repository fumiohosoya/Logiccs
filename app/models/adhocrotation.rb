class Adhocrotation < ActiveRecord::Base
    
    belongs_to :truck, optional: true
    belongs_to :trailer, optional: true
end
