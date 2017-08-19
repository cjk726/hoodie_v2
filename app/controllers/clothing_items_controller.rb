class ClothingItemsController < ApplicationController
  def index
    @clothing_items = ClothingItem.page(params[:page]).per(10)

    render("clothing_items/index.html.erb")
  end

  def show
    @outfit_item = OutfitItem.new
    @clothing_item = ClothingItem.find(params[:id])

    render("clothing_items/show.html.erb")
  end

  def new
    @clothing_item = ClothingItem.new

    render("clothing_items/new.html.erb")
  end

  def create
    @clothing_item = ClothingItem.new

    @clothing_item.item_name = params[:item_name]

    save_status = @clothing_item.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/clothing_items/new", "/create_clothing_item"
        redirect_to("/clothing_items")
      else
        redirect_back(:fallback_location => "/", :notice => "Clothing item created successfully.")
      end
    else
      render("clothing_items/new.html.erb")
    end
  end

  def edit
    @clothing_item = ClothingItem.find(params[:id])

    render("clothing_items/edit.html.erb")
  end

  def update
    @clothing_item = ClothingItem.find(params[:id])

    @clothing_item.item_name = params[:item_name]

    save_status = @clothing_item.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/clothing_items/#{@clothing_item.id}/edit", "/update_clothing_item"
        redirect_to("/clothing_items/#{@clothing_item.id}", :notice => "Clothing item updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Clothing item updated successfully.")
      end
    else
      render("clothing_items/edit.html.erb")
    end
  end

  def destroy
    @clothing_item = ClothingItem.find(params[:id])

    @clothing_item.destroy

    if URI(request.referer).path == "/clothing_items/#{@clothing_item.id}"
      redirect_to("/", :notice => "Clothing item deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Clothing item deleted.")
    end
  end
end
