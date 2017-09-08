class Decision < ApplicationRecord
  belongs_to :user
  has_many :outcomes :dependent => :destroy

  # decision id
  def outcomes
    all_outcomes = Outcome.all
    outcomes = all_outcomes.select do |o|
      o.decision_id == self.id
    end
    outcomes.flatten
  end

  def outcome_opinions(outcomes)
    opinions = []
    outcomes.map do |o|
      opinions.push(o.opinions)
    end
    opinions.flatten
  end
end
