class AddUniqueIndexToSolidCacheEntries < ActiveRecord::Migration[7.1]
  def change
    add_index :solid_cache_entries, :key_hash, unique: true
  end
end
