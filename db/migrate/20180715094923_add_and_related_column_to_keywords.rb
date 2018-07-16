class AddAndRelatedColumnToKeywords < ActiveRecord::Migration[5.1]
  def change
    add_column :keywords, :and_related, :boolean
  end
end
