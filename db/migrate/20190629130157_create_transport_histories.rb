class CreateTransportHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :transport_histories do |t|
      t.references :transport, foreign_key: true
      t.string :status, null: false
      t.string :description
      t.string :use_yn, :limit => 1, null: false, default: 'Y'

      t.timestamps
    end
  end
end
