class AddCorreoToEmpresa < ActiveRecord::Migration[7.0]
  def change
    add_column :empresas, :correo, :string
    add_column :empresas, :ciudad, :string
    add_column :empresas, :barrio, :string
  end
end
