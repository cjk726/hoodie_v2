class OutfitsController < ApplicationController
  before_action :current_user_must_be_outfit_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_outfit_user
    outfit = Outfit.find(params[:id])

    unless current_user == outfit.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @outfits = current_user.outfits.page(params[:page]).per(10)

    render("outfits/index.html.erb")
  end

  def show
    @outfit = Outfit.find(params[:id])

    render("outfits/show.html.erb")
  end

  def new
    @outfit = Outfit.new

    render("outfits/new.html.erb")
  end

  def create
    @outfit = Outfit.new

    @outfit.user_id = params[:user_id]
    @outfit.comfort_zone_id = params[:comfort_zone_id]

    save_status = @outfit.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/outfits/new", "/create_outfit"
        redirect_to("/outfits")
      else
        redirect_back(:fallback_location => "/", :notice => "Outfit created successfully.")
      end
    else
      render("outfits/new.html.erb")
    end
  end

  def edit
    @outfit = Outfit.find(params[:id])

    render("outfits/edit.html.erb")
  end

  def update
    @outfit = Outfit.find(params[:id])
    @outfit.comfort_zone_id = params[:comfort_zone_id]

    save_status = @outfit.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/outfits/#{@outfit.id}/edit", "/update_outfit"
        redirect_to("/outfits/#{@outfit.id}", :notice => "Outfit updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Outfit updated successfully.")
      end
    else
      render("outfits/edit.html.erb")
    end
  end

  def destroy
    @outfit = Outfit.find(params[:id])

    @outfit.destroy

    if URI(request.referer).path == "/outfits/#{@outfit.id}"
      redirect_to("/", :notice => "Outfit deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Outfit deleted.")
    end
  end
end
