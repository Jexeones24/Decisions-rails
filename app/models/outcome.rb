class Outcome < ApplicationRecord
  belongs_to :decision
  has_many :opinions

  def opinions
    all_opinions = Opinion.all
    opinions = all_opinions.select do |o|
      o.outcome_id == self.id
    end
    opinions
  end

end
