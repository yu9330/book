class Book < ApplicationRecord
  belongs_to :user
  ratyrate_rateable "read"
end
