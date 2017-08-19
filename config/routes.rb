Rails.application.routes.draw do
  # Routes for the Outfit_item resource:
  # CREATE
  get "/outfit_items/new", :controller => "outfit_items", :action => "new"
  post "/create_outfit_item", :controller => "outfit_items", :action => "create"

  # READ
  get "/outfit_items", :controller => "outfit_items", :action => "index"
  get "/outfit_items/:id", :controller => "outfit_items", :action => "show"

  # UPDATE
  get "/outfit_items/:id/edit", :controller => "outfit_items", :action => "edit"
  post "/update_outfit_item/:id", :controller => "outfit_items", :action => "update"

  # DELETE
  get "/delete_outfit_item/:id", :controller => "outfit_items", :action => "destroy"
  #------------------------------

  # Routes for the Outfit resource:
  # CREATE
  get "/outfits/new", :controller => "outfits", :action => "new"
  post "/create_outfit", :controller => "outfits", :action => "create"

  # READ
  get "/outfits", :controller => "outfits", :action => "index"
  get "/outfits/:id", :controller => "outfits", :action => "show"

  # UPDATE
  get "/outfits/:id/edit", :controller => "outfits", :action => "edit"
  post "/update_outfit/:id", :controller => "outfits", :action => "update"

  # DELETE
  get "/delete_outfit/:id", :controller => "outfits", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
