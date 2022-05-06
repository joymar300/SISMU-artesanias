class AddAvatarToProductos < ActiveRecord::Migration[7.0]
  def change
    add_column :productos, :avatar, :string
  end
end
