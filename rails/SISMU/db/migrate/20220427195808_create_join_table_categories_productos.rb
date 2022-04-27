class CreateJoinTableCategoriesProductos < ActiveRecord::Migration[7.0]
  def change
    create_join_table :categories, :productos do |t|
      t.index [:category_id, :producto_id]
      t.index [:producto_id, :category_id]
    end
  end
end
