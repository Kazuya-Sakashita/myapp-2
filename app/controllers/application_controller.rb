class ApplicationController < ActionController::Base

before_action :set_current_user
def set_current_user
@current_user = User.find_by(id: session[:user_id])
end
    

def index
@users = User.all
@user = User.find(params[:id])
end




end
