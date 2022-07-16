class CreateTours < ActiveRecord::Migration[6.1]
  def change
    create_table :tours do |t|
      t.string :title, null: false
      t.string :image, null: false
      t.integer :price, null: false
      t.text :description, null: false
      t.integer :tour_type, null: false, default: 0
      t.datetime :start_date
      t.datetime :end_date
      t.string :time_in_day
      t.integer :limit_member

      t.timestamps
    end
  end
end
