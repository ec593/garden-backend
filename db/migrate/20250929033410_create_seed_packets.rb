class CreateSeedPackets < ActiveRecord::Migration[8.0]
  def change
    create_table :seed_packets do |t|
      t.string :seed_type
      t.string :name
      t.string :company
      t.integer :year
      t.text :notes
      t.boolean :is_empty
      t.timestamps
    end
  end
end
