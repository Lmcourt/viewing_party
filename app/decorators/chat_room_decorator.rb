class ChatRoomDecorator < Draper::Decorator
  delegate_all

  def owner
    object.user.email
  end

  def created_at
    object.created_at.strftime("%d/%m/%Y")
  end
end
