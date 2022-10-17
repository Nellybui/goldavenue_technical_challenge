class AddWealthToJewelers < ActiveRecord::Migration[7.0]
  def change
    add_column :jewelers, :wealth, :decimal, null: false, default: 0
  end
end
