class AddDeviseToUsers < ActiveRecord::Migration[5.1]
  def self.up
    change_table :users do |t|
      ## Database authenticatable
      # t.string :email, null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token, null: true
      t.datetime :reset_password_sent_at, null: true

      ## Rememberable
      t.datetime :remember_created_at, null: true

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: true
      t.datetime :current_sign_in_at, null: true
      t.datetime :last_sign_in_at, null: true
      t.string   :current_sign_in_ip, null: true
      t.string   :last_sign_in_ip, null: true

      ## Confirmable
      # t.string   :confirmation_token, null: true
      # t.datetime :confirmed_at, null: true
      # t.datetime :confirmation_sent_at, null: true
      # t.string   :unconfirmed_email, null: true # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: true # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token, null: true # Only if unlock strategy is :email or :both
      # t.datetime :locked_at, null: true


      # Uncomment below if timestamps were not included in your original model.
      # t.timestamps null: false
    end

    # add_index :users, :email,                unique: true
    # add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end

  def self.down
    # By default, we don't want to make any assumption about how to roll back a migration when your
    # model already existed. Please edit below which fields you would like to remove in this migration.
    raise ActiveRecord::IrreversibleMigration
  end
end
