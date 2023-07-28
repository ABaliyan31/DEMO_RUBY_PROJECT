class CommentsController < ApplicationController
def new
  @micropost = Micropost.find(params[:micropost_id])
  @comment = @micropost.comments.new(parent_id: params[:parent_id])
  @parent_id = @comment.parent_id
end
def create
  @micropost = Micropost.find(params[:micropost_id])
  Comment.create!(comment: params[:comment][:comment], micropost_id: params[:micropost_id], parent_id: params[:comment][:parent_id])
 redirect_to micropost_path(@micropost)
end

private
def comment_params
  params.require(:comment, :micropost_id).permit(:micropost_id, :comment)
end

end
