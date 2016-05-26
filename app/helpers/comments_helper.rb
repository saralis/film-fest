module CommentsHelper
  def get_flagged_comments_amount
    comments = Comment.where( flag: true )
    comments.length
  end
end
