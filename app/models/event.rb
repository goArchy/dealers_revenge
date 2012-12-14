class Event < ActiveRecord::Base
  include PgSearch
  multisearchable :against => [:name, :dob, :ssn, :address, :zip]

  attr_accessible :address, :description, :dob, :name, :ssn, :user_id, :zip

  belongs_to :user

  validates_presence_of :user_id, :name, :dob, :ssn
end
