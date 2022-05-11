class CreateProductos < ActiveRecord::Migration[7.0]
  def change
    create_table :productos do |t|
      t.string :nombre_pro
      t.float :precio_pro
      t.text :imagen_pro

      t.timestamps
    end
  end
end
