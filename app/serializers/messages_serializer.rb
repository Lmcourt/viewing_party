class MessagesSerializer < ActiveModel::Serializer
  attributes :id, :body, :written_at, :user_email
  belongs_to :user, serializer: UsersSerializer

  def written_at
    object.created_at.strftime('%H:%M:%S %d %B %Y')
  end

  def user_email
    object.user.email
  end
end
