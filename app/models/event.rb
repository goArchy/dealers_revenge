class Event < ActiveRecord::Base
  include PgSearch
  multisearchable :against => [:name, :dob, :ssn, :address]

  attr_accessible :address, :description, :dob, :name, :ssn, :user_id

  belongs_to :user

  validates :user_id, :name, :dob,  presence: true
end
