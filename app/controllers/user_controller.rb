class UserController < ApplicationController
	 before_action :set_user, only: [:show, :edit, :update, :destroy]
	def index
		@users = User.all
	end

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
	
		def destroy
    @user.destroy
  end
end
