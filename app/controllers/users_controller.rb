class UsersController < ApplicationController
	before_action :authenticate_user!
	def index		
	end
	def search_user
		@first_name = params[:first_name]
		@last_name = params[:last_name]
		@relevant_results = User.all.where("first_name like ? AND last_name like?", "%#{@first_name}%", "%#{@last_name}%")
	end

	def profile				
		@user = User.where(id:params[:user_id]).first	
		
		@relation = Friendship.where(user_id:current_user.id, contact_id:@user.id)
		
		raw_groups = Group.where(user_id:@user.id)
		@groups = []

		raw_groups.each do |group|
			contacts=[]
			@relations = Friendship.where(user_id:@user.id, category:group.id)
			@relations.each do |relation|
				contacts << User.where(id:relation.contact_id).first
			end
			group_and_contacts = {group:group, contacts:contacts}
			@groups << group_and_contacts
		end
		@user_groups=[]
		@user_groups = Group.where(user_id:current_user.id)

		raw_posts = Application.where(applicant_id:@user.id).order("created_at DESC")
		@posts = []
		raw_posts.each do |post|
			post_and_category = {post:post, category:Category.find(post.category_id)}
			@posts << post_and_category
		end
	end
	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :gender, :birthdate, :encrypted_password, :points)
	end
	def new
	end
end
