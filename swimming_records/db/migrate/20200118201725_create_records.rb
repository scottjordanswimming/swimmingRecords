class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :event
      t.time :time
      t.string :swimmer
      t.integer :user_id
      t.integer :years_id
  end
end
end
