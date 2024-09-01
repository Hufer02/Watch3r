class AddImageToList < ActiveRecord::Migration[7.2]
  def change
    add_column :lists, :image, :string
  end
end
