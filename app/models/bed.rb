class Bed < ApplicationRecord
    has_many :squares, dependent: :destroy
end
