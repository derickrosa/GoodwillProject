class ApplicationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_application, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @applications = Application.all
    respond_with(@applications)
  end

  def feed
    @records = Record.where(volunteer_id:current_user, status:false)
    @records.each do |record|
      @requests << Application.where(id:record.request_id).first
    end
    raw_posts=[]
    @friendships = Friendship.where(contact_id:current_user.id)
    @friendships.each do |friendship|
      @applications =[]
      @applications = Application.where(["volunteers_number = ? and applicant_id = ?", friendship.category, friendship.user_id])
      @applications.each do |application|
        @record = Record.where(volunteer_id:current_user.id)
        if !@record.blank?
          raw_posts << application
        end
        
      end
    end

    @posts = []
    raw_posts.each do |post|
      post_and_user_and_category = {post:post, user: User.find(post.applicant_id),category:Category.find(post.category_id)}
      @posts << post_and_user_and_category
    end
    
  end

  def show
    respond_with(@application)
  end

  def new
    @application = Application.new
    respond_with(@application)
  end

  def edit
  end

  def create
    @application = Application.new(application_params)    

    respond_to do |format|
      if @application.save
        format.json { render json: @application, status: :ok }
        Privacy.create(request_id: @application.id, group_id: @application.group_id)
      else
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end 
  end

  def update
    @application.update(application_params)
    respond_with(@application)
  end

  def destroy
    @application.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end 

  private
    def set_application
      @application = Application.find(params[:id])
    end

    def application_params
      params.require(:application).permit(:applicant_id, :title, :description, :category_id, :request_date, :status, :volunteers_number, :group_id)
    end
end
