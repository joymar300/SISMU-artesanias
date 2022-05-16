class CreateFacturas < ActiveRecord::Migration[7.0]
  def change
    create_table :facturas do |t|
      t.references :client, null: false, foreign_key: true
      t.decimal :total, precision: 8, scale: 2

      t.timestamps
    end
  end
end
