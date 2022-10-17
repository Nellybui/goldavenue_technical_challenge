class CreateJewels < ActiveRecord::Migration[7.0]
  def change
    create_table :jewels do |t|
      t.string :name
      t.decimal :price
      t.integer :jeweler_id

      t.timestamps
    end
  end
end
