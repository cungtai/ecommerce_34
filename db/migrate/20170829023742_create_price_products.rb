class CreatePriceProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :price_products do |t|
      t.references :product, foreign_key: true
      t.references :user, foreign_key: true
      t.decimal :price
      t.datetime :from_date
      t.datetime :to_date

      t.timestamps
    end
  end
end
