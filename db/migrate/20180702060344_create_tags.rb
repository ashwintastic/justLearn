class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.string :token
      t.string :name

      t.timestamps
    end
  end
end
