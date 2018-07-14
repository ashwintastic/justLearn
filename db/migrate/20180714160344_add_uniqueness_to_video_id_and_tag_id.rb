class AddUniquenessToVideoIdAndTagId < ActiveRecord::Migration[5.1]
  def change
    add_index :video_tag_mappings, [:video_id, :tag_id], unique: true	
  end
end
