class Event < ActiveRecord::Base
  include PgSearch
  multisearchable :against => [:first_name, :last_name, :dob, :ssn, :address, :zip]

  validates_format_of :ssn, :with => /\A\d{3}(|-)\d{2}(|-)\d{4}\z/

  attr_accessible :address, :description, :dob, :first_name, :last_name, :ssn, :user_id, :zip

  belongs_to :user

  #default_scope where(:order => 'created_at DESC')

  validates_presence_of :user_id, :first_name, :last_name, :dob, :ssn

  def name
    "#{first_name} #{last_name}"
  end

end
