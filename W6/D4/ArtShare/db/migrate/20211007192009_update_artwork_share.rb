class UpdateArtworkShare < ActiveRecord::Migration[5.2]
  def change
    remove_index :artwork_shares, :artwork_id
    remove_index :artwork_shares, :viewer_id
    add_index :artwork_shares, :artwork_id
    add_index :artwork_shares, :viewer_id
  end
end
