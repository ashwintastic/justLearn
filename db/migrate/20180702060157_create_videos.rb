class CreateVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :videos do |t|
      t.string :token
      t.string :name
      t.string :path

      t.timestamps
    end
  end
end
