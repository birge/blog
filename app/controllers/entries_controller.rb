class EntriesController < ApplicationController
  before_action :signed_in_user

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(title: params[:entry][:title], body: params[:entry][:body])
    if @entry.valid?
      params[:entry][:spaced_tags].split(" ").each do |tag|
        newTag = Tag.find_or_create_by(tagType: tag)
        @entry.tags << newTag
      end
      @entry.save
      redirect_to root_path
    else
      flash[:danger] = "Missing title or body"
      render action: :new
    end
  end

  def edit
    @entry = Entry.find(params[:id])
    @entry.spaced_tags = @entry.tags.map(&:tagType).join(" ")
  end

  def update
    @entry = Entry.find(params[:id])
    @entry.title = params[:entry][:title]
    @entry.body = params[:entry][:body]
    if @entry.valid?
      @entry.tags = []
      params[:entry][:spaced_tags].split(" ").each do |tag|
        newTag = Tag.find_or_create_by(tagType: tag)
        @entry.tags << newTag
      end
      @entry.save
      redirect_to root_path
    else
      flash[:danger] = "Missing title or body"
      redirect_to edit_entry_path(@entry)
    end
  end

  private

    def signed_in_user
      redirect_to root_path unless signed_in?
    end
end
