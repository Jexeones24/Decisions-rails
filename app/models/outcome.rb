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

  def values
    values = []
    opinions = self.opinions
    opinions.map do |o|
      values << o.value
    end
    values
  end


end
