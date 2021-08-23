class CreateFavourites < ActiveRecord::Migration[6.1]
  def change
    create_table :favourites do |t|
      t.string :sub
      t.string :country

      t.timestamps
    end
  end
end
