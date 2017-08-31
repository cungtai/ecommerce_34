class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name, null: true
      t.string :email
      t.string :avatar, null: true
      t.string :phone, null: true
      t.string :address, null: true
      # t.string :password_digest
      t.integer :role, default: Settings.default.role.user
      t.string :activate_token, null: true
      t.string :remember_token, null: true
      t.boolean :is_activated, default: Settings.default.user.not_activated

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
