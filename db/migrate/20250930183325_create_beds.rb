class CreateBeds < ActiveRecord::Migration[8.0]
  def change
    create_table :beds do |t|
      t.string :name
      t.date :start
      t.date :end
      t.integer :x
      t.integer :y
      t.integer :width
      t.integer :height

      t.timestamps
    end
  end
end
