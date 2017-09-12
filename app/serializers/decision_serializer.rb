class DecisionSerializer < ActiveModel::Serializer
  attributes :id, :content, :outcomes
  has_many :outcomes
end
