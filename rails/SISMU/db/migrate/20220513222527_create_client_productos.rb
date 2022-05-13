class CreateClientProductos < ActiveRecord::Migration[7.0]
  def change
    create_table :client_productos do |t|
      t.string :nombre_pedido
      t.integer :cantidad_pedido
      t.integer :precio_pedido
      t.string :direccion_pedido
      t.references :clients, null: false, foreign_key: true
      t.references :productos, null: false, foreign_key: true

      t.timestamps
    end
  end
end
