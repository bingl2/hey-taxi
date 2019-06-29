class CreateDrivers < ActiveRecord::Migration[5.2]
  def change
    create_table :drivers do |t|
      t.references :user, foreign_key: true
      t.string :belong

      t.timestamps
    end
  end
end
