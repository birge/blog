class HomeController < ApplicationController
  def home
    @entries = Entry.all
  end
end
