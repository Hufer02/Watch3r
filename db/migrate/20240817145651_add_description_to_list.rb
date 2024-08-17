class AddDescriptionToList < ActiveRecord::Migration[7.2]
  def change
    add_column :lists, :description, :text
  end
end
