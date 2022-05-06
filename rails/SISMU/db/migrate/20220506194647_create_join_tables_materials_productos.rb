class CreateJoinTablesMaterialsProductos < ActiveRecord::Migration[7.0]
  def change
    create_join_table :materials, :productos do |t|
      t.index [:material_id, :producto_id]
      t.index [:producto_id, :material_id]
    end
  end
end
