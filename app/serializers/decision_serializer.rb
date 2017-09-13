class DecisionSerializer < ActiveModel::Serializer
  attributes :id, :content, :outcomes, :pros, :cons, :date_time
  has_many :outcomes
end
