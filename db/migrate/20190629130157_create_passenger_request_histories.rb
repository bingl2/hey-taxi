class CreatePassengerRequestHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :passenger_request_histories do |t|
      t.references :passenger_request, foreign_key: true
      t.string :status, null: false
      t.string :description
      t.string :use_yn, :limit => 1, null: false, default: 'Y'

      t.timestamps
    end
  end
end
