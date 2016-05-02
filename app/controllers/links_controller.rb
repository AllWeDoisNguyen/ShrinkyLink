class LinksController < ApplicationController
	attr_accessor :short_url, :link

  def new
  	@short_url = Link.new
  end

  def create
  	@short_url = Link.new(params.require(:link).permit(:link, :short_url))
  	if @short_url.save
  		flash[:short_url_id] = @short_url.id
  		redirect_to new_link_path
  	else
  		render "new"
  	end
  end

  def show
  	@short_url = Link.find(params[:id])
  	redirect_to @short_url.link
  end


end
