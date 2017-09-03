class Permission < ApplicationRecord

  has_and_belongs_to_many :roles

  validates :title, presence: true, uniqueness: true
  validates :symbol, presence: true, length: { maximum: 32 }, uniqueness: true

end
