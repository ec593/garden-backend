class BedSerializer < ActiveModel::Serializer
  attributes :id, :name, :x, :y, :width, :height, :archived
  
  has_many :squares
end
