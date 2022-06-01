class CreateArtesanos < ActiveRecord::Migration[7.0]
  def change
    create_table :artesanos do |t|
      t.string :nombre
      t.string :snombre
      t.string :apellido
      t.string :sapellido
      t.integer :cedula
      t.integer :tel

      t.timestamps
    end
  end
end
