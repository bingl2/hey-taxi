class CreatePassengerRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :passenger_requests do |t|
      t.references :passenger, foreign_key: true
      t.references :driver, foreign_key: true
      t.string :destination

      t.timestamps
    end
  end
end
