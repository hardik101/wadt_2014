class StagesController < ApplicationController


	def index 

		@stages = Stage.all

		respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @stages }
        end

	end 

	def create 

	end 

	def update 



	end

	def show 


	end 

	def destroy 


	end 


end
