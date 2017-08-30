class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.references :user, foreign_key: true
      t.references :catalog, foreign_key: true
      t.string :name
      t.text :content
      t.integer :qty
      t.integer :viewed
      t.string :tag

      t.timestamps
    end
  end
end
