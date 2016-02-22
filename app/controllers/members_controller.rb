class MembersController < ApplicationController
  before_action :authenticate_user

  def index
    @members = current_user.user_ideas
  end

  def create
    i = Idea.find params[:idea_id]
    member = Member.new(idea: i, user: current_user)
    if member.save
      redirect_to i, notice: "You have joined the Idea"
    else
      redirect_to i, flash.now[:alert] = "You could not join the idea because of an error"
    end
  end

  def destroy
    i = Idea.find params[:idea_id]
    mem = current_user.members.find params[:id]
    mem.destroy
    redirect_to idea_path(i), notice: "You have dropped out of the idea"
  end
end
