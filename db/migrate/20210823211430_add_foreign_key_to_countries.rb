class AddForeignKeyToCountries < ActiveRecord::Migration[6.1]
  def change
    def change
      add_index :favourites, :country, unique: true
      add_foreign_key :countries, :favourites, column: :name, primary_key: :country
    end
  end
end
