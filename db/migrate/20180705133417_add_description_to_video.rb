class AddDescriptionToVideo < ActiveRecord::Migration[5.1]
  def change
    add_column :videos, :desc, :string
  end
end
