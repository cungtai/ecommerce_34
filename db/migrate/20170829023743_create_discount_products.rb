class CreateDiscountProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :discount_products do |t|
      t.references :product, foreign_key: true
      t.references :user, foreign_key: true
      t.decimal :discount
      t.datetime :from_date
      t.datetime :to_date

      t.timestamps
    end
  end
end
