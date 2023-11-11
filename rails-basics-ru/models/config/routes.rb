# frozen_string_literal: true

Rails.application.routes.draw do
  # BEGIN
  root 'home#index'
  # get 'articles/index'
  # get 'articles/show'
  resources :articles, only: [:index, :show]
  # , as: 'article'
  # END
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
