class CreateDetalles < ActiveRecord::Migration[7.0]
  def change
    create_table :detalles do |t|
      t.references :factura, null: false, foreign_key: true
      t.references :producto, null: false, foreign_key: true
      t.integer :cantidad, limit: 8
      t.decimal :valor, precision: 8, scale: 2 
      t.decimal :precio,precision: 8, scale: 2
      t.date :fechafin
      t.string :extra
      t.timestamps
    end
  end
end
