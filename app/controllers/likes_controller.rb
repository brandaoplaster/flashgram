class LikesController < ApplicationController
  before_action :set_like, only: %i[destroy]

  def create
    like = current_user.likes.build(like_params)
    
    if like.save
      render json: { successful: true, id: like.id }
    else
      render json: { successful: true }
    end
  end

  def destroy
    render json: { successful: @like.destroy }
  end

  private

  def like_params
    params.require(:like).permit(:post_id)    
  end

  def set_like
    @like = current_user.likes.find(params[:id])
  end
end
