class Event < ActiveRecord::Base
  include PgSearch
  multisearchable :against => [:first_name, :last_name, :dob, :ssn, :address, :zip]

  attr_accessible :address, :description, :dob, :first_name, :last_name, :ssn, :user_id, :zip

  belongs_to :user

  default_scope order: 'events.created_at DESC'

  validates_presence_of :user_id, :first_name, :last_name, :dob, :ssn

  def name
    "#{first_name} #{last_name}"
  end

end
