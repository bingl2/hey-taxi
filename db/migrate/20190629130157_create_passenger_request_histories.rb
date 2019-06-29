class CreatePassengerRequestHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :passenger_request_histories do |t|
      t.references :passenger_request, foreign_key: true
      t.string :status
      t.string :description

      t.timestamps
    end
  end
end
