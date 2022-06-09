class CreateJoinTableColorsEmdetalles < ActiveRecord::Migration[7.0]
  def change
    create_join_table :colors, :emdetalles do |t|
       t.index [:color_id, :emdetalle_id]
       t.index [:emdetalle_id, :color_id]
    end
  end
end
