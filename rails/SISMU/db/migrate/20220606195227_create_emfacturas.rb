class CreateEmfacturas < ActiveRecord::Migration[7.0]
  def change
    create_table :emfacturas do |t|
      t.string :emfref
      t.decimal :total
      t.references :empresa, null: false, foreign_key: true
      t.date :fechafin
      
      t.timestamps
    end
  end
end
