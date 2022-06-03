class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :foto
      t.string :nombre
      t.string :apellido
      t.string :direccion
      t.string :ciudad
      t.string :estado
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
