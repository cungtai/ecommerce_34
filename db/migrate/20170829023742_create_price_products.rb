class CreatePriceProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :price_products do |t|
      t.references :product, foreign_key: true
      t.references :user, foreign_key: true
      t.decimal :price, default: 0
      t.datetime :from_date
      t.datetime :expired_date

      t.timestamps
    end
  end
end
