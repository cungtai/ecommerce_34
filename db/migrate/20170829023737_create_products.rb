class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.references :user, foreign_key: true
      t.references :catalog, foreign_key: true
      t.string :name
      t.text :content
      t.integer :qty
      t.decimal :current_price, default: 0
      t.datetime :expired_date
      t.integer :viewed, default: 0
      t.string :tag

      t.timestamps
    end
  end
end
