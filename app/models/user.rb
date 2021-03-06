class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_uniqueness_of :email, :case_sensitive => false

  attr_accessible  :email, :password, :password_confirmation, :remember_me, :name, :confirmable

  validates_presence_of :name, :email, :password

  has_many :events
end
