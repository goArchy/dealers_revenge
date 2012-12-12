class AddAddressAndSsnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :address, :string
    add_column :users, :ssn, :integer
  end
end
