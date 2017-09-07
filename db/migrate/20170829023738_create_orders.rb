class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true, default: 1
      t.references :payment, foreign_key: true, default: 1
      t.string :receiver_name, null: true
      t.string :receiver_email, null: true
      t.string :receiver_phone, null: true
      t.decimal :amount, default: 0
      t.string :message
      t.integer :status, default: Settings.default.order.created

      t.timestamps
    end
  end
end
