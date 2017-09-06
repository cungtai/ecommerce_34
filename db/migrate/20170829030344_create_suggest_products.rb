class CreateSuggestProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :suggest_products do |t|
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true
      t.string :image, null: true
      t.string :name
      t.text :description
      t.decimal :price, default: 0
      t.integer :status, default: Settings.default.suggest_product.waiting
      t.integer :catalog_id

      t.timestamps
    end
  end
end
