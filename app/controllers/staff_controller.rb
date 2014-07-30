class StaffController < ApplicationController
		 before_action :set_user, only: [:show, :edit, :update, :destroy]


	def index
		@staff = Staff.all
	end





end
