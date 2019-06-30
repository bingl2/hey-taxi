class CreateAccessTokens < ActiveRecord::Migration[5.2]
  def change
    create_table :access_tokens do |t|
      t.references :user, foreign_key: true, index: {unique: true}
      t.string :access_token, null: false

      t.timestamps
    end
  end
end
