class CommentsController < ApplicationController

  def index
    # render json: Comment.all
    if params[:user_id].nil? && params[:artwork_id].nil?
      comments = User.find(params[:user_id]).comments
      render json: comments
    elsif params[:user_id].nil? && !params[:artwork_id].nil?
      comments = Artwork.find(params[:artwork_id]).comments
      render json: comments
    # else
    #   render json: comments.errors.full_messages, status: 422
    end

  end

  def create
    comment = Comment.new(comment_params)
    if comment.save!
      render json: comment
    else
      render json: comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    comment = User.find(params[:id])
    comment.destroy
    render json: comment
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id, :artwork_id)
  end

end