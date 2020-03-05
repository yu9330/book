class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :books

  has_many :favorites

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ratyrate_rater

  validates :name, presence: true
end
