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
      cookies.encrypted.permanent[:forum_account] = {
        value: JSON.generate({ user_id: @user.id, lifetime: 7.days.from_now }),
        secure: Rails.env.production?
      }

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
end
