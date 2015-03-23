class HomeController < ApplicationController
  def home
    @entries = Entry.all
  end

  def about
  end

  def wrong_url
    redirect_to root_path
  end
end