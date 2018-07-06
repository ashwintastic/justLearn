class CreateVideoTagMappings < ActiveRecord::Migration[5.1]
  def change
    create_table :video_tag_mappings do |t|
      t.string :token
      t.belongs_to :tag, index: true
      t.belongs_to :video, index: true
      t.timestamps
    end
  end
end
