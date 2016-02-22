class LikesController < ApplicationController
  before_action :authenticate_user

  def index
    @likes = current_user.liked_ideas
  end

  def create
    i = Idea.find params[:idea_id]
    like = Like.new(idea: i, user: current_user)
    if like.save
      # AnswersMailer.notify_idea_owner(like).deliver_later
      redirect_to i, notice: "Idea has been tagged as your liked idea"
    else
      redirect_to i, flash.now[:alert] = "Could not be tagged as your liked idea"
    end
  end

  def destroy
    i = Idea.find params[:idea_id]
    lik = current_user.likes.find params[:id]
    lik.destroy
    redirect_to idea_path(i), notice: "Idea has been untagged"
  end
end
