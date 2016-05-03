class LinksController < ApplicationController
	attr_accessor :short_url, :link

  def index
  	@links = Link.all	
  end	

  def new
  	@link = Link.new
  end

  def create
  	@link = Link.new(params.require(:link).permit(:link, :short_url))
  	@link.short_url = root_url + rand(36**4).to_s(36)
  	if @link.save
  		flash[:link_id] = @link.id
  		redirect_to new_link_path
  	else
  		render "new"
  	end
  end

  def show
  	@link = Link.find(params[:id])
  	redirect_to @link.link
  end

  def show_alt
  	@link = Link.find(params[:alt])
  	redirect_to @link.link
  end



end
