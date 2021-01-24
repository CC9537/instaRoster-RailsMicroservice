class User < ApplicationRecord
  enum phone_type: [:mobile, :landline]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  has_one :user_address, dependent: :destroy
  accepts_nested_attributes_for :user_address

  def with_address
    build_user_address if if user_address.nil?
      self
    end
  end
end
