class DecisionSerializer < ActiveModel::Serializer
  attributes :id, :content, :outcomes, :pros, :cons
  has_many :outcomes
end
