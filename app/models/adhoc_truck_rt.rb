class AdhocTruckRt < Adhocrotation
    belongs_to :truck
    belongs_to :trailer, optional: true    
#    validates :date, presence: true
end
