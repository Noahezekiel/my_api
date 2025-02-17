class CreateEruptions < ActiveRecord::Migration[8.0]
  def change
    create_table :eruptions do |t|
      t.string :name
      t.string :country
      t.integer :elevation

      t.timestamps
    end
  end
end
