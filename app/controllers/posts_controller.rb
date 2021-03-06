class PostsController < ApplicationController  

def index
@posts = Post.all.order(created_at: :desc)
end


def show
@post = Post.find_by(id: params[:id])
@user = @post.user
end

def new
@post = Post.new
end

def create
@post = Post.new(
title: params[:title], 
content: params[:content],
user_id: @current_user.id
)





if @post.save
redirect_to("/posts/index")
else
render("posts/new")
end
end


  def edit
   @post = Post.find_by(id: params[:id]) 
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.title = params[:title]
    @post.content = params[:content]
    if @post.save
    redirect_to("/posts/index")
    else
    render("posts/edit")  
  end
end


 def destroy
   @post = Post.find_by(id: params[:id]) 
   @post.destroy
   redirect_to("/posts/index") 
 end
end
