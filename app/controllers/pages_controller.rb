class PagesController < ApplicationController
	def home
		redirect_to study_path if logged_in?
	end

	def cloud_of_witnesses
		#show a random recording of saints shouting "Praise the Lord!"
	end

	def about
	end

	def how_to

	end
end