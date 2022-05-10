class CreateOffers < ActiveRecord::Migration[6.1]
  def change
    create_table :offers do |t|
      t.string :bike
      t.string :localization
      t.integer :price
      t.string :bike_condition

      t.timestamps
    end
  end
end
