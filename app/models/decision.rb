class Decision < ApplicationRecord
  belongs_to :user
  has_many :outcomes, dependent: :destroy

  def pros
    outcomes = self.outcomes
    all_pros = outcomes.map do |o|
      o.pros
    end
    all_pros.reduce(:+)
  end

  def cons
    outcomes = self.outcomes
    all_cons = outcomes.map do |o|
      o.cons
    end
    all_cons.reduce(:+)
  end

  def date_time
    self.created_at.strftime("%B %e, %Y at %I:%M %p")
  end

end
