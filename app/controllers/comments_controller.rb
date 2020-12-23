class CommentsController < ApplicationController


  def create
    # comment_params[:user_id].each do |id|
    #   if id != ""
    #     @user = User.find_by(id: id)
    #   end
    # end
    # if !@user
    #   @user = User.create(username: comment_params[:user][:username])
    # end
    # @comment = Comment.new(content: comment_params[:content], user_id: @user.id, post_id: comment_params[:post_id])
    # if @comment.save
    #   redirect_to post_path(@comment.post)
    # else
    #   render "new"
    # end

    comment = Comment.create(comment_params)
    redirect_to comment.post
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id, user_attributes: [:username])
  end

end
