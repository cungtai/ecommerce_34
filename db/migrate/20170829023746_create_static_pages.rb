class CreateStaticPages < ActiveRecord::Migration[5.1]
  def change
    create_table :static_pages do |t|
      t.references :user, foreign_key: true
      t.string :key
      t.text :value

      t.timestamps
    end
  end
end
