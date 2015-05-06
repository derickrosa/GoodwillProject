class FriendshipsController < ApplicationController
  before_action :set_friendship, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @friendships = Friendship.all
    respond_with(@friendships)
  end

  def show
    respond_with(@friendship)
  end

  def new
    @friendship = Friendship.new
    respond_with(@friendship)
  end

  def edit
  end

  def create
    @friendship = Friendship.new(friendship_params)    
    respond_to do |format|
      if @friendship.save
        format.json { render json: @friendship, status: :ok }
      else
        format.json { render json: @friendship, status: :unprocessable_entity }
      end
    end 
  end

  def update
    @friendship.update(friendship_params)
    respond_with(@friendship)
  end

  def destroy
    @friendship.destroy
    respond_with(@friendship)
  end

  private
    def set_friendship
      @friendship = Friendship.find(params[:id])
    end

    def friendship_params
      params.require(:friendship).permit(:user_id, :contact_id, :category)
    end
end
