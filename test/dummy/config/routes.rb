Rails.application.routes.draw do

  mount Searchable::Engine => "/searchable"
end
