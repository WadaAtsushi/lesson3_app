class CommentsController < ApplicationController
    def create
        @comment = Comment.new(params_comment)
        @comment.user_id = @current_user.id
        @comment.save
        # redirect_to posts_show_path(@comment.post.id)
    end

    private

    def params_comment
        params.require(:comment).permit(:body, :post_id)
    end

end
