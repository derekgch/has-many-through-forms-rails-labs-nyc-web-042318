class CommentsController < ApplicationController

  def create
    # byebug
    comment = Comment.create(comment_params)
    redirect_to comment.post
  end

  private

  def comment_params
    result = params.require(:comment).permit(:content, :post_id, :user_id, user_attributes:[:username])
    result["post_id"] = params["post_id"]
    result
  end

end
