class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :avatar
      t.string :phone
      t.string :address
      t.string :password_digest
      t.integer :role, default: Settings.default.role.user
      t.string :activate_token
      t.string :remember_token
      t.boolean :is_activated, default: Settings.default.user.not_activated

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
