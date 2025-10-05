class CreatePlantings < ActiveRecord::Migration[8.0]
  def change
    create_table :plantings do |t|
      t.references :square, foreign_key: true
      t.references :seed_packet, foreign_key: true
      t.integer :num_sites
      t.integer :seeds_per_site
      t.date :end

      t.timestamps
    end
  end
end
