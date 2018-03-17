class Genre < ApplicationRecord

  validates :title, presence: true

  has_many :users_genres, dependent: :destroy
  has_many :users, through: :users_genres
end
