class CommentsController < ApplicationController
  http_basic_authenticate_with name: "denise", password: "geheim", only: :destroy

  def create
    @toy = Toy.find(params[:toy_id])
    @comment = @toy.comments.create(comment_params)
    redirect_to toy_path(@toy)
  end

  def destroy
    @toy = Toy.find(params[:toy_id])
    @comment = @toy.comments.find(params[:id])
    @comment.destroy
    redirect_to toy_path(@toy)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end