class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :nombre_cli
      t.string :nombre2_cli
      t.string :apellido_cli
      t.string :apellido2_cli
      t.integer :tel_cli, limit: 8
      t.string :correo_cli
      t.string :direccion_cli
      t.integer :cedula_cli
      t.timestamps
    end
  end
end
