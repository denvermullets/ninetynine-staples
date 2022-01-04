Rails.application.routes.draw do
  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      resources :magic_cards
      resources :magic_card_keywords
      resources :magic_card_rulings
      resources :magic_card_color_idents
      resources :magic_card_colors
      resources :magic_card_types
      resources :magic_card_super_types
      resources :magic_card_sub_types
      resources :magic_card_artists
      resources :card_prices
      resources :printings
      resources :boxsets
      resources :colors
      resources :rulings
      resources :keywords
      resources :card_types
      resources :super_types
      resources :sub_types
      resources :artists
    end
  end
end
