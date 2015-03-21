class EntriesController < ApplicationController
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
end
