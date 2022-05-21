class CreateJoinTableColorsDetalless < ActiveRecord::Migration[7.0]
  def change
    create_join_table :colors, :detalles do |t|
      t.index [:color_id, :detalle_id]
      t.index [:detalle_id, :color_id]
    end
  end
end
