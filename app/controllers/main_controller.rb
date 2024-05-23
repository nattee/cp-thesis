class MainController < ApplicationController
  layout "blank", only: [:login]
  def login
    @announcements = Announcement.where(available: true).all
  end

  # post main/login
  def do_login
    user = User.where(login: params[:login]).first&.authenticate(params[:password])
    unless user
      redirect_to main_login_path, alert: 'Wrong username or password'
      return
    end

    session[:user_id] = user.id

    home

  end


  #
  # series of homes
  def student

  end

  def staff

  end

  def faculty
  end


  def home
    if current_user
      redirect_to main_student_path if current_user.role_student?
      redirect_to main_staff_path if current_user.role_staff?
      redirect_to main_faculty_path if current_user.role_faculty?
    else
      redirect_to main_login_path
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end


end
