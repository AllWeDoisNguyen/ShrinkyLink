class LinksController < ApplicationController
  before_action :params_permit, only: [:new] 
	

  def index
  	@links = Link.all	
  end	

  def new
  	@link = Link.new
  end

  def create
  	@link = Link.new link_params
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


  private

  def link_params
    params.require(:link).permit(:link, :short_url)
  end

  def params_permit
    params.permit(:show_all)
  end



end
