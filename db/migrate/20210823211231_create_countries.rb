class CreateCountries < ActiveRecord::Migration[6.1]
  def change
    create_table :countries do |t|
      t.string :name
      t.string :captial
      t.string :population
      t.string :language
      t.string :currency
      t.string :flag

      t.timestamps
    end
  end
end
