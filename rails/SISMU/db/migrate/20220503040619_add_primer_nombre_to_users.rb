class AddPrimerNombreToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :primernombre, :string
    add_column :users, :segundonombre, :string
    add_column :users, :primerapellido, :string
    add_column :users, :segundoapellido, :string
    
    
  end
end
