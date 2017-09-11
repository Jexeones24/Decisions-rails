class DecisionSerializer < ActiveModel::Serializer
  attributes :id, :content, :outcomes

  def outcomes
    object.outcomes
  end
end
