class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @groups = Group.all
    respond_with(@groups)
  end

  def show
    respond_with(@group)
  end

  def new
    @group = Group.new
    respond_with(@group)
  end

  def edit
  end

  def create
    @group = Group.new(group_params)     
    respond_to do |format|
      if @group.save
        format.json { render json: @group, status: :ok }
      else
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end    
  end

  def update
    @group.update(group_params)
    respond_with(@group)
  end

  def destroy 
    @group.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    def set_group
      @group = Group.find(params[:id])
    end

    def group_params
      params.require(:group).permit(:name, :user_id)
    end
end
