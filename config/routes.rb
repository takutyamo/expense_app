Rails.application.routes.draw do
  devise_for :users
  resource :company
  resources :expense
  resources :expense_approval

  root 'welcome#home'

  get 'employee/new' => 'companies#employee_new'
  post 'employee/create' => 'companies#employee_create'

  post 'expense_approval/:id' => 'expense_approval#create'
  get 'expense_approval/approval/:id' => 'expense_approval#approval'
end
