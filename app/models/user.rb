class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name
  validates_uniqueness_of :name, :email, :ssn, :case_sensitive => false

  attr_accessible :name, :ssn, :address, :dob, :email, :password, :password_confirmation, :remember_me
end
