def create_notification_comment!(current_user,comment_id)
  temp_ids = Comment.select(:user_id).where(post_id: id).where.not(user_id: current_user).distinct
  temp_ids.each do |temp_id|
    save_notification_comment!(current_user, comment_id, temp_id['user_id'])
  end
  save_notification_comment!(current_user, comment_id, user_id) if temp_ids.blank?
end

def save_notification_comment!(current_user, comment_id, visited_id)
  notification = current_user.active_notifications.new(
    post_id: id,
    comment_id: comment_id,
    visited_id: visited_id,
    action: 'comment'
  )
  if notification.visiter_id == notification.visited_id
    notification.checked = true
  end
  notification.save if notification.valid?
end
