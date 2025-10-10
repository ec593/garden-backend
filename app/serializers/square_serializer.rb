class SquareSerializer < ActiveModel::Serializer
  attributes :id, :x, :y, :planting

  def planting
    planting = object.planting
    return nil unless planting
    instance_options[:date_filter].call(planting) ? planting : nil
  end
end
