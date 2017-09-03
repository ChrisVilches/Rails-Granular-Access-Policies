class Article < ApplicationRecord

  belongs_to :user
  validates :text, length: { minimum: 5, message: "El texto es demasiado corto." }

end
