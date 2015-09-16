Rails.application.routes.draw do
  root "questions#index"
  resources :questions do
    resources :answers, only: :create
  end
    # resources :answers
end
