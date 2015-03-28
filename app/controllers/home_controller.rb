class HomeController < ApplicationController
  def home
    if params[:tag]
      @entries = Tag.find_by(tagType: params[:tag]).entries.paginate(page: params[:page], per_page: 5).order('created_at DESC')
    else
      @entries = Entry.paginate(page: params[:page], per_page: 5).order('created_at DESC')
    end
  end

  def about
  end

  def wrong_url
    redirect_to root_path
  end
end