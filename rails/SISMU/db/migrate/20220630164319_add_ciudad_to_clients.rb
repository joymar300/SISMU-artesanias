class AddCiudadToClients < ActiveRecord::Migration[7.0]
  def change
    add_column :clients, :ciudad, :string
    add_column :clients, :barrio, :string
  end
end
