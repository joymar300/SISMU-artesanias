class CreateProductos < ActiveRecord::Migration[7.0]
  def change
    create_table :productos do |t|
      t.string :nombre_pro
      t.string :referencia_pro
      t.decimal :precio_pro, precision: 8, scale: 2 

      t.timestamps
    end
  end
end
