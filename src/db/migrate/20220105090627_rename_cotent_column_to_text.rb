class RenameCotentColumnToText < ActiveRecord::Migration[6.1]
  def change
    rename_column :posts, :cotent, :text
  end
end
