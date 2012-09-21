Searchable::Engine.routes.draw do
  

  root :to => "search#index"
  post '/form' => "search#search_form" , :as => "search_form"
  post '/search' => "search#search" , :as => "search"
  
  
end
