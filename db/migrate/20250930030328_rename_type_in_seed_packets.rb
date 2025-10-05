class RenameTypeInSeedPackets < ActiveRecord::Migration[8.0]
  def change
    rename_column :seed_packets, :type, :seed_type
  end
end
