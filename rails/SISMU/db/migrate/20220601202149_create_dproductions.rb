class CreateDproductions < ActiveRecord::Migration[7.0]
  def change
    create_table :dproductions do |t|
      t.integer :cantidad
      t.references :production, null: false, foreign_key: true
      t.references :producto, null: false, foreign_key: true
      t.references :artesano, null: false, foreign_key: true

      t.timestamps
    end
  end
end
