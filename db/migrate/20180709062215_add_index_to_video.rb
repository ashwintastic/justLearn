class AddIndexToVideo < ActiveRecord::Migration[5.1]
  def change
    add_index :videos, :name
    add_index :videos, :desc
  end
end
