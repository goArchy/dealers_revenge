class ChangeIntegerToStringOnEvents < ActiveRecord::Migration
  def change
    change_column :events, :ssn, :string
  end
end
