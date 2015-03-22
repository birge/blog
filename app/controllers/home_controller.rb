class HomeController < ApplicationController
  def home
    @entries = Entry.all
  end

  def about
  end
end
