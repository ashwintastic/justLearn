class AddImageIconToVideo < ActiveRecord::Migration[5.1]
  def change
    add_column :videos, :icon, :string
  end
end
