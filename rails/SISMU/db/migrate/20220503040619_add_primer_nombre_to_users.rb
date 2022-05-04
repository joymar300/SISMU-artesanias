class AddPrimerNombreToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :nombre, :string
    
    add_column :users, :apellido, :string
 
  end
end
