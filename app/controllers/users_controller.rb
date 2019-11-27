class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(
      username:              params[:user][:username],
      email:                 params[:user][:email],
      password:              params[:user][:password],
      password_confirmation: params[:user][:password_confirmation]
    )

    if @user.save
      set_login_cookie(@user)

      @user = User.new
      flash[:success] = 'user created'
    else
      flash[:error] = @user.errors.full_messages.to_sentence
    end

    render :new
  end

  def logout
    authorize User
    cookies.delete :forum_account
    redirect_to root_path
  end

  def login
    authorize User
    @user = User.new
  end

  def login_perform
    authorize User
    @user = User.find_by(username: params[:user][:username])

    if @user.try(:authenticate, params[:user][:password])
      set_login_cookie(@user)
      flash.now[:success] = 'logged in'
    else
      flash.now[:error] = 'invalid credentials'
    end

    render :login
  end

  private

  def set_login_cookie(user)
    cookies.encrypted.permanent[:forum_account] = {
      value: JSON.generate({ user_id: user.id, lifetime: 7.days.from_now }),
      secure: Rails.env.production?
    }
  end
end
