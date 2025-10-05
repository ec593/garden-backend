class Square < ApplicationRecord
    belongs_to :bed
    has_one :planting, dependent: :destroy
end
