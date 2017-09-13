class Outcome < ApplicationRecord
  belongs_to :decision
  has_many :opinions, dependent: :destroy

  def opinions
    all_opinions = Opinion.all
    opinions = all_opinions.select do |o|
      o.outcome_id == self.id
    end
    opinions
  end


  def pros
    opinions = self.opinions
    pros = opinions.select do |o|
      o.value === true
    end
    pros.count
  end

  def cons
    opinions = self.opinions
    cons = opinions.select do |o|
      o.value === false
    end
    cons.count
  end


end
