class Decision < ApplicationRecord
  belongs_to :user
  has_many :outcomes
end
