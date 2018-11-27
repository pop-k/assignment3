class Book < ApplicationRecord

	belongs_to :user

	validates :body, presence: true,
  length: {maximum: 200}

  validates :name, presence: true


end
