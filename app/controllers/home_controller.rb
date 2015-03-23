class HomeController < ApplicationController
  def home
    @entries = Entry.paginate(page: params[:page], per_page: 5).order('created_at DESC')
  end

  def about
  end

  def wrong_url
    redirect_to root_path
  end
end