def create
  @comment = Comment.new(params_comment)
  @post = @comment.post
  @comment.user_id = current_user.id
  if @comment.save
    @post.create_notification_comment!(current_user, @comment.id)
    redirect_back(fallback_location: root_path, notice: '投稿が完了しました。')
  else
    redirect_back(fallback_location: root_path, notice: '投稿に失敗しました。')
  end
end
