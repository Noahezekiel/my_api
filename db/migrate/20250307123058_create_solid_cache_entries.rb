
class CreateSolidCacheEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :solid_cache_entries do |t|
      t.string :key, null: false
      t.binary :value, null: false
      t.datetime :expires_at
      t.timestamps
    end

    add_index :solid_cache_entries, :key, unique: true
  end
end
