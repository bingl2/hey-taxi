class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, null: false
      t.string :password, null: false
      t.string :phone_number
      t.string :type, null: false

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
