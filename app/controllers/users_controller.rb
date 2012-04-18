class UsersController < ApplicationController
    before_filter :authenticate, :only => [:edit, :update]
    before_filter :correct_user, :only => [:edit, :update]

  def show
    @user  = User.find(params[:id])
    @title = @user.name 
  end
  def new
    @title = "Sign up"
    @user = User.new
  end
  ###
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Welcome to the  Sample App!"
      redirect_to @user
    else
      @title = "Sign up"
      render 'new'
    end
  end
  ###
  def edit
   ## raise request.inspect
    @user  = User.find(params[:id])
    @title = "Edit user"
  end
  ###
  def update
    @user  = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to @user, :flash => {:success => "Profile updated." }
    else
      @title = "Edit user"
      render 'edit'
    end 
  end
  ###
  
  private
    def authenticate
        deny_access unless signed_in?
    end
    ###
    def correct_user
      @user =User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
    
end
