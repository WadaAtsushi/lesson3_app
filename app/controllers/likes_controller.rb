class LikesController < ApplicationController
    def create
        @like = Like.new(
            user_id: @current_user.id,
            post_id: params[:post_id]
        )
        @like.save
        redirect_to posts_index_path
    end
    
    def destroy
        @like = Like.find_by(
            user_id: @current_user.id,
            post_id: params[:post_id]
        )
        @like.destroy
        redirect_to posts_index_path
    end
end