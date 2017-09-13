class OutcomeSerializer < ActiveModel::Serializer
  attributes :id, :content, :decision_id, :opinions, :pros, :cons
  has_many :opinions

end
