class CreateTransports < ActiveRecord::Migration[5.2]
  def change
    create_table :transports do |t|
      t.references :passenger, index: true, foreign_key: {to_table: :users}
      t.references :driver, index: true, foreign_key: {to_table: :users}
      t.string :destination, null: false

      t.timestamps
    end
  end
end
