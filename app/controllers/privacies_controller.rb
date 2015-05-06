class PrivaciesController < ApplicationController
  before_action :set_privacy, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @privacies = Privacy.all
    respond_with(@privacies)
  end

  def show
    respond_with(@privacy)
  end

  def new
    @privacy = Privacy.new
    respond_with(@privacy)
  end

  def edit
  end

  def create
    @privacy = Privacy.new(privacy_params)
    @privacy.save
    respond_with(@privacy)
  end

  def update
    @privacy.update(privacy_params)
    respond_with(@privacy)
  end

  def destroy
    @privacy.destroy
    respond_with(@privacy)
  end

  private
    def set_privacy
      @privacy = Privacy.find(params[:id])
    end

    def privacy_params
      params.require(:privacy).permit(:request_id, :group_id)
    end
end
