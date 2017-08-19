class OutfitItemsController < ApplicationController
  def index
    @outfit_items = OutfitItem.all

    render("outfit_items/index.html.erb")
  end

  def show
    @outfit_item = OutfitItem.find(params[:id])

    render("outfit_items/show.html.erb")
  end

  def new
    @outfit_item = OutfitItem.new

    render("outfit_items/new.html.erb")
  end

  def create
    @outfit_item = OutfitItem.new

    @outfit_item.outfit_id = params[:outfit_id]
    @outfit_item.clothing_item_id = params[:clothing_item_id]

    save_status = @outfit_item.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/outfit_items/new", "/create_outfit_item"
        redirect_to("/outfit_items")
      else
        redirect_back(:fallback_location => "/", :notice => "Outfit item created successfully.")
      end
    else
      render("outfit_items/new.html.erb")
    end
  end

  def edit
    @outfit_item = OutfitItem.find(params[:id])

    render("outfit_items/edit.html.erb")
  end

  def update
    @outfit_item = OutfitItem.find(params[:id])

    @outfit_item.outfit_id = params[:outfit_id]
    @outfit_item.clothing_item_id = params[:clothing_item_id]

    save_status = @outfit_item.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/outfit_items/#{@outfit_item.id}/edit", "/update_outfit_item"
        redirect_to("/outfit_items/#{@outfit_item.id}", :notice => "Outfit item updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Outfit item updated successfully.")
      end
    else
      render("outfit_items/edit.html.erb")
    end
  end

  def destroy
    @outfit_item = OutfitItem.find(params[:id])

    @outfit_item.destroy

    if URI(request.referer).path == "/outfit_items/#{@outfit_item.id}"
      redirect_to("/", :notice => "Outfit item deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Outfit item deleted.")
    end
  end
end
