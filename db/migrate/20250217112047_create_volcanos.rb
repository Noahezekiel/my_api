class CreateVolcanos < ActiveRecord::Migration[8.0]
  def change
    create_table :volcanos do |t|
      t.string :name
      t.string :location
      t.date :last_eruption

      t.timestamps
    end
  end
end
