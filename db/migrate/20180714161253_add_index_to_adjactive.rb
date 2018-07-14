class AddIndexToAdjactive < ActiveRecord::Migration[5.1]
  def change
   add_index :adjectives, :name
  end
end
