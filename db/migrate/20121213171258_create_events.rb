class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :user_id
      t.string :name
      t.string :address
      t.datetime :dob
      t.integer :ssn
      t.string :description

      t.timestamps
    end
  end
end
