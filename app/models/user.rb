class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :cart, dependent: :destroy
	has_many :orders, dependent: :destroy


  # Setting customer/admin roles without using the integer [0;1] defined in the seed.rb
  enum role: [:customer, :admin]
  after_initialize :set_default_role, :if => :new_record?

  private

  def set_default_role
    self.role ||= :user
  end 
end
