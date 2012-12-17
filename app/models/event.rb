class Event < ActiveRecord::Base
  include PgSearch
  multisearchable :against => [:name, :dob, :ssn, :address, :zip]

  attr_accessible :address, :description, :dob, :name, :ssn, :user_id, :zip

  belongs_to :user

  default_scope order: 'events.created_at DESC'

  validates_presence_of :user_id, :name, :dob, :ssn
end
