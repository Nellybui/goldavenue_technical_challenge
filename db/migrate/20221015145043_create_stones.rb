class CreateStones < ActiveRecord::Migration[7.0]
  def change
    create_table :stones do |t|
      t.string :name
      t.decimal :price
      t.integer :jewel_id
      t.integer :stone_type_id

      t.timestamps
    end
  end
end
