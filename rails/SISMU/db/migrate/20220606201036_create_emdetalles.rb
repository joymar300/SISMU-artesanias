class CreateEmdetalles < ActiveRecord::Migration[7.0]
  def change
    create_table :emdetalles do |t|
      t.integer :cantidad, limit: 8
      t.decimal :valor
      t.decimal :precio
      t.references :emfactura, null: false, foreign_key: true
      t.references :producto, null: false, foreign_key: true
      t.string :extra
      t.timestamps
    end
  end
end
