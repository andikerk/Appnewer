class User < ApplicationRecord

	has_many :orders
	has_many :comments

	validates :username, presence: true
	validates :email, presence: true
#	validates :password, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	
end
