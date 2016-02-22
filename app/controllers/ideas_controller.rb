class IdeasController < ApplicationController
  before_action :find_idea, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user, except: [:index, :show]

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new idea_params
    @idea.user = current_user
    if @idea.save
      flash[:notice] = "Idea created successfully"
      redirect_to idea_path(@idea), notice: "Idea has been created!"
    else
      flash.now[:alert] = "Idea wasn't created. Check errors below"
      render :new
    end
  end

  def index
    @results = Idea.order("created_at DESC")
    @ideas = @results.paginate(page: params[:page], :per_page => 5)
  end

  def show
    # @comment = Comment.new
  end

  def edit
  end

  def update
    if @idea.update idea_params
      redirect_to idea_path(@idea), notice: "Idea has been updated!"
    else
      flash.now[:alert] = "Idea could not be updated!"
      render :edit
    end
  end

  def destroy
    @idea.destroy
    redirect_to ideas_path, alert: "Idea has been removed!"
  end

  private

  def find_idea
    @idea = Idea.find params[:id]
  end

  def idea_params
    params.require(:idea).permit([:title, :body])
  end

end
