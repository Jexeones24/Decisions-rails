class OutcomeSerializer < ActiveModel::Serializer
  attributes :id, :content, :decision_id, :opinions


  def opinions
    object.opinions
  end
end
