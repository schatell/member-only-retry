class MicropostsController < ApplicationController

  def new
    @micropost = current_user.microposts.build
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      render :action => :index
    else
      render 'static_pages/home'
    end
  end

  def index
    @microposts = Micropost.paginate(page: params[:page])
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content)
  end
end
