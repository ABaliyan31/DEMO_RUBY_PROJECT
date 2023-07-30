class CommentsController < ApplicationController
def new
  @micropost = Micropost.find(params[:micropost_id])
  @comment = @micropost.comments.new(parent_id: params[:parent_id])
  @parent_id = @comment.parent_id
end
def create
  if current_user == nil
    redirect_to login_url
  else
  @micropost = Micropost.find(params[:micropost_id])
  Comment.create!(comment: params[:comment][:comment], micropost_id: params[:micropost_id], parent_id: params[:comment][:parent_id], user_id: params[:comment][:user_id])
 redirect_to micropost_path(@micropost)
  end
end
end
