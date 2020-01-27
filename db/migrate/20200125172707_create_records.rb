class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :swimmer
      t.string :event
      t.integer :time
      t.date :year
      t.integer :user_id
  end
  end
end
