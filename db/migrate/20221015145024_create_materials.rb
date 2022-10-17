class CreateMaterials < ActiveRecord::Migration[7.0]
  def change
    create_table :materials do |t|
      t.string :name
      t.decimal :base_cost
      t.integer :jewel_id
      t.integer :material_type_id

      t.timestamps
    end
  end
end
