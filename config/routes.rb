Rails.application.routes.draw do
  resources :employees
  resources :projects do
    resources :features
  end
end
