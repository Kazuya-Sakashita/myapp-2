class UsersController < ApplicationController

before_action :ensure_correct_user, {only: [:edit, :update]}

protect_from_forgery


def ensure_correct_user
if @current_user.id != params[:id].to_i    
redirect_to("/posts/index")
end
end



def index
@users = User.all
end

def show
@user = User.find_by(id: params[:id])
end

def new
@user= User.new
end

def create
@user = User.new(
name: params[:name], 
email: params[:email],
password: params[:password],
password_reconfirmation: [:password_reconfirmation],
)
if @user.save
session[:user_id] = @user.id
redirect_to("/users/show/#{@user.id}")
end 
end

def login_form
end


def login
@user = User.find_by(
email: params[:email],
password: params[:password],
)
if @user
session[:user_id] = @user.id  
redirect_to("/users/show/")

end
end


def logout
session[:user_id] = nil
redirect_to("/")
end

end

