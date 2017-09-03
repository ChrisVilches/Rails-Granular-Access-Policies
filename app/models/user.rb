class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  belongs_to :role

  has_many :articles

  def permission?(permission)
    role.permissions.any? { |p| p.symbol.upcase == permission }
  end

end
