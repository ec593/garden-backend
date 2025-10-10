class CreateSquares < ActiveRecord::Migration[8.0]
  def change
    create_table :squares do |t|
      t.references :bed, foreign_key: true
      t.integer :x
      t.integer :y

      t.timestamps
    end
  end
end
