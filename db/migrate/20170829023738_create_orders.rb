class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.references :payment, foreign_key: true
      t.string :receiver_name
      t.string :receiver_email
      t.string :receiver_phone
      t.decimal :amount, default: 0
      t.string :message
      t.integer :status, default: Settings.default.order.waiting

      t.timestamps
    end
  end
end
