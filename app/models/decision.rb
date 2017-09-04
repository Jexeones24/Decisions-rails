class Decision < ApplicationRecord
  belongs_to :user
  has_many :outcomes

  # decision id
  def outcomes
    all_outcomes = Outcome.all
    outcomes = all_outcomes.select do |o|
      o.decision_id == self.id
    end
    outcomes
  end

  def outcome_opinions(outcomes)
    opinions = []
    outcomes.each do |o|
      opinions.push(o)
    end
    opinions
  end
end
