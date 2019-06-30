class CreateUserAccessTokens < ActiveRecord::Migration[5.2]
  def change
    create_table :user_access_tokens do |t|
      t.references :user, foreign_key: true
      t.string :access_token, null: false

      t.timestamps
    end

    add_index :user_access_tokens, :user, unique: true
  end
end
