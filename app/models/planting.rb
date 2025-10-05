class Planting < ApplicationRecord
    belongs_to :square
    belongs_to :seed_packet
end
