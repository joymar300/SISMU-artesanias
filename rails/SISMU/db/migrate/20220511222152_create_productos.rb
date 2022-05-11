class CreateProductos < ActiveRecord::Migration[7.0]
  def change
    create_table :productos do |t|
      t.string :nombre_pro
      t.string :referencia_pro
      t.integer :precio_pro

      t.timestamps
    end
  end
end
