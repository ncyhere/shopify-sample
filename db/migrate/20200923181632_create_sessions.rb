class CreateSessions < ActiveRecord::Migration[6.0]
  def self.up
    create_table :sessions do |t|
      t.string :shopify_session_id, null: false
      t.string :shopify_domain, null: false
      t.string :shopify_token, null: false
      t.bigint :shopify_user_id, null: false
      t.datetime :shopify_token_expires_at, null: false

      t.timestamps
    end

    add_index :sessions, :shopify_session_id, unique: true
    add_foreign_key :sessions, :users, column: :shopify_user_id, primary_key: "shopify_user_id", on_delete: :cascade
  end

  def self.down
    drop_table :sessions
  end
end