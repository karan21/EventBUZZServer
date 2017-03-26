class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.date :date
      t.time :time
      t.integer :capacity
      t.text :venue
      t.integer :duration
      t.string :city
      t.string :image

      t.timestamps
    end
  end
end
