class CreateDoses < ActiveRecord::Migration[6.0]
  def change
    create_table :doses do |t|
      t.string :description
      t.integer :cocktail_id, null: false
      t.integer :ingredient_id, null: false

      t.timestamps
      t.index [:cocktail_id], name: :index_doses_on_cocktail_id
      t.index [:ingredient_id], name: :index_doses_on_ingredient_id
    end

  add_foreign_key :doses, :cocktails
  add_foreign_key :doses, :ingredients
  end
end
