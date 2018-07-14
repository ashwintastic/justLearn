class AddIndexToVideoOnName < ActiveRecord::Migration[5.1]
  def change
   add_index :videos, :name
  end
end
