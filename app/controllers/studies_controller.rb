class StudiesController < ApplicationController

	def new
		require_user
		@user = current_user
		@study = Study.new
		@studies = Study.all.sort_by &:updated_at
	end

	def create
		@study = Study.new(study_params)
		@study.user = current_user
		if @study.save
			flash[:success] = "You made it!"
			redirect_to '/cloud_of_witnesses'
		else
			flash[:danger] = "Uh oh—something went wrong"
			redirect_to study_path
		end
	end

	def edit
	end

	def update
		@study = Study.find(session[:study_id])
		if @study.update_attributes(study_params)
			flash[:success] = "You made it!"
			#successful update
			redirect_to '/cloud_of_witnesses'
		else
			flash[:danger] = "Oh no! Your study could not be saved."
			render 'edit'
		end
		
	end

	def destroy
		@study = Study.find(params[:study_id])
		@study.destroy
		redirect_to study_path
	end

	private
	def study_params
		params.inspect
		params.require(:study).permit( :title, :user_id )
	end
end