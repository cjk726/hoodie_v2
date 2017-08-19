Rails.application.routes.draw do
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
