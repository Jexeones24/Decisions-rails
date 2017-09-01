class Outcome < ApplicationRecord
  belongs_to :decision
  has_many :opinions
end
