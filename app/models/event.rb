class Event < ActiveRecord::Base
  attr_accessible :address, :description, :dob, :name, :ssn, :user_id

  belongs_to :user

  validates :user_id, presence: true
end
