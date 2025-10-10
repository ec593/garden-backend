class PlantingSerializer < ActiveModel::Serializer
  attributes :id, :seed_packet_id, :num_sites, :seeds_per_site, :num_squares, :notes, :start, :end
end
