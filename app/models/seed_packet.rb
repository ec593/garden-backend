class SeedPacket < ApplicationRecord
    has_many :plantings, dependent: :destroy
end
