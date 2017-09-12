class OutcomeSerializer < ActiveModel::Serializer
  attributes :id, :content, :decision_id, :opinions, :values
  has_many :opinions

end
