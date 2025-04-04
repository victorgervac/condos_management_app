class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: { "admin": 0, "owner": 1, "guest": 2 }

  def name
    "#{self.first_name} #{self.last_name}"
  end
end
