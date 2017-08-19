class ComfortZonesController < ApplicationController
  def index
    @comfort_zones = ComfortZone.all

    render("comfort_zones/index.html.erb")
  end

  def show
    @comfort_zone = ComfortZone.find(params[:id])

    render("comfort_zones/show.html.erb")
  end

  def new
    @comfort_zone = ComfortZone.new

    render("comfort_zones/new.html.erb")
  end

  def create
    @comfort_zone = ComfortZone.new

    @comfort_zone.comfort_zone_name = params[:comfort_zone_name]
    @comfort_zone.comfort_zone_temp_min = params[:comfort_zone_temp_min]

    save_status = @comfort_zone.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/comfort_zones/new", "/create_comfort_zone"
        redirect_to("/comfort_zones")
      else
        redirect_back(:fallback_location => "/", :notice => "Comfort zone created successfully.")
      end
    else
      render("comfort_zones/new.html.erb")
    end
  end

  def edit
    @comfort_zone = ComfortZone.find(params[:id])

    render("comfort_zones/edit.html.erb")
  end

  def update
    @comfort_zone = ComfortZone.find(params[:id])

    @comfort_zone.comfort_zone_name = params[:comfort_zone_name]
    @comfort_zone.comfort_zone_temp_min = params[:comfort_zone_temp_min]

    save_status = @comfort_zone.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/comfort_zones/#{@comfort_zone.id}/edit", "/update_comfort_zone"
        redirect_to("/comfort_zones/#{@comfort_zone.id}", :notice => "Comfort zone updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Comfort zone updated successfully.")
      end
    else
      render("comfort_zones/edit.html.erb")
    end
  end

  def destroy
    @comfort_zone = ComfortZone.find(params[:id])

    @comfort_zone.destroy

    if URI(request.referer).path == "/comfort_zones/#{@comfort_zone.id}"
      redirect_to("/", :notice => "Comfort zone deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Comfort zone deleted.")
    end
  end
end
