class CreateSeedPackets < ActiveRecord::Migration[8.0]
  def change
    create_table :seed_packets do |t|
      t.string :type
      t.string :name
      t.string :company
      t.integer :year
      t.text :notes
      t.boolean :isEmpty

      t.timestamps
    end
  end
end
