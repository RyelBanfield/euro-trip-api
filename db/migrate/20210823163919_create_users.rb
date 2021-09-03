class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :sub
      t.string :email
      t.string :name
      t.string :given_name
      t.string :family_name
      t.string :picture

      t.timestamps
    end
  end
end
