Rails.application.routes.draw do
  devise_for :users
  resource :company
  resources :expense
  resources :expense_approval

  root 'welcome#home'

  get 'employees' => 'employee#index'
  get 'employee/new' => 'employee#new'
  post 'employee/create' => 'employee#create'

  post 'expense_approval/:id' => 'expense_approval#create'
  get 'expense_approval/approval/:id' => 'expense_approval#approval'
end
